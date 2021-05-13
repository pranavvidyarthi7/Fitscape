const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');

const UserSchema = new mongoose.Schema(
    { 
        name:{
            
            type:String
        },
        avatar:{
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
            
            type:String,
            
               
        
        },
       
        weight:{
            
            type:String,
            
           
        },
       
        bmi:{
           
            type:Number
        },
        age:{
            type:Number
        },
        pregnant:{
            type:String,
            default:"pregnant0"
        },lifestyle:
        {
            type:Number,
            default:0
        },
        role:{
            type: String,
            default: 'USER',
            enum : ['ADMIN','USER']
           
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