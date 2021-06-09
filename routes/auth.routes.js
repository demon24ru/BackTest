const { Router } = require('express');
const { catchError } = require('../middleware/errors');

const controller = require('../controllers/auth.controller');

const router = Router();

router.post(
  '/login',
  catchError(controller.login),
);

router.post(
  '/signup',
  catchError(controller.signup),
);

module.exports = router;
