const request = require('supertest');
const app = require('../app');

describe('App', function() {

  let auth;
  it('has the auth', function(done) {
    request(app)
        .get('/auth?user=test')
        .expect(200)
        .then(res => {
          auth = res.header.authorization;
          done();
        })
        .catch(err => done(err));
  });

});
