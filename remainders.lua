--- Remainders (version 0.1)
-- modulo gesture generator/cv divider
-- Input a voltage and get 4 folded outputs based on a simple modulo operation. Perfect for your one knob to rule them all.

-- in 1: Gesture (CV) in (Great for knobs/joysticks)
-- in 2: Transpose in (Great for quantised melodies)
-- out 1-4: Voltages being folded 1 to 4 times, top to bottom. eg. Output 4 has modulo of 2 meaning it recents to 0V with every 2V increment meaning it folds 4 times.

function init()
    input[1].mode( 'stream', 0.01 )
    for n=1,4 do output[n].slew = 0.01 end
end

input[1].stream = function(v)
    transpose = input[2].volts
    for n=1,4 do
        remainder = v % (10/(n+1))
        output[n].volts = math.min(remainder + transpose, 10)
    end
end
