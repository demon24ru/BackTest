const { Model } = require('sequelize');
const { port } = require('../../helpers');

const _getCurrentURL = (req) => (`${req.protocol}://${req.hostname}${port === '80' || port === '443' ? '' : `:${port}`}/`);

module.exports = (sequelize, DataTypes) => {
  class Company extends Model {
    static associate(models) {
      Company.belongsTo(models.Contact, {
        as: 'contacts',
      });
    }
  }

  Company.init({
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    contactId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Contacts',
        key: 'id',
      },
      field: 'contact_id',
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
    shortName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    businessEntity: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    contract: {
      type: DataTypes.JSONB(),
      allowNull: false,
    },
    type: {
      type: DataTypes.ARRAY(DataTypes.STRING),
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    photos: {
      type: DataTypes.JSONB(),
      allowNull: false,
    },
    address: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  }, {
    sequelize,
    modelName: 'Company',
    underscored: true,
  });

  // eslint-disable-next-line func-names
  Company.prototype.apiData = function (req) {
    const URL = _getCurrentURL(req);
    const photos = this.photos.map((name) => {
      const sName = name.split('.');
      return {
        name,
        filepath: URL + name,
        thumbpath: `${URL}${sName[0]}_160x160.${sName[1]}`,
      };
    });
    return {
      id: this.id,
      contactId: this.contactId,
      name: this.name,
      shortName: this.shortName,
      businessEntity: this.businessEntity,
      contract: this.contract,
      type: this.type,
      status: this.status,
      photos,
      address: this.address,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
    };
  };

  return Company;
};
