const jwt = require('jsonwebtoken');
const {
  BadRequest,
} = require('http-errors');
const { User } = require('../db');
const config = require('../config.json');

module.exports = {
  login,
  signup,
};

async function login(req, res) {
  const { user, password } = req.body;

  if (!user || !password) throw new BadRequest('No user or password passed');

  const usr = await User.findOne({
    where: {
      login: user,
    },
  });

  if (usr && usr.checkPassword(password)) {
    const expiresIn = config.jwt_ttl;
    const token = await jwt.sign(
      { user: usr.id },
      config.app,
      { expiresIn },
    );
    return res.status(200)
      .json({ token, expiresIn });
  }

  throw new BadRequest('User or password error');
}

async function signup(req, res) {
  const { user, password } = req.body;

  if (!user || !password) throw new BadRequest('No user or password passed');

  const usr = await User.create({
    login: user,
    password,
  });

  return res.status(200)
    .json(usr.apiData());
}
