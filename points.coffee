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
  robot.hear "", (msg) ->
    msg.send ""
  ###
  robot.respond /pug me/i, (msg) ->
    msg.http("http://pugme.herokuapp.com/random")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).pug

  ###