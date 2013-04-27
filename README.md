## critique-server

Backend for Critique web and iOS apps

An exploration into simplifying a semi-complex backend into a single Node.js app

  * Background Jobs: [Kue](https://github.com/learnboost/kue) and [job](https://npmjs.org/package/job)
  * Sending email: [express-mailer](https://npmjs.org/package/express-mailer)
  * Authentication: [passport](https://github.com/jaredhanson/passport) or [everyauth](https://github.com/bnoguchi/everyauth), see [StackOverflow](http://stackoverflow.com/questions/8370045/authentication-solutions-for-node-js)
  * Database: mongodb
  * Websocket: socket.io
  * Testing: [supertest](https://github.com/visionmedia/supertest) which supports capybara style testing, even file uploads

Examples Application with Backbone.js, Twitter Bootstrap, Node.js, Express, and MongoDB: https://github.com/ccoenraets/nodecellar