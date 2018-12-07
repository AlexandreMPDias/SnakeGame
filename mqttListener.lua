msgr = require "mqttLoveLibrary"

local client = "1413183"
local channel = "snakegame"
mqttListener = {}
mqttListener.start = function (handler)
  msgr.start(client, channel, 
             handler) 
end
mqttListener.check = function() 
  msgr.checkMessages()
end

return mqttListener

  