const httpContext = require('express-http-context');
const {
  Unauthorized,
} = require('http-errors');
const jwt = require('jsonwebtoken');

const config = require('../config.json');

module.exports = async (req, res, next) => {
  try {
    if (!req.headers.authorization) throw new Error();
    const token = req.headers.authorization.split(' ')[1];
    if (token.length < 2) throw new Error();

    const decoded = jwt.verify(token, config.app);
    req.user = decoded.user;
    httpContext.set('user', decoded?.user);
    return next();
  } catch (e) {
    return next(new Unauthorized('Not authorized'));
  }
};
