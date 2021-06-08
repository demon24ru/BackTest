const { User } = require('../models');

module.exports = {
  // eslint-disable-next-line no-unused-vars
  up: async (queryInterface, Sequelize) => {
    const demo = [];
    const now = new Date();
    // eslint-disable-next-line no-plusplus
    for (let i = 1; i <= 4; i++) {
      const salt = User.genSalt();
      demo.push({
        id: i,
        login: `User${i}`,
        password: User.encryptPassword(`12345${i}`, salt),
        salt,
        createdAt: now,
        updatedAt: now,
      });
    }
    await queryInterface.bulkInsert('Users', demo);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Users', null, {});
  },
};
