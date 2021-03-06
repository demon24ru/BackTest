const cron = require('node-cron');
const cors = require('cors');
const express = require('express');
const fs = require('fs');
const httpContext = require('express-http-context');
const marked = require('marked');
const swaggerUi = require('swagger-ui-express');
const swaggerFile = require('./doc/swagger_output.json');

const db = require('./db');
const { errorMiddleware } = require('./middleware/errors');

const logger = require('./services/logger')(module);

const routes = require('./routes');

const app = express();

app.use(httpContext.middleware);
app.use((req, res, next) => {
  httpContext.ns.bindEmitter(req);
  httpContext.ns.bindEmitter(res);
  httpContext.set('method', req?.method);
  httpContext.set('url', req?.url);
  next();
});

app.use(cors());

app.use(express.json());

app.use(express.static(`${__dirname}/public`));

app.use('/', routes);

// Документация
app.use('/doc', swaggerUi.serve, swaggerUi.setup(swaggerFile));

app.use(errorMiddleware);

app.get('/', (req, res) => {
  const path = `${__dirname}/README.md`;
  const file = fs.readFileSync(path, 'utf8');
  const pageContent = marked(file.toString());

  res.send(
    `
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="github-markdown.css">
      </head>
      <body>
        <article class="markdown-body">${pageContent}</article>
      </body>
    </html>
    `,
  );
});

cron.schedule('0 * * * *', () => {
  fs.rm('./public/images/', { recursive: true, force: true }, (err) => {
    if (err) logger(err);
  });
});

db.sequelize.sync()
  .then(() => logger.info('Database has been synchronized.'))
  .catch((error) => {
    logger.error(error.message);
    process.exit(1);
  });

module.exports = app;
