local STOP_AND_DELETE_COMMAND_ID = 40668
local ITEM_DOWN_COMMAND_ID = 40118

if reaper.GetPlayState() > 4 then
  reaper.Main_OnCommand(STOP_AND_DELETE_COMMAND_ID,0)
else
  reaper.Main_OnCommand(ITEM_DOWN_COMMAND_ID,0)
  reaper.Main_OnCommand(ITEM_DOWN_COMMAND_ID,0)
  reaper.Main_OnCommand(ITEM_DOWN_COMMAND_ID,0)
end
