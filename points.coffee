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
  points = {}

  robot.hear /([+-]\s*\d+)\s*\@(\w+)/, (msg) ->
    addPoints msg.match[2], parsePoints msg.match[1]

  robot.hear /\@(\w+)\s*([+-]\s*\d+)/, (msg) ->
    addPoints msg.match[1], parsePoints msg.match[2]

  robot.respond /points/i, (msg) ->
    msg.send JSON.stringify points, null, 4

  robots.respond /who is winning/, (msg) ->
    a = []
    for(x in points) { a.push([x, a[x]]) }
    a.sort(function(x,y) { return y[1] - x[1] })
    winner = a.shift()
    msg.send "@" + winner[0] + " is winning with " + winner[1] + "points"

  parsePoints = (points) ->
    parseInt points.replace(/\s+/, ''), 10

  addPoints = (name, toAdd) ->
    points[name] = if points[name] then points[name] + toAdd else toAdd
