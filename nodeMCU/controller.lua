--Configura portas
local sw1 = 1
local sw2 = 2

--Configura mqtt
local msgr = require "mqttNodeMCULibrary"
local client = '1413183'
local channel = 'snakegame'

local movement = ''

local function receivedMessage (msg)
end

local function handlerButton1 (level, timestamp)
  if #movement == 0 then
    movement = 'right'
    msgr.sendMessage(movement, channel)
    mytimer:start()
  end
end

local function handlerButton2 (level, timestamp)
  if #movement == 0 then
    movement = 'left'
    msgr.sendMessage(movement, channel)
    mytimer:start()
  end
end

local function resetMovement()
  movement = ''
end

-- coloca um sinal estavel nas chaves 1 e 2
gpio.mode(sw1,gpio.INT,gpio.PULLUP)
gpio.mode(sw2,gpio.INT,gpio.PULLUP)

-- cadastra a funcao cbchave para ser chamada se
-- a chave 1 for apertada
gpio.trig(sw1, "down", handlerButton1)

-- cadastra a funcao cbchave para ser chamada se
-- a chave 2 for apertada
gpio.trig(sw2, "down", handlerButton2)

msgr.start(client, _ , _ )

--Timer para bloquear mais de um envio
mytimer = tmr.create()
mytimer:register(300, tmr.ALARM_AUTO, resetMovement)
