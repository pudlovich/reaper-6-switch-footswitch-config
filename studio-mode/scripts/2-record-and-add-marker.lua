local RECORD_COMMAND_ID = 1013
local INSERT_MARKER_COMMAND_ID = 40157

if reaper.GetPlayState() < 5 then --if not recording; Reaper takes care of not doubling markers
  reaper.Main_OnCommand(INSERT_MARKER_COMMAND_ID,0)
end
reaper.Main_OnCommand(RECORD_COMMAND_ID,0)