const mongoose = require('mongoose');
const StepsSchema = new mongoose.Schema(
    { 
        timestamp:{
            type: Number,
            default: Date.now
        },
        target:{
            type:Number
        },
        stepsTaken:{
            type:Number
          
        },distance:{
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