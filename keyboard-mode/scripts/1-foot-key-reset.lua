function getTrackByName(name)
  for trackIndex = 0, reaper.CountTracks(0) - 1 do
    local track = reaper.GetTrack(0, trackIndex)
    local ok, trackName = reaper.GetSetMediaTrackInfo_String(track, 'P_NAME', '', false)

    if ok and trackName == name then
      return track -- found it! stopping the search here
    end
  end
end

function mute(track)
  reaper.SetTrackUIMute(track, 1, 0)
end

function unmute(track)
  reaper.SetTrackUIMute(track, 0, 0)
end

local keyagnostic = getTrackByName("key-agnostic")
local Am = getTrackByName("Am (C#m Fm) ||no M6M3")
local Dm = getTrackByName("Dm (F#m Bbm) ||no M7M3")
local Gm = getTrackByName("Gm (Bm Ebm) ||no M7b5")
local Cm = getTrackByName("Cm (Em G#m) ||no b5b2")
local Fm = getTrackByName("Fm (Am C#m) ||no b6b2")
local Em = getTrackByName("Em (G#m Cm) ||no M2M6")

local agnostic5 = getTrackByName("5th")
local agnostic3 = getTrackByName("M3")
local agnostic7 = getTrackByName("b7")

local keydirect3 = getTrackByName("d3")
local keyshell3 = getTrackByName("sh3")
local key56 = getTrackByName("56")
local keyflex56 = getTrackByName("flex56")
local keyshell7 = getTrackByName("sh7")

local downtrack = getTrackByName("octave-down")
local uptrack = getTrackByName("octave-up")

if keyagnostic then
  unmute(keyagnostic)
  mute(Am)
  mute(Dm)
  mute(Gm)
  mute(Cm)
  mute(Fm)
  mute(Em)
  
  -- set agnostic voice – all muted, root only
  mute(agnostic5)
  mute(agnostic3)
  mute(agnostic7)
  -- set keyed voices – all muted, root only
  mute(keydirect3)
  mute(keyshell3)
  mute(key56)
  mute(keyflex56)
  mute(keyshell7)
  
  reaper.SetMediaTrackInfo_Value(downtrack,"I_FXEN",0)
  reaper.SetMediaTrackInfo_Value(uptrack,"I_FXEN",0)
end