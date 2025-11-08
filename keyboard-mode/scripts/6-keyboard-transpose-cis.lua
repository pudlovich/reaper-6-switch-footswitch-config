function getTrackByName(name)
  for trackIndex = 0, reaper.CountTracks(0) - 1 do
    local track = reaper.GetTrack(0, trackIndex)
    local ok, trackName = reaper.GetSetMediaTrackInfo_String(track, 'P_NAME', '', false)

    if ok and trackName == name then
      return track -- found it! stopping the search here
    end
  end
end

channel = 0 -- channel 0 = MIDI channel 1
function send_next_note_off(note)
    reaper.StuffMIDIMessage(0, 0x80, note, 0)
    next_note = note + 1

    if next_note <= 127 then
        reaper.defer(send_next_note_off(next_note)) -- schedule next note in next cycle
    end
end

local track = getTrackByName("transpose-c#")

if track then -- if a track named "transpose-c#" was found
  send_next_note_off(37)
  if reaper.GetMediaTrackInfo_Value(track, "I_FXEN") == 1 then
    reaper.SetMediaTrackInfo_Value(track,"I_FXEN",0)
  else
    reaper.SetMediaTrackInfo_Value(track,"I_FXEN",1)
  end
  send_next_note_off(37)
end

local track = getTrackByName("transpose-f")
if track then -- if a track named "transpose-f" was found
  reaper.SetMediaTrackInfo_Value(track,"I_FXEN",0)
end