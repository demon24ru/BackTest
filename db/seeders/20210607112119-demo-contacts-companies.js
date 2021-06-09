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
        created_at: now,
        updated_at: now,
      });
    }
    await queryInterface.bulkInsert('contacts', demo_contacts);
    // eslint-disable-next-line camelcase
    const demo_companies = [];
    // eslint-disable-next-line no-plusplus
    for (let i = 1; i < 100; i++) {
      // eslint-disable-next-line camelcase
      const name_photo = crypto.randomBytes(4).toString('hex');
      const contactId = Math.floor(i / 2);
      demo_companies.push({
        id: i,
        contact_id: contactId || 1,
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
        created_at: now,
        updated_at: now,
      });
    }
    await queryInterface.bulkInsert('companies', demo_companies);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('companies', null, {});
    await queryInterface.bulkDelete('contacts', null, {});
  },
};
