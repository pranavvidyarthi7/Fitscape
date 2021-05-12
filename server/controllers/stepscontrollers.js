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
            const{target,stepsTaken,distanceTarget,distanceCovered}=req.body
            const user = await User.findById(req.user.id)
            const newStep = new Step({
                target,
                stepsTaken,
                distanceTarget,
                distanceCovered,
                belongsTo:user
            });
            //console.log(Step);
            await newStep.save();
           console.log(newStep)
            return res.status(200).json(newStep);
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
            if(stepsData != null)
            {
                if(stepsData.timestamp != Date.now())
                {
                    stepsData.consumed=0
                }
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


//Route to get steps data
module.exports.getsteps=async(req,res) =>{
    console.log('get steps data');
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
    return res.status(400).send('error occured');
    }
    else
    {
        try{
            
            const stepsData = await Step.findOne({belongsTo:req.user.id})
           
            
            
            
              
              console.log(stepsData);
           
            return res.status(200).json({
                success: true,
                data:stepsData
            })
        }catch(err){
            console.log(err)
                  return res.status(404).send({ error: "server error" });
        }
        


    }
}
