// * NPM Packages
const express = require('express');
const { check, validationResult } = require('express-validator');
const passport = require('passport');

const router = express.Router();

// * Controllers
const authController = require('../controllers/authcontrollers');

// * Middlewares
const { protectUser } = require('../middleware/auth'); 

router.post('/signup',authController.signup);
router.post('/login',authController.login);
router.put('/update',[protectUser],authController.update);
router.get('/getBMI',[protectUser],authController.getBMI);
router.get('/myprofile',[protectUser],authController.myprofile);
module.exports = router;