// * Utils
const { check, validationResult } = require('express-validator');

    // * Models
const Step = require('../models/steps');
const User = require('../models/user')

//Route to set steps target
module.exports.settarget=async(req,res) =>{
    console.log('setting step target');
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
    return res.status(400).send('error occured');
    }
    else
    {
        try{
            const{target,stepsTaken,distance}=req.body
            const user = await User.findById(req.user.id)
            const Step = new Step({
                target,
                stepsTaken,
                distance,
                belongsTo:user
            });
            //console.log(Step);
           console.log("calorie burning target set")
            return res.status(200).json(Step);
        }catch(err){
            console.log(err)
                  return res.status(404).send({ error: "server error" });
        }
        


    }
}

//Route to update steps
module.exports.update=async(req,res) =>{
    console.log('update steps');
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
    return res.status(400).send('error occured');
    }
    else
    {
        try{
            const updateData = { ...req.body };
            const stepsData = await Step.findOneAndUpdate({belongsTo:req.user.id},updateData,{
                returnOriginal:false
            })
            if(stepsData.timestamp != Date.now())
            {
                stepsData.consumed=0
            }
            
            
              //stepsData.save();
              console.log(stepsData);
           
            return res.status(200).send("steps data updated");
        }catch(err){
            console.log(err)
                  return res.status(404).send({ error: "server error" });
        }
        


    }
}
