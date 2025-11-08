local STOP_AND_SAVE_COMMAND_ID = 40667
local SET_TO_RANDOM_COLOR_COMMAND_ID = 41332
local ITEM_DOWN_COMMAND_ID = 40118

if reaper.GetPlayState() > 4 then
  reaper.Main_OnCommand(STOP_AND_SAVE_COMMAND_ID,0)
  reaper.Main_OnCommand(SET_TO_RANDOM_COLOR_COMMAND_ID,0)
else
  reaper.Main_OnCommand(ITEM_DOWN_COMMAND_ID,0)
end

