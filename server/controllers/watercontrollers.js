// * Utils
const { check, validationResult } = require('express-validator');

    // * Models
    const User = require('../models/user');
    const Water = require('../models/waterintake')

//Route to set water target
module.exports.settarget=async(req,res) =>{
    console.log('setting intial water target -route');
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
    return res.status(400).send('error occured');
    }
    else
    {
        try{
            const{waterconsumed,target}=req.body
            const user = await User.findById(req.user.id)
            const waterIntake = new Water({
                waterconsumed,
                target,
                belongsTo:user
            });
            console.log(waterIntake);
            waterIntake.save();
            return res.status(200).send("water target set");
        }catch(err){
            console.log(err)
                  return res.status(404).send({ error: "server error" });
        }
        


    }
}

module.exports.updateintake=async(req,res) =>{
    console.log('update water intake route');
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
    return res.status(400).send('error occured');
    }
    else
    {
        try{
            const waterIntake = await Water.findOneAndUpdate({belongsTo:req.user.id},updateData,{
                returnOriginal:false
            })
            if(waterIntake.timestamp != Date.now())
            {
                waterIntake.consumed=0
            }
            const updateData = { ...req.body };
            
              //waterIntake.save();
              console.log(waterIntake);
           
            return res.status(200).send("water intake updated");
        }catch(err){
            console.log(err)
                  return res.status(404).send({ error: "server error" });
        }
        


    }
}


module.exports.getconsumed=async(req,res) =>{
    console.log('water consumed-route');
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
    return res.status(400).send('error occured');
    }
    else
    {
        try{
            //const user = await User.findById(req.user.id)
            const waterConsumed = await Water.findOne({belongsTo:req.user.id})
            const water = {
                target:waterConsumed.target,
                consumed:waterConsumed.waterconsumed
            }
            return res.status(200).json(water);
        }catch(err){
            console.log(err)
                  return res.status(404).send({ error: "server error" });
        }
        


    }
}