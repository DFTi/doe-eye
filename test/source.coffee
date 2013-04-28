request = require('supertest')
app = require('sails').lift()



app.get '/user', (req, res) ->
  res.send(201, { name: 'tobi' })