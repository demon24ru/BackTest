const { Model } = require('sequelize');
const crypto = require('crypto');

module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    // static associate(models) { }
    static encryptPassword = (plainText, salt) => crypto.createHash('RSA-SHA256').update(plainText).update(salt).digest('hex');
    static genSalt = () => crypto.randomBytes(4).toString('hex');
  }

  User.init({
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    login: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
      validate: {
        isAlpha: { msg: 'Login must be only letters.' },
      },
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        is: {
          args: /[0-9]{6,}/,
          // eslint-disable-next-line quotes
          msg: `
                Password must be NOT less than 6 characters long,
                containing at least one number, one special character,
                one upper and lower case letter.
                `,
        },
      },
    },
    salt: {
      type: DataTypes.STRING,
    },
  },
  {
    sequelize,
    modelName: 'User',
    underscored: true,
  });

  const setSaltAndPassword = (user) => {
    if (user.changed('password')) {
      user.salt = User.genSalt();
      user.password = User.encryptPassword(user.password, user.salt);
    }
  };

  User.beforeCreate(setSaltAndPassword);
  User.beforeUpdate(setSaltAndPassword);

  User.prototype.checkPassword = function (pass) {
    return (User.encryptPassword(pass, this.salt) === this.password);
  }

  // eslint-disable-next-line func-names
  User.prototype.apiData = function () {
    return {
      id: this.id,
      login: this.login,
    };
  };

  return User;
};
