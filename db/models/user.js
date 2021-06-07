const { Model } = require('sequelize');
const crypto = require('crypto');

module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    // static associate(models) { }
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
      validate: {
        isAlpha: { msg: 'Login must be only letters.' },
      },
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
      get() {
        return () => this.getDataValue('password');
      },
      validate: {
        is: {
          args: /(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{6,}/g,
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
      get() {
        return () => this.getDataValue('salt');
      },
    },
  },
  {
    sequelize,
    modelName: 'User',
    underscored: true,
  });

  User.encryptPassword = (plainText, salt) => crypto.createHash('RSA-SHA256').update(plainText).update(salt).digest('hex');

  const setSaltAndPassword = (user) => {
    if (user.changed('password')) {
      user.salt = crypto.randomBytes(16).toString('base64');
      user.password = User.encryptPassword(user.password(), user.salt());
    }
  };

  User.beforeCreate(setSaltAndPassword);
  User.beforeUpdate(setSaltAndPassword);

  return User;
};
