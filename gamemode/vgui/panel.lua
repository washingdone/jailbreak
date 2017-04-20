local PNL = {};
local color_shade = Color(255,255,255,5);
local color_bg = Color(20,20,20);
local color_bg_weak  = Color(20,20,20,240);
local matGradient = Material("materials/jailbreak_excl/gradient.png"); 

function PNL:Paint(w,h)
	surface.SetMaterial(matGradient);
	surface.SetDrawColor(color_bg);
	surface.DrawTexturedRect(0,0,w,h);
	surface.SetDrawColor(color_bg_weak);
	surface.DrawRect(0,0,w,h);
	draw.RoundedBox(0,0,0,w,1,color_shade);
end
vgui.Register("JB.Panel",PNL,"EditablePanel");
	