const { Model } = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  class Contact extends Model {
    static associate(models) {
      Contact.hasMany(models.Company, {
        as: 'companies',
      });
    }
  }

  Contact.init({
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    firstname: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        isAlpha: { msg: 'Firstname must be only letters.' },
      },
    },
    lastName: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        isAlpha: { msg: 'Lastname must be only letters.' },
      },
    },
    patronymic: {
      type: DataTypes.STRING,
      validate: {
        isAlpha: { msg: 'Patronymic must be only letters.' },
      },
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        is: {
          args: /^((8|\+7)[- ]?)?(\(?\d{3}\)?[- ]?)?[\d\- ]{7,10}$/,
          msg: 'Please enter valid phone value.',
        },
      },
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
      validate: {
        isEmail: { msg: 'Please enter valid email value.' },
      },
    },
  }, {
    sequelize,
    modelName: 'Contact',
    underscored: true,
  });

  return Contact;
};
