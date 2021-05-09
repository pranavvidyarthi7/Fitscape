// * NPM Packages
const express = require('express');
const { check, validationResult } = require('express-validator');
const passport = require('passport');

const router = express.Router();

// * Controllers
const waterController = require('../controllers/watercontrollers');

// * Middlewares
const { protectUser } = require('../middleware/auth'); 

router.post('/settarget',[protectUser],waterController.settarget);
router.put('/updateintake',[protectUser],waterController.updateintake);
router.get('/getconsumed',[protectUser],waterController.getconsumed);
module.exports = router;