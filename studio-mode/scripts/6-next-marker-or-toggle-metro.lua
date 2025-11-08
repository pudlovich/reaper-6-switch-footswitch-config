local NEXT_MARKER_COMMAND_ID = 40173
local TOGGLE_METRONOME_COMMAND_ID = 40364

if reaper.GetPlayState() < 5 then -- not recording
  reaper.Main_OnCommand(NEXT_MARKER_COMMAND_ID,0)
else
  reaper.Main_OnCommand(TOGGLE_METRONOME_COMMAND_ID,0)
end
