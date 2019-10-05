-- input 1 - pitch cv
-- input 2 - octave cv

local adder = 0.0

local function set_adder(v)
  adder = math.floor(v)
end

input[1].stream = function(volts) 
  output[1].volts = input[1].volts + adder
end

function init()
  input[1].mode('stream', 0.01)
  input[2].mode('stream', 0.01)

  metro[1].event = function()
    set_adder(input[2].volts)
  end
  metro[1].time = 0.01
  metro[1]:start()
end
