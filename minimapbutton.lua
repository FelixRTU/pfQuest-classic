local _G = getfenv(0);
local LibStub = _G.LibStub;
local MiniMapButton = {};
local PfQuestMMButtonStub = LibStub("LibDBIcon-1.0");
pfQuestMiniMapButton = MiniMapButton;

-- LDB
--if not LibStub:GetLibrary("LibDataBroker-1.1", true) then return end

pfQuest_minimap = 
{
  minimapPos = 218,
  hide = false,
}

local MiniMapLDB = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("pfQuestMMIconData", {
  type = "launcher",
  text = "pfQuest",
  icon = pfQuestConfig.path.."\\img\\logo",
  iconSize = 31, --  <-- custom value (edited the lib)
  OnTooltipShow = function(tooltip)
      tooltip:SetText("pfQuest")
      tooltip:AddDoubleLine(pfQuest_Loc["Left-Click"], pfQuest_Loc["Open Browser"], 1, 1, 1, 1, 1, 1)
      tooltip:AddDoubleLine(pfQuest_Loc["Right-Click"], pfQuest_Loc["Open Configuration"], 1, 1, 1, 1, 1, 1)
      tooltip:Show()
    end,
  OnClick = function(self, button)
    if button == "RightButton" then
      if pfQuestConfig:IsShown() then pfQuestConfig:Hide() else pfQuestConfig:Show() end
    else
      if pfBrowser:IsShown() then pfBrowser:Hide() else pfBrowser:Show() end
    end
  end,
})

function MiniMapButton.Init()
  PfQuestMMButtonStub:Register("pfQuest", MiniMapLDB, pfQuest_minimap);
end

function MiniMapButton.UpdateVisibility()
  if pfQuest_config["minimapbutton"] == "1" then
    pfQuest_minimap.hide = false;
    PfQuestMMButtonStub:Show("pfQuest");
  else
    pfQuest_minimap.hide = true;
    PfQuestMMButtonStub:Hide("pfQuest");
  end
end