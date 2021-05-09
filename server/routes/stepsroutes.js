// * NPM Packages
const express = require('express');
const { check, validationResult } = require('express-validator');
const passport = require('passport');

const router = express.Router();

// * Controllers
const stepsController = require('../controllers/stepscontrollers.js');

// * Middlewares
const { protectUser } = require('../middleware/auth'); 

router.post('/settarget',[protectUser],stepsController.settarget);
router.put('/update',[protectUser],stepsController.update);
router.get('/getsteps',[protectUser],stepsController.getsteps);

module.exports = router;