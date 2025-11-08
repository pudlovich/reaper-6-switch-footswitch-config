local channel = 6
local note = 38

function note_on()
    reaper.StuffMIDIMessage(0, 0x90 + channel, note, 100)
    reaper.defer(note_off)
end

function note_off()
    reaper.StuffMIDIMessage(0, 0x80 + channel, note, 0)
end

note_on()
