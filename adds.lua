-- input 1 - pitch cv
-- input 2 - offset cv

local offset = 0.0

input[1].stream = function(volts) 
  output[1].volts = input[1].volts + offset
end

input[2].stream = function(volts)
  offset = math.floor(volts)
end

function init()
  input[1].mode('stream', 0.01)
  input[2].mode('stream', 0.01)
end
