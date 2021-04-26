    // * Utils
    const { check, validationResult } = require('express-validator');
    // *NPM Packages
    const jwt = require('jsonwebtoken');
    const bcrypt = require('bcryptjs');

    // * Models
    const User = require('../models/user');


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
                  const { email, password} = req.body;
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
        console.log('update-route')
        try {
          if (req.body.email) {
            return res.status(500).send({ error: "email cannot be chnaged" });
          }

            console.log(req.user.id)
            const updateData = { ...req.body };
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
