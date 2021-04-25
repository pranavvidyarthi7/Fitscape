const mongoose = require('mongoose');
require('dotenv').config();
const db = process.env.MONGO_URI;

mongoose.Promise = global.Promise;

const connectDB = async () => {
  try {
    await mongoose.connect(db, {
      useNewUrlParser: true,
      useCreateIndex: true,
      useFindAndModify: false,
      useUnifiedTopology: true,
    });
    console.log('Mongo db connected');
  } catch (error) {
    console.log(error.message);
    process.exit(1);
  }
};

module.exports = connectDB;