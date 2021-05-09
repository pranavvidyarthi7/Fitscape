// *NPM Packages
const express = require('express');
const passport = require('passport');
const bodyParser=require('body-parser')
const app = express();
// *Config
const connectdb = require('./config/db');
const passportSetup = require('./config/passport-setup');
require('dotenv').config({ path: __dirname + '/.env' });

//initiaise passport
app.use(passport.initialize());
app.use(passport.session());
app.use(bodyParser.json()) // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true }))
// *Routes
const userroutes = require('./routes/userroutes.js');
const waterroutes = require('./routes/water.js')
const eventroutes = require('./routes/eventsroutes.js')

// access config var
process.env.TOKEN_SECRET;

const PORT = process.env.PORT || 3000;

// *Connect to database
connectdb();


//add middlewares
app.use(express.json({ extended: false }));

//initiaise passport
app.use(passport.initialize());
app.use(passport.session());

// *Routes
app.use('/api/user', userroutes);
app.use('/api/water', waterroutes);
app.use('/api/events', eventroutes);

const server = app.listen(PORT, console.log(`Server started on Port ${PORT}`));