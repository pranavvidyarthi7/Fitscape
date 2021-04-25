// * NPM Packages
const express = require('express');
const { check, validationResult } = require('express-validator');
const passport = require('passport');

const router = express.Router();
// * Controllers
const authController = require('../controllers/authcontrollers');
router.post('/signup',authController.signup);
router.post('/login',authController.login,);
module.exports = router;