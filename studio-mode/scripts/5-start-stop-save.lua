local PLAY_STOP_COMMAND_ID = 40044
local STOP_AND_SAVE_COMMAND_ID = 40667
local MOVE_TO_PREVIOUS_MARKER_COMMAND_ID = 40172

if reaper.GetPlayState() < 5 then -- not recording
  if reaper.GetPlayState() == 1 then
    reaper.Main_OnCommand(MOVE_TO_PREVIOUS_MARKER_COMMAND_ID,0)
  end 
  reaper.Main_OnCommand(PLAY_STOP_COMMAND_ID,0)
else -- recording
  reaper.Main_OnCommand(STOP_AND_SAVE_COMMAND_ID,0)
end
