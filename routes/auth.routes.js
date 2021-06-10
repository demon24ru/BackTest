const { Router } = require('express');
const { catchError } = require('../middleware/errors');

const controller = require('../controllers/auth.controller');

const router = Router();

router.post(
  '/login',
  catchError(controller.login),
  /* #swagger.tags = ['Auth']
   #swagger.description = 'Авторизация по логину/паролю.'
   #swagger.parameters['User'] = {
               in: 'body',
               description: 'Параметры для входа',
               required: true,
               type: 'object',
               schema: { $ref: "#/definitions/AddUser" }
        }
   #swagger.responses[200] = {
               schema: { $ref: "#/definitions/AuthLogin" },
               description: 'Верная авторизация.'
        }
   #swagger.responses[400] = {
                schema: { $ref: "#/definitions/Error" }
        }
   #swagger.responses[500] = {
             schema: { $ref: "#/definitions/Error" }
      }
   */
);

router.post(
  '/signup',
  catchError(controller.signup),
  /* #swagger.tags = ['Auth']
 #swagger.description = 'Регистрация по логину/паролю.'
 #swagger.parameters['newUser'] = {
             in: 'body',
             description: 'Параметры для входа',
             required: true,
             type: 'object',
             schema: { $ref: "#/definitions/AddUser" }
      }
 #swagger.responses[200] = {
             schema: { $ref: "#/definitions/AuthSignup" },
             description: 'Пользователь создан.'
      }
 #swagger.responses[400] = {
             schema: { $ref: "#/definitions/Error" }
      }
 #swagger.responses[500] = {
             schema: { $ref: "#/definitions/Error" }
      }
   */
);

module.exports = router;
