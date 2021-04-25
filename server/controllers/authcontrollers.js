    // * Utils
    const { check, validationResult } = require('express-validator');
    // *NPM Packages
    const jwt = require('jsonwebtoken');
    const bcrypt = require('bcryptjs');

    // * Models
    const User = require('../models/user');


    //Route to register User
    //matches passwords
    module.exports.signup = async (req, res) => {
        console.log('signup-route');
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
        return res.status(400).send('error occured');
        }
        else
        {
                try{
                  const { name, email, password,gender,phone,height,weight } = req.body;
                  const user = await User.findOne({ email: email })
                  if (user) {
                console.log("User already exists");
                return res.send('User already exists').status(500)
                      }
                  
                  const newUser = new User({
                    name, 
                    email, 
                    password, 
                    gender,
                    phone,
                    height,
                    weight
                  }) ;
                  console.log(newUser.id)
                  newUser.save();
                  return res.send('User registered').status(200);
                }catch(err){
                  console.log(err)
                  return res.send(err.message).status(500)
                }
                
        }
      }
    

        
    //

      module.exports.login = async (req, res) => {
        console.log('login-route')
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
          return res.status(400).send('error occured');
        }
        const { email, password } = req.body;
        //to check if the user  exists
        try {
          let user = await User.findOne({ email: email });
      
          if (!user) {
            return res.status(400).send('User does not exist');
          }
          const isMatch = await bcrypt.compare(password, user.password);
          if (!isMatch) {
            return res.status(400).send('Invalid credentials');
          }
          res.send('user succesfully logged in')
          console.log('logged in ');
          
        } catch (err) {
          console.log(err);
          return res.status(500).send('Server error');
        }
    

        
      };