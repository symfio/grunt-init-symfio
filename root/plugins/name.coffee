module.exports = (model, get) ->
  model "Thing", "things", (mongoose) ->
    new mongoose.Schema
      thing: type: String, require: true

  get "/things", (Thing) ->
    (req, res) ->
      Thing.find (err, things) ->
        return res.send 500 if err
        return res.send 404 unless things
        res.send things
