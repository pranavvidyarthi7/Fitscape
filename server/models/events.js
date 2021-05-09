const mongoose = require('mongoose');
const eventSchema = new mongoose.Schema(
    { 
        name:{
            required:true,
            type:String
        },
        description:{
            required:true,
            type:String
        },
        category:{
            required:true,
            type:String
        },
        time:{
            required:true,
            type:String
        },
        date:{
            required:true,
            type:Date
        },
        place:{
            required:true,
            type:String
        },
        createdAt:{
            type: Number,
            default: Date.now,
            required:true,
        },
        createdBy:{
            type: mongoose.Schema.ObjectId,
            ref: 'users',
            required: true,
        }
    });

    const EventModel = mongoose.model('EventModel', eventSchema);
module.exports = EventModel;