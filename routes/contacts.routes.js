const express = require('express');
const { catchError } = require('../middleware/errors');

const router = express.Router();

const auth = require('../middleware/auth.middleware');
const contactsController = require('../controllers/contacts.controller');

router.get(
  '/',
  auth,
  catchError(contactsController.get),
);

router.post(
  '/',
  auth,
  catchError(contactsController.add),
);

router.get(
  '/:id',
  auth,
  catchError(contactsController.get),
);

router.patch(
  '/:id',
  auth,
  catchError(contactsController.update),
);

router.delete(
  '/:id',
  auth,
  catchError(contactsController.del),
);

module.exports = router;
