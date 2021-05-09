// * NPM Packages
const express = require('express');
const { check, validationResult } = require('express-validator');
const passport = require('passport');

const router = express.Router();

// * Controllers
const calorieController = require('../controllers/caloriecontrollers.js');

// * Middlewares
const { protectUser } = require('../middleware/auth'); 


router.post('/settarget',[protectUser],calorieController.settarget);
router.put('/update',[protectUser],waterController.update);
module.exports = router;