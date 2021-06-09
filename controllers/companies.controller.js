const {
  BadRequest,
} = require('http-errors');
const queryStringConverter = require('sequelize-querystring-converter');
const { Company } = require('../db');

module.exports = {
  get,
  update,
  del,
  add,
};

async function get(req, res) {
  const { query, params } = req;
  const { id } = params;
  if (id) {
    const company = await Company.findByPk(id);
    if (!company) throw new BadRequest('No Company for this id');
    return res.status(200).json(company.apiData(req));
  }
  const criteria = queryStringConverter.convert({ query });
  const companies = await Company.findAll(criteria);
  if (!companies.length) throw new BadRequest('No Company');
  return res.status(200).json(companies.map((company) => company.apiData(req)));
}

async function add(req, res) {
  if (!req.body) throw new BadRequest('No Contact for added');

  const company = await Company.create(req.body);
  return res.status(200).json(company.apiData(req));
}

async function update(req, res) {
  const { id } = req.params;
  if (!id) throw new BadRequest('No id Company');

  const updatedCompany = await Company.findByPk(id);
  if (!updatedCompany) throw new BadRequest('No Company for this id');

  await updatedCompany.update(req.body);

  return res.status(200).json(updatedCompany.apiData(req));
}

async function del(req, res) {
  const { id } = req.params;
  if (!id) throw new BadRequest('No id Company');

  const deletedCompany = await Company.destroy({ where: { id } });

  return res.status(200).json({ count: deletedCompany });
}
