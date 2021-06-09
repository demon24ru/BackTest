const request = require('supertest');
const assert = require('assert');

process.env.NODE_ENV = 'test';
const app = require('../app');

// eslint-disable-next-line no-unused-vars
let auth;

// eslint-disable-next-line no-undef
describe('App auth', () => {
  // eslint-disable-next-line no-undef
  it('has signup', (done) => {
    request(app)
      .post('/auth/signup')
      .send({ user: 'User', password: '123451' })
      .expect(200)
      .then((res) => {
        const { login } = res.body;
        assert.deepStrictEqual(login, 'User');
        done();
      })
      .catch((err) => done(err));
  });
  // eslint-disable-next-line no-undef
  it('has login', (done) => {
    request(app)
      .post('/auth/login')
      .send({ user: 'User', password: '123451' })
      .expect(200)
      .then((res) => {
        auth = `Bearer ${res.body.token}`;
        done();
      })
      .catch((err) => done(err));
  });
});

// eslint-disable-next-line no-undef
describe('App Contacts', () => {
  let cid;
  let cUpdatedAt;

  // eslint-disable-next-line no-undef
  it('post contact', (done) => {
    request(app)
      .post('/contacts')
      .set('Authorization', auth)
      .send({
        lastName: 'Григорьев',
        firstName: 'Сергей',
        patronymic: 'Петрович',
        phone: '79162165588',
        email: 'grigoriev@funeral.com',
      })
      .expect('Content-Type', /json/)
      .expect(200)
      .then((res) => {
        const { id, createdAt, updatedAt } = res.body;
        assert.deepStrictEqual(res.body, {
          id,
          lastName: 'Григорьев',
          firstName: 'Сергей',
          patronymic: 'Петрович',
          phone: '79162165588',
          email: 'grigoriev@funeral.com',
          createdAt,
          updatedAt,
        });
        cid = id;
        cUpdatedAt = updatedAt;
        done();
      })
      .catch((err) => done(err));
  });

  // eslint-disable-next-line no-undef
  it('get all contacts', (done) => {
    request(app)
      .get('/contacts')
      .set('Authorization', auth)
      .expect('Content-Type', /json/)
      .expect(200, done);
  });

  // eslint-disable-next-line no-undef
  it('get contact for id', (done) => {
    request(app)
      .get(`/contacts/${cid}`)
      .set('Authorization', auth)
      .expect('Content-Type', /json/)
      .expect(200)
      .then((res) => {
        const { body } = res;
        delete body.createdAt;
        assert.deepStrictEqual(body, {
          id: cid,
          lastName: 'Григорьев',
          firstName: 'Сергей',
          patronymic: 'Петрович',
          phone: '79162165588',
          email: 'grigoriev@funeral.com',
          updatedAt: cUpdatedAt,
        });
        done();
      })
      .catch((err) => done(err));
  });

  // eslint-disable-next-line no-undef
  it('patch contact for id', (done) => {
    request(app)
      .patch(`/contacts/${cid}`)
      .set('Authorization', auth)
      .send({
        email: 'test@test.test',
      })
      .expect('Content-Type', /json/)
      .expect(200)
      .then((res) => {
        const { body } = res;
        delete body.createdAt;
        assert.notDeepStrictEqual(body.updatedAt, cUpdatedAt);
        delete body.updatedAt;
        assert.deepStrictEqual(body, {
          id: cid,
          lastName: 'Григорьев',
          firstName: 'Сергей',
          patronymic: 'Петрович',
          phone: '79162165588',
          email: 'test@test.test',
        });
        done();
      })
      .catch((err) => done(err));
  });

  // eslint-disable-next-line no-undef
  it('delete contact for id', (done) => {
    request(app)
      .delete(`/contacts/${cid}`)
      .set('Authorization', auth)
      .expect('Content-Type', /json/)
      .expect(200)
      .then((res) => {
        assert.deepStrictEqual(res.body, { count: 1 });
        done();
      })
      .catch((err) => done(err));
  });
});

