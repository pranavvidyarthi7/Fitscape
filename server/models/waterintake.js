const mongoose = require('mongoose');
const WaterIntakeSchema = new mongoose.Schema(
    { 
        timestamp:{
            type: Number,
            required:true,
            default: Date.now
        },
        waterconsumed:{
            type:Number,
           
        },
        target:{
            type:Number,
            default:'7'
        },
        belongsTo:{
            type: mongoose.Schema.ObjectId,
            ref: 'users',
            required: true,
        }

        
    });



const WaterIntakeModel = mongoose.model('WaterIntakeModel', WaterIntakeSchema);
module.exports =WaterIntakeModel;