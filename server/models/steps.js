const mongoose = require('mongoose');
const StepsSchema = new mongoose.Schema(
    { 
        timestamp:{
            type: Number,
            default: Date.now,
            required: true
        },
        target:{
            type:Number
        },
        stepsTaken:{
            type:Number
          
        },distanceTarget:{
            type:Number
        },
        distanceCovered:{
            type:Number
        },
        belongsTo:{
            type: mongoose.Schema.ObjectId,
            ref: 'users',
            required: true,
        }
    });



const StepsModel = mongoose.model('StepsModel', StepsSchema);
module.exports = StepsModel;