const crypto = require('crypto');

module.exports = {
  up: async (queryInterface, Sequelize) => {
    // eslint-disable-next-line camelcase
    const demo_contacts = [];
    const now = new Date();
    // eslint-disable-next-line no-plusplus
    for (let i = 1; i <= 50; i++) {
      demo_contacts.push({
        id: i,
        lastName: `Имя${i}`,
        firstName: `Фамилия${i}`,
        patronymic: `Отчество${i}`,
        phone: (`7${(`000000000${i}`).substr(-(i.toString().length))}`),
        email: `ru${i}@ru.ru`,
        createdAt: now,
        updatedAt: now,
      });
    }
    await queryInterface.bulkInsert('Contacts', demo_contacts);
    // eslint-disable-next-line camelcase
    const demo_companies = [];
    // eslint-disable-next-line no-plusplus
    for (let i = 1; i < 100; i++) {
      // eslint-disable-next-line camelcase
      const name_photo = crypto.randomBytes(4).toString('hex');
      const contactId = Math.floor(i / 2);
      demo_companies.push({
        id: i,
        contactId: contactId || 1,
        name: `ООО Фирма «Номер ${i}»`,
        shortName: `Номер ${i}`,
        businessEntity: 'ООО',
        contract: JSON.stringify({
          no: `no ${i}`,
          issue_date: now,
        }),
        type: ['agent', 'contractor'],
        status: (!!i % 2 ? 'active' : 'inactive'),
        // eslint-disable-next-line camelcase
        photos: JSON.stringify([`${name_photo}.png`]),
        address: `Адрес ${i}`,
        createdAt: now,
        updatedAt: now,
      });
    }
    await queryInterface.bulkInsert('Companies', demo_companies);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Companies', null, {});
    await queryInterface.bulkDelete('Contacts', null, {});
  },
};
