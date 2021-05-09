// * Utils
const { check, validationResult } = require('express-validator');

    // * Models
const Event = require('../models/events');


//Route to set water target
module.exports.addevent=async(req,res) =>{
    console.log('add event routes');
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
    return res.status(400).send('error occured');
    }
    else
    {
            try{
             
              const { name,description,time,date,place} = req.body;
              const newEvent = new Event({
               
                name,
                description,
                category,
                time,
                date,
                place,
                createdBy:req.user.id
               
              }) ;
              console.log(newEvent)
              newEvent.save();
             return res.json(newEvent).status(200);
            }catch(err){
              console.log(err)
              return res.status(404).send({ error: "server error" });
            }
            
    }
   
}    

//Route to set water target
module.exports.getevents=async(req,res) =>{
    console.log('get events routes');
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).send('error occured');
        }
        else
        { 
            try{
                const events = await Event.find({});
                if(!events)
                {
                                 return res.status(200).send('no events exists');
                }
                else
                {
                    return res.json(events).status(200);
                }

            }catch(err)
            {
                console.log(err)
              return res.status(404).send({ error: "server error" });
            }
        }
   

   
}

