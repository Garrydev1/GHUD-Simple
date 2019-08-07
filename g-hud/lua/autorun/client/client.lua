--[[  
    Addon : GHUD
	By : Alexandre W - Garrydev.com
    Site : https://garrydev.com
    Discord : https://discord.gg/UJfRpWX
]]

surface.CreateFont( "police-1", {
	font = "coolvetica",
	extended = false,
	size = 19,
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

local tag = "ghud"

hook.Add("HUDPaint", "GHUD", function()

	local Avatar = vgui.Create( "AvatarImage", Panel )
    Avatar:SetSize( 90, 90 )
    Avatar:SetPos( 20, 975 )
    Avatar:SetPlayer( LocalPlayer(), 64 )

    local health = LocalPlayer():Health()
    local healthmaw = 100
    if (health > 100) then
        health = healthmax
    end

    local armor = LocalPlayer():Armor()
    if (armor > 100) then
        armor = 100
    end

    local food = LocalPlayer(): getDarkRPVar("Energy")
    math.Round( LocalPlayer():getDarkRPVar("Energy"), 0 )

    draw.RoundedBox(10, 105, ScrH() - 100, 200, 80, Color(0,0,0,200))

    draw.RoundedBox(4, 145, ScrH() - 90, 150, 13, Color(0,0,0,130))
    draw.RoundedBox(4, 145, ScrH() - 90, health * 1.5, 13, Color(117,4,4,255))

    draw.RoundedBox(4, 145, ScrH() - 66, 150, 13, Color(0,0,0,130))
    draw.RoundedBox(4, 145, ScrH() - 66, armor * 1.5, 13, Color(5,47,74,255))

    draw.RoundedBox(4, 145, ScrH() - 43, 150, 13, Color(0,0,0,130))
    draw.RoundedBox(4, 145, ScrH() - 43,  food * 1.5, 13, Color(164,112,2,255))

    local vie = Material( "hud/health.png" )
	surface.SetMaterial( vie )
	surface.SetDrawColor( 255, 255, 255 )
	surface.DrawTexturedRect( 117, ScrH()-91, 15, 15 )

	local armure = Material( "hud/armor.png" )
	surface.SetMaterial( armure )
	surface.SetDrawColor( 255, 255, 255 )
	surface.DrawTexturedRect( 117, ScrH()-66, 15, 15 )

	local manger = Material( "hud/hunger.png" )
	surface.SetMaterial( manger )
	surface.SetDrawColor( 255, 255, 255 )
	surface.DrawTexturedRect( 117, ScrH()-43, 15, 15 )

    if LocalPlayer():GetActiveWeapon() != NULL then

        local ammoinclip
        local extraammo
        local ammoinclip2
        local extraammo2

        if LocalPlayer():GetActiveWeapon():Clip1() < 0 then 
            ammoinclip = "∞"
            extraammo = ""
            ammoinclip2 = ""
            extraammo2 = ""
        elseif LocalPlayer():GetActiveWeapon():Clip1() > -1 then
            ammoinclip = LocalPlayer():GetActiveWeapon():Clip1()
            extraammo = "/"..LocalPlayer():GetAmmoCount( LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType() )
            ammoinclip2 = LocalPlayer():GetActiveWeapon():Clip2()
            extraammo2 = "/"..LocalPlayer():GetAmmoCount( LocalPlayer():GetActiveWeapon():GetSecondaryAmmoType() )

        end 

        draw.RoundedBox(10, 1600, ScrH() - 50, 280, 30, Color(0,0,0,200))

        draw.DrawText( LocalPlayer():GetActiveWeapon():GetPrintName(),"police-1", ScrW() - 300, ScrH() - 43, Color( 255, 255, 255 ) )
        draw.DrawText( ammoinclip..extraammo ,"police-1", ScrW() - 105, ScrH() - 43, Color( 255, 255, 255 ) )
    else

        draw.DrawText( "Vous êtes mort!" ,"police-1", ScrW() - 300, ScrH() - 43, Color( 255, 255, 255 ) )

    end
end)

local toHide = {
	DarkRP_HUD = false,
	DarkRP_EntityDisplay = false,
	DarkRP_LocalPlayerHUD = true,
	DarkRP_Hungermod = true,
	DarkRP_Agenda = true,
	DarkRP_LockdownHUD = true,
	DarkRP_ArrestedHUD = false,
	CHudBattery = true,
	CHudHealth = true,
	CHudAmmo = true,
	CHudSecondaryAmmo = true,
	TTTInfoPanel = true,
	TTTSpecHUD = true,
}
hook.Add("HUDShouldDraw", tag, function(name)
	if toHide[name] then return false end
end)










