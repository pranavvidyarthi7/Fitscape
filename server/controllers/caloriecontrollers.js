// * Utils
const { check, validationResult } = require('express-validator');

    // * Models
    const User = require('../models/user');
    const Calorie = require('../models/calories')


//Route to set calroie burning target
module.exports.settarget=async(req,res) =>{
    console.log('setting calorie burn target route');
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
    return res.status(400).send('error occured');
    }
    else
    {
        try{
            const{caloriesConsumed,caloriesBurned,target}=req.body
            //const user = await User.findById(req.user.id)
            const calories = new Calorie({
                caloriesConsumed,
                caloriesBurned,
                target,
                belongsTo:req.user.id
            });
            console.log(calories);
            calories.save();
            return res.status(200).send("calorie burning target set");
        }catch(err){
            console.log(err)
                  return res.status(404).send({ error: "server error" });
        }
        


    }
}

//Route to update calories data
module.exports.update=async(req,res) =>{
    console.log('update calories data');
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
    return res.status(400).send('error occured');
    }
    else
    {
        try{
            const updateData = { ...req.body };
            const calories = await Calorie.findOneAndUpdate({belongsTo:req.user.id},updateData,{
                returnOriginal:false
            })
            if(calories != null)
            {
                if(calories.timestamp != Date.now())
                {
                    calories.consumed=0
                }
                
            }
           
            
              //calories.save();
              console.log(calories);
           
            return res.status(200).send("calories updated");
        }catch(err){
            console.log(err)
                  return res.status(404).send({ error: "server error" });
        }
        


    }
}




//Route to get calories data
module.exports.getcalories=async(req,res) =>{
    console.log('get calories data');
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
    return res.status(400).send('error occured');
    }
    else
    {
        try{
            
            const caloriesData = await Calorie.findOne({belongsTo:req.user.id})
           
            
            
            
              
              console.log(caloriesData);
           
            return res.status(200).json({
                success: true,
                data:caloriesData
            })
        }catch(err){
            console.log(err)
                  return res.status(404).send({ error: "server error" });
        }
        


    }
}
