// *NPM Packages
const jwt = require('jsonwebtoken');

// *Models
const User = require('../models/user');

// Protect routes for user
exports.protectUser = async (req, res, next) => {
    let token;
    if(req.headers.authorization && req.headers.authorization.startsWith('Bearer'))
    {
        token=req.headers.authorization.split(' ')[1];

    }else if(req.user)
    {
       
    }else if(req.session.token)
    {
         token = req.session.token;
    }

        //If the token does not exist
        if(!token && req.user === null)
        {
            return res.status(401).json({
                success: false,
                message: 'Not authorized to access this route',
        });

        }

        try{
            if(req.user){
                next();
            }else{
                //verify the token
                const decoded=jwt.verify(token,process.env.TOKEN_SECRET);
                console.log(decoded);
                console.log("decoded id ")
                console.log(decoded._id);
                req.user = await User.findById(decoded._id);
               next();
                
            }
        }catch(err){
            console.log(err)
            return res.status(400).send({ error: "unauthorised access" })
        }
    };