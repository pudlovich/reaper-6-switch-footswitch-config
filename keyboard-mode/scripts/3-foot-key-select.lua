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

local keyagnostic = getTrackByName("key-agnostic")
local Am = getTrackByName("Am (C#m Fm) ||no M6M3")
local Dm = getTrackByName("Dm (F#m Bbm) ||no M7M3")
local Gm = getTrackByName("Gm (Bm Ebm) ||no M7b5")
local Cm = getTrackByName("Cm (Em G#m) ||no b5b2")
local Fm = getTrackByName("Fm (Am C#m) ||no b6b2")
local Em = getTrackByName("Em (G#m Cm) ||no M2M6")

if isActive(keyagnostic) then
  mute(keyagnostic)
  unmute(Am)
  mute(Dm)
  mute(Gm)
  mute(Cm)
  mute(Fm)
  mute(Em)
elseif isActive(Am) then
  mute(keyagnostic)
  mute(Am)
  unmute(Dm)
  mute(Gm)
  mute(Cm)
  mute(Fm)
  mute(Em)
elseif isActive(Dm) then
  mute(keyagnostic)
  mute(Am)
  mute(Dm)
  unmute(Gm)
  mute(Cm)
  mute(Fm)
  mute(Em)
elseif isActive(Gm) then
  mute(keyagnostic)
  mute(Am)
  mute(Dm)
  mute(Gm)
  unmute(Cm)
  mute(Fm)
  mute(Em)
elseif isActive(Cm) then
  mute(keyagnostic)
  mute(Am)
  mute(Dm)
  mute(Gm)
  mute(Cm)
  unmute(Fm)
  mute(Em)
elseif isActive(Fm) then
  mute(keyagnostic)
  mute(Am)
  mute(Dm)
  mute(Gm)
  mute(Cm)
  mute(Fm)
  unmute(Em)
else
  unmute(keyagnostic)
  mute(Am)
  mute(Dm)
  mute(Gm)
  mute(Cm)
  mute(Fm)
  mute(Em)
end
