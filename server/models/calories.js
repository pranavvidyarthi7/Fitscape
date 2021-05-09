const mongoose = require('mongoose');
const CaloriesSchema = new mongoose.Schema(
    { 
        timestamp:{
            type: Number,
            default: Date.now
        },
        caloriesConsumed:{
            type:Number,
           default:0
        },
        caloriesBurned:{
            type:Number,
           
        },
        belongsTo:{
            type: mongoose.Schema.ObjectId,
            ref: 'users',
            required: true,
        }

        
    });



const CaloriesModel = mongoose.model('CaloriesModel', CaloriesSchema);
module.exports = CaloriesModel;