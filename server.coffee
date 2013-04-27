express = require("express")
media = require("./routes/media")
app = express()
app.configure ->
  app.use express.logger("dev")
  app.use express.bodyParser()

debugger

app.get "/medias", media.findAll
app.get "/medias/:id", media.findById
app.post "/medias", media.addMedia
app.put "/medias/:id", media.updateMedia
app.delete "/medias/:id", media.deleteMedia

app.listen 3000
console.log "Listening on port 3000..."