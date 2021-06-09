const { Model } = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  class Contact extends Model {
    static associate(models) {
      Contact.hasMany(models.Company, {
        as: 'company',
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
    firstName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    lastName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    patronymic: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        is: {
          args: /^(8|7)[\d]{10}$/,
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

  // eslint-disable-next-line func-names
  Contact.prototype.apiData = function () {
    return {
      id: this.id,
      firstName: this.firstName,
      lastName: this.lastName,
      patronymic: this.patronymic,
      phone: this.phone,
      email: this.email,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
    };
  };

  return Contact;
};
