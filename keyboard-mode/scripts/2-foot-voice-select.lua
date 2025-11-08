function getTrackByName(name)
  for trackIndex = 0, reaper.CountTracks(0) - 1 do
    local track = reaper.GetTrack(0, trackIndex)
    local ok, trackName = reaper.GetSetMediaTrackInfo_String(track, 'P_NAME', '', false)

    if ok and trackName == name then
      return track -- found it! stopping the search here
    end
  end
end

function isActive(track)
  local retval
  local muteval
  retval, muteval = reaper.GetTrackUIMute(track)
  return (not muteval)
end

function mute(track)
  reaper.SetTrackUIMute(track, 1, 0)
end

function unmute(track)
  reaper.SetTrackUIMute(track, 0, 0)
end

-- 0 | default is root only
-- 1 | -FIFTHS-   |  shell 3 + flexible 56
-- 2 | 1 M3 P5    |  shell 3 + shell 7
-- 3 | 1 M3 b7    |  shell 3 + key56 + shell 7
-- 4 | 1 M3 P5 b7 |  shell 3 + key56
-- 5 | 1 M3       |  low 3 + flexible 56
-- 6 | 1 b7       |  low 3 + shell 7
-- 7 | 1 P5 b7    |  low 3 + key56

local agnostic5 = getTrackByName("5th")
local agnostic3 = getTrackByName("M3")
local agnostic7 = getTrackByName("b7")
local keydirect3 = getTrackByName("d3")
local keyshell3 = getTrackByName("sh3")
local key56 = getTrackByName("56")
local keyflex56 = getTrackByName("flex56")
local keyshell7 = getTrackByName("sh7")

local state0 = (not isActive(agnostic3)) and (not isActive(agnostic5)) and (not isActive(agnostic7))
local state1 = (not isActive(agnostic3)) and isActive(agnostic5) and (not isActive(agnostic7))
local state2 = isActive(agnostic3) and isActive(agnostic5) and (not isActive(agnostic7))
local state3 = isActive(agnostic3) and (not isActive(agnostic5)) and isActive(agnostic7)
local state4 = isActive(agnostic3) and isActive(agnostic5) and isActive(agnostic7)
local state5 = isActive(agnostic3) and (not isActive(agnostic5)) and (not isActive(agnostic7))
local state6 = (not isActive(agnostic3)) and (not isActive(agnostic5)) and isActive(agnostic7)
local state7 = (not isActive(agnostic3)) and isActive(agnostic5) and isActive(agnostic7)

if state0 then
  -- turn on fifths
  mute(agnostic3)
  unmute(agnostic5)
  mute(agnostic7)

  -- set state 1 in keyed system
  mute(keydirect3)
  unmute(keyshell3)
  mute(key56)
  unmute(keyflex56)
  mute(keyshell7)
elseif state1 then
  -- turn on thirds
  unmute(agnostic3)
  unmute(agnostic5)
  mute(agnostic7)

  -- set state 2 in keyed system
  mute(keydirect3)
  unmute(keyshell3)
  mute(key56)
  mute(keyflex56)
  unmute(keyshell7)
elseif state2 then
  unmute(agnostic3)
  mute(agnostic5)
  unmute(agnostic7)

  -- set state 3 in keyed system
  mute(keydirect3)
  unmute(keyshell3)
  unmute(key56)
  mute(keyflex56)
  unmute(keyshell7)
elseif state3 then
  unmute(agnostic3)
  unmute(agnostic5)
  unmute(agnostic7)

  -- set state 4 in keyed system
  mute(keydirect3)
  unmute(keyshell3)
  unmute(key56)
  mute(keyflex56)
  mute(keyshell7)
elseif state4 then
  unmute(agnostic3)
  mute(agnostic5)
  mute(agnostic7)

  -- set state 5 in keyed system
  unmute(keydirect3)
  mute(keyshell3)
  mute(key56)
  unmute(keyflex56)
  mute(keyshell7)
elseif state5 then
  mute(agnostic3)
  mute(agnostic5)
  unmute(agnostic7)

  -- set state 6 in keyed system
  unmute(keydirect3)
  mute(keyshell3)
  mute(key56)
  mute(keyflex56)
  unmute(keyshell7)
elseif state6 then
  mute(agnostic3)
  unmute(agnostic5)
  unmute(agnostic7)

  -- set state 7 in keyed system
  unmute(keydirect3)
  mute(keyshell3)
  unmute(key56)
  mute(keyflex56)
  mute(keyshell7)
else
  -- return to state 0, mute everything
  mute(agnostic3)
  mute(agnostic5)
  mute(agnostic7)
  mute(keydirect3)
  mute(keyshell3)
  mute(key56)
  mute(keyflex56)
  mute(keyshell7)
end

