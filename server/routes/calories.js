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
router.get('/getcalories',[protectUser],calorieController.getcalories);
router.put('/update',[protectUser],calorieController.update);
module.exports = router;