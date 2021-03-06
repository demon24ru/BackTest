const express = require('express');
const { catchError } = require('../middleware/errors');

const router = express.Router();

const auth = require('../middleware/auth.middleware');
const contactsController = require('../controllers/contacts.controller');

router.get(
  '/',
  auth,
  catchError(contactsController.get),
  /* #swagger.tags = ['Contact']
  #swagger.security = [{
               "BearerAuth": []
        }]
   #swagger.description = 'Запрос всех контактов или контактов по фильтру.'
   #swagger.parameters['limit'] = { description: 'Кол-во результатов в ответе.',
               type: 'number' }
   #swagger.parameters['offset'] = { description: 'Кол-во результатов в ответе, начиная с позиции.',
               type: 'number'}
   #swagger.responses[200] = {
               schema: { $ref: "#/definitions/ContactResponse" },
               description: 'Положительный ответ.'
        }
   #swagger.responses[400] = {
                schema: { $ref: "#/definitions/Error" }
        }
   #swagger.responses[401] = {
             schema: { $ref: "#/definitions/Error" }
      }
   #swagger.responses[500] = {
             schema: { $ref: "#/definitions/Error" }
      }
   */
);

router.post(
  '/',
  auth,
  catchError(contactsController.add),
  /* #swagger.tags = ['Contact']
  #swagger.security = [{
               "BearerAuth": []
        }]
   #swagger.description = 'Добавление контакта.'
   #swagger.parameters['Contact'] = {
               in: 'body',
               description: 'Данные контакта',
               required: true,
               type: 'object',
               schema: { $ref: "#/definitions/Contact" }
        }
   #swagger.responses[200] = {
               schema: { $ref: "#/definitions/ContactResponse" },
               description: 'Положительный ответ.'
        }
   #swagger.responses[400] = {
                schema: { $ref: "#/definitions/Error" }
        }
   #swagger.responses[401] = {
             schema: { $ref: "#/definitions/Error" }
      }
   #swagger.responses[500] = {
             schema: { $ref: "#/definitions/Error" }
      }
   */
);

router.get(
  '/:id',
  auth,
  catchError(contactsController.get),
  /* #swagger.tags = ['Contact']
  #swagger.security = [{
               "BearerAuth": []
        }]
   #swagger.description = 'Запрос контакта по ID.'
   #swagger.parameters['id'] = { description: 'ID Контакта.' }
   #swagger.responses[200] = {
               schema: { $ref: "#/definitions/ContactResponse" },
               description: 'Положительный ответ.'
        }
   #swagger.responses[400] = {
                schema: { $ref: "#/definitions/Error" }
        }
   #swagger.responses[401] = {
             schema: { $ref: "#/definitions/Error" }
      }
   #swagger.responses[500] = {
             schema: { $ref: "#/definitions/Error" }
      }
   */
);

router.patch(
  '/:id',
  auth,
  catchError(contactsController.update),
  /* #swagger.tags = ['Contact']
  #swagger.security = [{
               "BearerAuth": []
        }]
   #swagger.description = 'Изменение контакта по ID.'
   #swagger.parameters['id'] = { description: 'ID Контакта.' }
   #swagger.parameters['Contact'] = {
               in: 'body',
               description: 'Данные контакта',
               required: true,
               type: 'object',
               schema: { $ref: "#/definitions/Contact" }
        }
   #swagger.responses[200] = {
               schema: { $ref: "#/definitions/ContactResponse" },
               description: 'Положительный ответ.'
        }
   #swagger.responses[400] = {
                schema: { $ref: "#/definitions/Error" }
        }
   #swagger.responses[401] = {
             schema: { $ref: "#/definitions/Error" }
      }
   #swagger.responses[500] = {
             schema: { $ref: "#/definitions/Error" }
      }
   */
);

router.delete(
  '/:id',
  auth,
  catchError(contactsController.del),
  /* #swagger.tags = ['Contact']
  #swagger.security = [{
               "BearerAuth": []
        }]
   #swagger.description = 'Удаление Контакта по ID.'
   #swagger.parameters['id'] = { description: 'ID Контакта.' }
   #swagger.responses[200] = {
               schema: { $ref: "#/definitions/DeleteContact" },
               description: 'Положительный ответ.'
        }
   #swagger.responses[401] = {
             schema: { $ref: "#/definitions/Error" }
      }
   #swagger.responses[500] = {
             schema: { $ref: "#/definitions/Error" }
      }
   */
);

module.exports = router;
