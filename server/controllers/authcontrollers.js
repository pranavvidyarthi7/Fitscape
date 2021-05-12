    // * Utils
    const { check, validationResult } = require('express-validator');
    // *NPM Packages
    const jwt = require('jsonwebtoken');
    const bcrypt = require('bcryptjs');

    // * Models
    const User = require('../models/user');
    const Water = require('../models/waterintake');
    const Calories = require('../models/calories');
    const Steps = require('../models/steps');


    //Route to register User
    //matching passwords handled on the frontend
    module.exports.signup = async (req, res) => {
        console.log('signup-route');
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
        return res.status(400).send('error occured');
        }
        else
        {
                try{
                 
                  const { email, password,role} = req.body;
                  const user = await User.findOne({ email: email })
                  if (user) {
                console.log("User already exists");
                return res.status(500).send({ error: "user already exist" });
                
                      }
                      function generateAccessToken(user) {
                        return jwt.sign(user, process.env.TOKEN_SECRET);
                      }
                  
                  const newUser = new User({
                   
                    email, 
                    password, 
                    role
                   
                  }) ;
                  console.log(newUser.id)
                  newUser.save();
                  const token = generateAccessToken({_id: newUser.id });
                
                
                  return res.json(token).status(200);
                }catch(err){
                  console.log(err)
                  return res.status(404).send({ error: "server error" });
                }
                
        }
      }
    

        
    //Route to login user

      module.exports.login = async (req, res) => {
        console.log('login-route')
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
          return res.status(404).send({ error: "validation error" });
        }
        const { email, password } = req.body;
        //to check if the user  exists
        try {
          let user = await User.findOne({ email: email });
      
          if (!user) {
            return res.status(404).send({ error: "user does not exist" });
          }
          const isMatch = await bcrypt.compare(password, user.password);
          if (!isMatch) {
            return res.status(404).send({ error: "Invalid credentials" });
           
          }
          res.send('user succesfully logged in')
          console.log('logged in ');
          
        } catch (err) {
          console.log(err);
          return res.status(500).send({ error: "server error" });
         
        }
    

        
      };


      //Route to update user profile
      //Fill in details like
      //Gender,Height,Weight
      module.exports.update = async(req,res) =>{
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
        return res.status(400).send('error occured');
        }
        console.log('update-route')
        try {
          if (req.body.email) {
            return res.status(500).send({ error: "email cannot be chnaged" });
          }
          if(req.body.role)
          {
            return res.status(500).send({ error: "You cannot set the role" });
          }
          

            console.log(req.user.id)
            const updateData = { ... req.body };
            const user = await User.findByIdAndUpdate(req.user.id, updateData, {
            new: true,
            runValidators: true,
            }).exec();

              if (!user) {
               return next(new ErrorResponse('No user found', 400));
              }

              return res.status(200).json('profile updated')
        }catch(err){
            console.log(err);
            return  res.status(500).send({ error: "server error" });
          }
       
      
    }
    


    //Route to get user profile
    module.exports.myprofile = async(req,res) =>{
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
      return res.status(400).send('error occured');
      }
        try {
        //console.log(req.user);
        const user = await User.findById(req.user.id);
        const water = await Water.findOne({belongsTo:req.user.id})
        const calories = await Calories.findOne({belongsTo:req.user.id})
        const steps = await Steps.findOne({belongsTo:req.user.id})
        const username=user.name;
        const height=user.height
        const weight=user.weight
        const dashboard ={
          user,
         username,
         weight,
         height,
         water,
         calories,
        steps,
          
        }
        if (!user) {
          return  res.status(400).send({ error: "No user found" });
         
        }
          res.status(200).json({
            success: true,
            data: dashboard,
          });
        } catch (err) {
          console.log(err);
          return  res.status(500).send({ error: "server error" });
         
        }
     

    }

    //Route to calculate and get user BMI
    module.exports.getBMI = async(req,res) =>{
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
      return res.status(400).send('error occured');
      }
      try {
        //console.log(req.user);
        const user = await User.findById(req.user.id);
        if (!user) {

          return  res.status(400).send({ error: "No user found" });
         
        }
        const weight = user.weight.split(" ")[0]
        const weightUnit = user.weight.split(" ")[1]
             
        const height = user.height.split(" ")[0]
        const heightUnit = user.height.split(" ")[1]
         
        if(weightUnit.toLowerCase() === 'lbs' )
        {
          weight=weight*0.45359237;
        }
        if(heightUnit.toLowerCase() === 'cm' )
        {
          height=height*0.01;
        }
        if(heightUnit.toLowerCase() === 'ft' )
        {
          height=height*0.3048;
        }

 
        //const BMI=0;
        //console.log(user.weight)
        const BMI =  weight/(height * height);
        const updateData = {bmi:BMI};
            const updateduser = await User.findByIdAndUpdate(req.user.id, updateData, {
            new: true,
            runValidators: true,
            }).exec();
        
        res.status(200).json({
          success: true,
        });
      } catch (err) {
        console.log(err);
        return  res.status(500).send({ error: "server error" });
       
      }
   

  }
