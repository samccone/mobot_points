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
  robot.hear /([+-]\d+)\s*\@(\w+)/, (msg) ->
    msg.send msg.match[2] + ' just got ' + msg.match[1] + ' points!'

  robot.hear /\@(\w+)\s*([+-]\d+)/, (msg) ->
    msg.send msg.match[1] + ' just got ' + msg.match[2] + ' points!'

  ###
  robot.respond /pug me/i, (msg) ->
    msg.http("http://pugme.herokuapp.com/random")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).pug

  ###