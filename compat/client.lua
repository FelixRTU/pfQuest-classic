-- some abstraction to allow multi-client code
local _, _, _, client = GetBuildInfo()

--local _G = _G or getfenv(0)
local gfind = string.gmatch or string.gfind

pfQuestCompat = {}
pfQuestCompat.mod = mod or math.mod
pfQuestCompat.gfind = string.gmatch or string.gfind
pfQuestCompat.itemsuffix = ":0:0:0:0:0:0:0"
pfQuestCompat.rotateMinimap = GetCVar("rotateMinimap") == "1"
pfQuestCompat.client = client

pfQuestCompat.InsertQuestLink = function(questid, name)
  local questid = questid or 0
  local fallback = name or UNKNOWN
  local level = pfDB["quests"]["data"][questid] and pfDB["quests"]["data"][questid]["lvl"] or 0
  local name = pfDB["quests"]["loc"][questid] and pfDB["quests"]["loc"][questid]["T"] or fallback
  local hex = pfUI.api.rgbhex(GetQuestDifficultyColor(level))

  ChatFrameEditBox:Show()
  if pfQuest_config["questlinks"] == "1" then
    ChatFrameEditBox:Insert(hex .. "|Hquest:" .. questid .. ":" .. level .. "|h[" .. name .. "]|h|r")
  else
    ChatFrameEditBox:Insert("[" .. name .. "]")
  end
end

-- return the player facing based on the minimap arrow
function pfQuestCompat.GetPlayerFacing()

  return GetPlayerFacing()

end
