###
  INSTALL

    add to the package.json

    "parse-api": "latest"

  Description:

    counts your points DUH

  COMMANDS

    @ben +10
    +10 @ben
    -10 @ben
    @ben -100

  NOTE:

    Any number of spaces are acceptable between
    the sign and the points and the points and the @name

###

module.exports = (robot) ->
  Parse = require('parse-api').Parse
  APP_ID = process.env.PARSE_APP_ID
  MASTER_KEY = process.env.PARSE_MASTER_KEY
  points = {}

  robot.hear /([+-]\s*\d+)\s*\@(\w+)/, (msg) ->
    addPoints msg.match[2], parsePoints msg.match[1]

  robot.hear /\@(\w+)\s*([+-]\s*\d+)/, (msg) ->
    addPoints msg.match[1], parsePoints msg.match[2]

  robot.respond /points/i, (msg) ->
    msg.send JSON.stringify points, null, 4

  parsePoints = (points) ->
    parseInt points.replace(/\s+/, ''), 10

  addPoints = (name, toAdd) ->
    points[name] = if points[name] then points[name] + toAdd else toAdd
