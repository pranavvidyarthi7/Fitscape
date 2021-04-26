const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');

const UserSchema = new mongoose.Schema(
    { 
        name:{
            
            type:String
        },
        email:{
            required:true,
            type:String,
            unique: true,
            trim: true
        },
        password:{
            required:true,
            type:String,
            trim: true,
        },
        gender:{
           
            type:String
        },
       phone:{
           
            type:Number,
            minlength: 10,
            maxlength: 10,
        },
        height:{
            
            type:Number
        },
        weight:{
            
            type:Number
        },
        bmi:{
           
            type:Number
        },
        steps:{
           
            type:Number
        },
        calorieintake:{
           
            type:Number
        },
        calorieburnt:{
           
            type:Number
        },
        distancetravelled:{
           
            type:Number
        }
    });
    // Encrypt password using bcrypt
UserSchema.pre('save', async function (next) {
    // Check if the password is modified or not, if it is not then move along, don't perform the hashing stuff
    if (!this.isModified('password')) {
      next();
    }
    const salt = await bcrypt.genSalt(10);
    this.password = await bcrypt.hash(this.password, salt);
  });


const UserModel = mongoose.model('UserModel', UserSchema);
module.exports = UserModel;