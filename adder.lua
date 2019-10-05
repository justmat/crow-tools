-- input 1 - pitch cv
-- input 2 - offset cv

local offset = 0.0

local function set_offset(v)
  offset = math.floor(v)
end

input[1].stream = function(volts) 
  output[1].volts = input[1].volts + offset
end

function init()
  input[1].mode('stream', 0.01)
  input[2].mode('stream', 0.01)

  metro[1].event = function()
    set_offset(input[2].volts)
  end
  metro[1].time = 0.01
  metro[1]:start()
end
