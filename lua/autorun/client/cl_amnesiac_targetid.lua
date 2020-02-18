-- Target ID integration for an info popup when looking at an unconfirmed dead players body
local revivematerial = Material("vgui/ttt/icon_amnic")

hook.Add("TTTRenderEntityInfo", "ttt_role_amnesiac_targetid", function(tData)

	local client = LocalPlayer()
	local ent = tData:GetEntity()

	-- has to be a ragdoll
	if not IsValid(ent) or ent:GetClass() ~= "prop_ragdoll" then return end

	-- only show this if the ragdoll has a nick, else it could be a mattress
	if not CORPSE.GetPlayerNick(ent, false) then return end

	if client:GetSubRole() ~= ROLE_AMNESIAC then return end

	local corpse_found = CORPSE.GetFound(ent, false) or not DetectiveMode()
	
	if corpse_found then return end
	
	tData:AddDescriptionLine(LANG.TryTranslation("ttt2_role_amnesiac_targetid"), AMNESIAC.color)

	tData:AddIcon(revivematerial, AMNESIAC.color)
end)