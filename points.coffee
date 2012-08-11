# Description:
#   counts your points DUH
#
# Commands:
#
#   @ben +10
#   +10 @ben
#   -10 @ben
#   @ben -100

module.exports = (robot) ->
  points = {}

  robot.hear /([+-]\d+)\s*\@(\w+)/, (msg) ->
    addPoints msg.match[2], msg.match[1]

  robot.hear /\@(\w+)\s*([+-]\d+)/, (msg) ->
    addPoints msg.match[1], msg.match[2]

  robot.respond /points/i, (msg) ->
    msg.send JSON.stringify points, null, 4

  addPoints = (name, toAdd) ->
    toAdd = parseInt toAdd, 10
    points[name] = if points[name] then points[name] + toAdd else toAdd