###
  INSTALL

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
  request = require 'request'
  ce      = require 'cloneextend'
  qs      = require 'qs'

  http_options =
    uri: 'http://mobotpoints.herokuapp.com/users/update'
    method: 'PUT'
    headers:
      'content-type': 'application/x-www-form-urlencoded'

  points = {}

  robot.hear /([+-]\s*\d+)\s*\@(\w+)/, (msg) ->
    addPoints msg.match[2], parsePoints msg.match[1]

  robot.hear /\@(\w+)\s*([+-]\s*\d+)/, (msg) ->
    addPoints msg.match[1], parsePoints msg.match[2]

  robot.respond /points for \@(\w*)/, (msg) ->
    msg.send points[match[0]]

  robot.respond /points$/i, (msg) ->
    msg.send JSON.stringify points, null, 4

  parsePoints = (points) ->
    number = parseInt(points.replace(/\s+/, ''), 10)
    number = 0 if Math.abs(number) > 1000
    number

  addPoints = (name, toAdd) ->
    points[name] = if points[name] then points[name] + toAdd else toAdd
    pushPoints(name, toAdd)

  pushPoints = (name, points) ->
    data = qs.stringify({name: name, points: points})
    request.put ce.cloneextend(http_options, {body: data})