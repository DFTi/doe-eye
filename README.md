# critique-server
### a Sails application

Backend for Critique web and iOS apps

See example application with Backbone.js, Twitter Bootstrap, Node.js, Express, and MongoDB: https://github.com/ccoenraets/nodecellar

this is an exploration into simplifying a the moderately complicated backend (caps) into a single Node.js app, hopefully with a simpler data model too... during this process I hope that the ideas of [gatekeeper]() can be further developed or implemented.

We will use [Sails](https://github.com/balderdashy/sails) & the [sails-riak](https://github.com/balderdashy/sails-riak) adapter


Desired Platform:
  * SmartOS

Features:
  * Uses [api](https://npmjs.org/package/api) for interconnecting with other services (e.g. Turner path mapper) and its own subservices

  * Authenticates users locally or from LDAP by using [passport](https://github.com/jaredhanson/passport) or [everyauth](https://github.com/bnoguchi/everyauth), see [StackOverflow](http://stackoverflow.com/questions/8370045/authentication-solutions-for-node-js)

  * Supports ACL with [node_acl](https://github.com/optimalbits/node_acl)
    * This is also interesting: [simple-acl](https://npmjs.org/package/simple-acl)
    * There are many options for acl on [npm](https://npmjs.org/search?q=acl)

  * Presents a web-based filesystem abstraction & collaborative player
    * Templates with [ejs](http://robdodson.me/blog/2012/05/31/how-to-use-ejs-in-express/)
    * Websockets: [socket.io](http://socket.io/)
    * Filesystem abstraction adapters:
      * LocalFolder
      * CatDV

  * Creates PDFs with 
    * [pdfkit-memory](https://npmjs.org/package/pdfkit-memory)
    * [pdf.js](https://npmjs.org/package/pdf.js)
    * Research continues... [search npm](https://npmjs.org/search?q=pdf)

  * Ingests video and image uploads & [processes](https://npmjs.org/package/job) them in background
    * Utilizes ffmbc after I enhance [plain-ffmpeg](https://npmjs.org/package/plain-ffmpeg)
      * Extracts thumbnails with 0 work using [video-thumb](https://npmjs.org/package/video-thumb)
    * Resizes images [graphicsmagick](https://npmjs.org/package/graphicsmagick)

  * Supports uploading via [expressjs](http://expressjs.com) which uses [node-formidable](https://github.com/felixge/node-formidable) for great performance

  * Sends email with [express-mailer](https://npmjs.org/package/express-mailer)
  
  * Stores data with [riak-js](https://github.com/mostlyserious/riak-js)
  * Logs better with [stoopid](https://github.com/mikeal/stoopid)

Development Needs:
  * functional testing with upload support: [supertest](https://github.com/visionmedia/supertest)
  * binding.pry: [node-inspector](https://github.com/dannycoates/node-inspector)

Deploy Requirements:
  * Runtime: node.js
  * Datastore: [Riak Cloud Storage](http://basho.com/riak-cloud-storage/)
  * Job Runner: [Kue](https://github.com/learnboost/kue) & Redis
  * [HAProxy](http://haproxy.1wt.eu/) for load balancing

Deploy Extras: 
  * Can use [Cluster](http://learnboost.github.io/cluster/) (great with Kue, for instance)
  * Can use [newrelic](https://github.com/newrelic/node-newrelic/)

# Mongo? Riak? What?
Some [slides](http://java.dzone.com/articles/why-we-migrated-mongodb-riak) about it ... google about it
  * [Why Not Mongo?](http://cl.ly/image/3Z3G3R452U3i)
  * [Why Riak?](http://cl.ly/image/353t0P1H3c2k)