module.exports.description = "Create a Symfio application."

module.exports.warnOn = "*"

module.exports.template = (grunt, init, callback) ->
  prompts = [
    init.prompt "name"
    init.prompt "version"
    init.prompt "description"
    init.prompt "author_name"
    init.prompt "author_email"
    init.prompt "repository"
    init.prompt "homepage"
    init.prompt "bugs"
    {
      name: "copyrights"
      message: "Copyrights"
      default: "2012-2013 Rithis Studio LLC"
    }
  ]

  init.process {}, prompts, (err, props) ->
    files = init.filesToCopy props
    init.copyAndProcess files, props
    callback()
