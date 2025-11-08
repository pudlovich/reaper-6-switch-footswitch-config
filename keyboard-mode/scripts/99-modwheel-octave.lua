function getTrackByName(name)
  for trackIndex = 0, reaper.CountTracks(0) - 1 do
    local track = reaper.GetTrack(0, trackIndex)
    local ok, trackName = reaper.GetSetMediaTrackInfo_String(track, 'P_NAME', '', false)

    if ok and trackName == name then
      return track -- found it! stopping the search here
    end
  end
end

local downtrack = getTrackByName("octave-down")
local uptrack = getTrackByName("octave-up")

if downtrack then -- if a track named "octave-down" was found
  local retval,  buf,  ts,  devIdx = reaper.MIDI_GetRecentInputEvent(0)
  modval = string.byte(buf,3) -- Data Byte 2
  if modval > 117 then
    reaper.SetMediaTrackInfo_Value(downtrack,"I_FXEN",0)
    reaper.SetMediaTrackInfo_Value(uptrack,"I_FXEN",1)
  elseif modval < 10 then
    reaper.SetMediaTrackInfo_Value(downtrack,"I_FXEN",1)
    reaper.SetMediaTrackInfo_Value(uptrack,"I_FXEN",0)
  else
    reaper.SetMediaTrackInfo_Value(downtrack,"I_FXEN",0)
    reaper.SetMediaTrackInfo_Value(uptrack,"I_FXEN",0)
  end
end
