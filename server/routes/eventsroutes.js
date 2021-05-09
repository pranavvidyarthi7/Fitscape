// * NPM Packages
const express = require('express');
const { check, validationResult } = require('express-validator');
const passport = require('passport');

const router = express.Router();

// * Controllers
const eventController = require('../controllers/eventcontrollers.js');

// * Middlewares
const { protectUser } = require('../middleware/auth'); 
const {protectAdmin} = require('../middleware/auth');

router.post('/addevent',[protectAdmin],eventController.addevent);
router.get('/getevents',[protectUser],eventController.getevents);

module.exports = router;