// eslint-disable-next-line no-undef
describe('App Companies', () => {
  let cid;
  let contactId;
  let cUpdatedAt;

  // eslint-disable-next-line no-undef
  it('post company', (done) => {
    request(app)
      .post('/contacts')
      .set('Authorization', auth)
      .send({
        lastName: 'Григорьев',
        firstName: 'Сергей',
        patronymic: 'Петрович',
        phone: '79162165588',
        email: 'grigoriev@funeral.com',
      })
      .expect(200)
      .then((res) => {
        const { id } = res.body;
        contactId = id;

        return request(app)
          .post('/companies')
          .set('Authorization', auth)
          .send({
            contactId,
            name: 'ООО Фирма «Перспективные захоронения»',
            shortName: 'Перспективные захоронения',
            businessEntity: 'ООО',
            contract: {
              no: '12345',
              issue_date: '2015-03-12T00:00:00Z',
            },
            type: ['agent', 'contractor'],
            status: 'active',
            address: 'address',
          })
          .expect('Content-Type', /json/)
          .expect(200)
          .then((r) => {
            const { id, createdAt, updatedAt } = r.body;
            assert.deepStrictEqual(r.body, {
              id,
              contactId,
              name: 'ООО Фирма «Перспективные захоронения»',
              shortName: 'Перспективные захоронения',
              businessEntity: 'ООО',
              contract: {
                no: '12345',
                issue_date: '2015-03-12T00:00:00Z',
              },
              type: ['agent', 'contractor'],
              status: 'active',
              photos: [],
              address: 'address',
              createdAt,
              updatedAt,
            });
            cid = id;
            cUpdatedAt = updatedAt;
            done();
          });
      })
      .catch((err) => done(err));
  });

  // eslint-disable-next-line no-undef
  it('get all companies', (done) => {
    request(app)
      .get('/companies')
      .set('Authorization', auth)
      .expect('Content-Type', /json/)
      .expect(200, done);
  });

  // eslint-disable-next-line no-undef
  it('get company for id', (done) => {
    request(app)
      .get(`/companies/${cid}`)
      .set('Authorization', auth)
      .expect('Content-Type', /json/)
      .expect(200)
      .then((res) => {
        const { body } = res;
        delete body.createdAt;
        assert.deepStrictEqual(body, {
          id: cid,
          contactId,
          name: 'ООО Фирма «Перспективные захоронения»',
          shortName: 'Перспективные захоронения',
          businessEntity: 'ООО',
          contract: {
            no: '12345',
            issue_date: '2015-03-12T00:00:00Z',
          },
          type: ['agent', 'contractor'],
          status: 'active',
          photos: [],
          address: 'address',
          updatedAt: cUpdatedAt,
        });
        done();
      })
      .catch((err) => done(err));
  });

  // eslint-disable-next-line no-undef
  it('patch company for id', (done) => {
    request(app)
      .patch(`/companies/${cid}`)
      .set('Authorization', auth)
      .send({
        address: 'teteteteteteteet',
      })
      .expect('Content-Type', /json/)
      .expect(200)
      .then((res) => {
        const { body } = res;
        delete body.createdAt;
        assert.notDeepStrictEqual(body.updatedAt, cUpdatedAt);
        delete body.updatedAt;
        assert.deepStrictEqual(body, {
          id: cid,
          contactId,
          name: 'ООО Фирма «Перспективные захоронения»',
          shortName: 'Перспективные захоронения',
          businessEntity: 'ООО',
          contract: {
            no: '12345',
            issue_date: '2015-03-12T00:00:00Z',
          },
          type: ['agent', 'contractor'],
          status: 'active',
          photos: [],
          address: 'teteteteteteteet',
        });
        done();
      })
      .catch((err) => done(err));
  });

  // eslint-disable-next-line no-undef
  it('delete company for id', (done) => {
    request(app)
      .delete(`/companies/${cid}`)
      .set('Authorization', auth)
      .expect('Content-Type', /json/)
      .expect(200)
      .then((res) => {
        assert.deepStrictEqual(res.body, { count: 1 });
        return request(app)
          .delete(`/contacts/${contactId}`)
          .set('Authorization', auth)
          .expect('Content-Type', /json/)
          .expect(200)
          .then((r) => {
            assert.deepStrictEqual(r.body, { count: 1 });
            done();
          });
      })
      .catch((err) => done(err));
  });
});
