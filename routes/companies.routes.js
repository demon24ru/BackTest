const express = require('express');
const multer = require('multer');
const config = require('../config.json');

const fileHandler = multer({ dest: config.uploads_dir });
const router = express.Router();

const auth = require('../middleware/auth.middleware');
const { catchError } = require('../middleware/errors');
const companiesController = require('../controllers/companies.controller');

const filesParamsValidator = require('../middleware/validators/files.params.validator');
const filesController = require('../controllers/files.controller');

router.get(
  '/',
  auth,
  catchError(companiesController.get),
);

router.post(
  '/',
  auth,
  catchError(companiesController.add),
);

router.get(
  '/:id',
  auth,
  catchError(companiesController.get),
);

router.patch(
  '/:id',
  auth,
  catchError(companiesController.update),
);

router.delete(
  '/:id',
  auth,
  catchError(companiesController.del),
);

router.post(
  '/:id/image',
  auth,
  fileHandler.fields([{ name: 'file', maxCount: 1 }]),
  filesParamsValidator.addCompanyImage,
  filesController.saveImage,
);

router.delete(
  '/:id/image/:image_name',
  auth,
  filesParamsValidator.removeCompanyImage,
  filesController.removeImage,
);

module.exports = router;
