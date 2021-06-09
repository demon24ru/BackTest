const {
  BadRequest,
} = require('http-errors');
const queryStringConverter = require('sequelize-querystring-converter');
const { Contact } = require('../db');

module.exports = {
  get,
  update,
  add,
  del,
};

async function get(req, res) {
  const { query, params } = req;
  const { id } = params;
  if (id) {
    const contact = await Contact.findByPk(id);
    if (!contact) throw new BadRequest('No Contact for this id');
    return res.status(200).json(contact.apiData());
  }
  const criteria = queryStringConverter.convert({ query });
  const contacts = await Contact.findAll(criteria);
  if (!contacts.length) throw new BadRequest('No Contacts');
  return res.status(200).json(contacts.map((contact) => contact.apiData()));
}

async function update(req, res) {
  const { id } = req.params;
  if (!id) throw new BadRequest('No id Contact');

  const updatedContact = await Contact.findByPk(id);
  if (!updatedContact) throw new BadRequest('No Contact for this id');

  await updatedContact.update(req.body);

  return res.status(200).json(updatedContact.apiData());
}

async function add(req, res) {
  if (!req.body) throw new BadRequest('No Contact for added');

  const contact = await Contact.create(req.body);
  return res.status(200).json(contact.apiData());
}

async function del(req, res) {
  const { id } = req.params;
  if (!id) throw new BadRequest('No id Contact');

  const deletedContact = await Contact.destroy({ where: { id } });

  return res.status(200).json({ count: deletedContact });
}
