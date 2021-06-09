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
        created_at: now,
        updated_at: now,
      });
    }
    await queryInterface.bulkInsert('users', demo);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('users', null, {});
  },
};
