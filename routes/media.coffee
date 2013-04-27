mongo = require("mongodb")
Server = mongo.Server
Db = mongo.Db
BSON = mongo.BSONPure
server = new Server "localhost", 27017,
  auto_reconnect: true

db = new Db("mediadb", server)
db.open (err, db) ->
  unless err
    console.log "Connected to 'mediadb' database"
    db.collection "medias", {strict: true}, (err, collection) ->
      if err
        console.log "The 'medias' collection doesn't exist. Creating it with sample data..."
        populateDB()


exports.findById = (req, res) ->
  id = req.params.id
  console.log "Retrieving media: " + id
  db.collection "medias", (err, collection) ->
    collection.findOne {_id: new BSON.ObjectID(id)}, (err, item) ->
      res.send item



exports.findAll = (req, res) ->
  db.collection "medias", (err, collection) ->
    collection.find().toArray (err, items) ->
      res.send items



exports.addMedia = (req, res) ->
  media = req.body
  console.log "Adding media: " + JSON.stringify(media)
  db.collection "medias", (err, collection) ->
    collection.insert media, {safe: true}, (err, result) ->
      if err
        res.send error: "An error has occurred"
      else
        console.log "Success: " + JSON.stringify(result[0])
        res.send result[0]



exports.updateMedia = (req, res) ->
  id = req.params.id
  media = req.body
  console.log "Updating media: " + id
  console.log JSON.stringify(media)
  db.collection "medias", (err, collection) ->
    collection.update {_id: new BSON.ObjectID(id)}, media, {safe: true}, (err, result) ->
      if err
        console.log "Error updating media: " + err
        res.send error: "An error has occurred"
      else
        console.log "" + result + " document(s) updated"
        res.send media



exports.deleteMedia = (req, res) ->
  id = req.params.id
  console.log "Deleting media: " + id
  db.collection "medias", (err, collection) ->
    collection.remove {_id: new BSON.ObjectID(id)}, media, {safe: true}, (err, result) ->
      if err
        res.send error: "An error has occurred - " + err
      else
        console.log "" + result + " document(s) deleted"
        res.send req.body




#--------------------------------------------------------------------------------------------------------------------

# Populate database with sample data -- Only used once: the first time the application is started.
# You'd typically not find this code in a real-life app, since the database would already exist.
populateDB = ->
  medias = [{
    name: "CHATEAU DE SAINT COSME"
    year: "2009"
    grapes: "Grenache / Syrah"
    country: "France"
    region: "Southern Rhone"
    description: "The aromas of fruit and spice..."
    picture: "saint_cosme.jpg"
  },{
    name: "LAN RIOJA CRIANZA"
    year: "2006"
    grapes: "Tempranillo"
    country: "Spain"
    region: "Rioja"
    description: "A resurgence of interest in boutique vineyards..."
    picture: "lan_rioja.jpg"
  }]
  db.collection "medias", (err, collection) ->
    collection.insert medias, {safe: true}, (err, result) ->

