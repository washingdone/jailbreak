local color_text = Color(230,230,230,200);
local matGradient = Material("materials/jailbreak_excl/gradient.png");

local frame;
function JB.MENU_WARDEN()
	if IsValid(frame) then frame:Remove() end
	
	if LocalPlayer().GetWarden and LocalPlayer():GetWarden() and tobool(JB.Config.wardenControl) then
		frame = vgui.Create("JB.Frame");
		frame:SetTitle("Warden controls");
		frame:SetWide(620);
		
		local yBottom = 25;
		
		
		
		local lbl = Label("Game options",frame);
				lbl:SetFont("JBLarge");
				lbl:SetColor(JB.Color["#EEE"]);
				lbl:SizeToContents();
				lbl:SetPos(15,yBottom + 10);
		
		yBottom = lbl.y + lbl:GetTall();
		
		local function addButton(toggle,name,click)
			if not toggle then
				local btn = frame:Add("JB.Button");
				btn:SetPos(15,yBottom+10);
				btn:SetSize(frame:GetWide() - 30, 32);
				btn:SetText(name);
				btn.OnMouseReleased = click;
				
				yBottom = btn.y + btn:GetTall();
			else
				local lbl = Label(name,frame);
				lbl:SetFont("JBNormal");
				lbl:SetColor(color_text);
				lbl:SizeToContents();
				lbl:SetPos(15+8,yBottom+10+32/2 - lbl:GetTall()/2);
			
				local btn = frame:Add("JB.Button");
				btn:SetPos(frame:GetWide()-15-64,yBottom+10);
				btn:SetSize(64, 32);
				btn:SetText(tobool(toggle) == true and "ON" or "OFF");
				btn.OnMouseReleased = function()
					btn:SetText(btn:GetText() == "OFF" and "ON" or "OFF");
					click();
				end
				
				yBottom = btn.y + btn:GetTall();
			end
		end
		
		
		
		addButton(tostring(IsValid(JB.TRANSMITTER) and JB.TRANSMITTER:GetJBWarden_PVPDamage()),"Friendlyfire for prisoners",function() RunConsoleCommand("jb_warden_changecontrol","PVP",tostring(not (IsValid(JB.TRANSMITTER) and JB.TRANSMITTER:GetJBWarden_PVPDamage()))) end);
		addButton(tostring(IsValid(JB.TRANSMITTER) and JB.TRANSMITTER:GetJBWarden_ItemPickup()),"Item pickup",function() RunConsoleCommand("jb_warden_changecontrol","Pickup",tostring(not (IsValid(JB.TRANSMITTER) and JB.TRANSMITTER:GetJBWarden_ItemPickup()))); end);
		
		yBottom = yBottom+5;
		local lbl = Label("Object spawning",frame);
				lbl:SetFont("JBLarge");
				lbl:SetColor(JB.Color["#EEE"]);
				lbl:SizeToContents();
				lbl:SetPos(15,yBottom + 10);
		
		yBottom = lbl.y + lbl:GetTall();
		
		addButton(false,"Spawn ammo box",function() RunConsoleCommand("jb_warden_spawn","AmmoBox") end);
		addButton(false,"Spawn breakable crate",function() RunConsoleCommand("jb_warden_spawn","Crate") end);
		addButton(false,"Spawn blockade",function() RunConsoleCommand("jb_warden_spawn","Blockade") end);
		
		yBottom = yBottom+10;
		local lbl = Label("Prebuilt Days",frame);
				lbl:SetFont("JBLarge");
				lbl:SetColor(JB.Color["#EEE"]);
				lbl:SizeToContents();
				lbl:SetPos(15,yBottom + 10);
		
		yBottom = lbl.y + lbl:GetTall();
		
		local left = frame:Add("JB.Panel");
		left:SetSize(math.Round(frame:GetWide() * .35) - 15,250);
		left:SetPos(10,yBottom + 10);
		
		local right = frame:Add("JB.Panel");
		right:SetSize(math.Round(frame:GetWide() * .65) - 15,250);
		right:SetPos(left:GetWide() + left.x + 10,yBottom + 10);
		
		frame:SetTall(math.Round(yBottom + right:GetTall() + 25))
		
		
		-- populate right panel
		local day_selected;
		local lbl_DayName = Label("",right);
		lbl_DayName:SetPos(20,20);
		lbl_DayName:SetFont("JBLarge");
		lbl_DayName:SizeToContents();
		lbl_DayName:SetColor(color_text);

		local lbl_DayDetails = Label("",right);
		lbl_DayDetails:SetPos(20,lbl_DayName.y + lbl_DayName:GetTall() + 16);
		lbl_DayDetails:SetColor(color_text);
		lbl_DayDetails:SetFont("JBSmall");
		lbl_DayDetails:SetSize(right:GetWide() - 40,right:GetTall() - lbl_DayDetails.y - 30-30-32);
		lbl_DayDetails:SetWrap(true);
		lbl_DayDetails:SizeToContents();

		local btn_accept = right:Add("JB.Button");
		btn_accept:SetSize(right:GetWide() - 60,32);
		btn_accept:SetPos(30,right:GetTall() - 30 - btn_accept:GetTall());
		btn_accept:SetText("Start Day");
		btn_accept.OnMouseReleased = (function()
			RunConsoleCommand("jb_day_start",day_selected:GetID());
			if IsValid(frame) then frame:Remove() end
		end);
		btn_accept:SetVisible(false);
		
		
		--populate left panel
		local function selectDay(day)
			if not JB.ValidDay(day) then return end


			btn_accept:SetVisible(true);

			lbl_DayName:SetText(day:GetName());
			lbl_DayName:SizeToContents();

			lbl_DayDetails:SetPos(20,lbl_DayName.y + lbl_DayName:GetTall() + 16);
			lbl_DayDetails:SetSize(right:GetWide() - 40,right:GetTall() - lbl_DayDetails.y - 30-30-32);
			lbl_DayDetails:SetText(day:GetDescription());
			lbl_DayDetails:SetWrap(true);

			day_selected = day;
		end

		left:DockMargin(0,0,0,0);

		for k,v in pairs(JB.DayTypes)do
			local pnl = vgui.Create("JB.Panel",left);
			pnl:SetTall(26);
			pnl:Dock(TOP);
			pnl:DockMargin(6,6,6,0);
			pnl.a = 80;
			pnl.Paint = function(self,w,h)
				draw.RoundedBox(4,0,0,w,h,JB.Color["#777"]);
				
				self.a = Lerp(0.1,self.a,self.Hover and 140 or 80);

				surface.SetMaterial(matGradient);
				surface.SetDrawColor(Color(0,0,0,self.a));
				surface.DrawTexturedRectRotated(w/2,h/2,w,h,180);

				surface.SetDrawColor(JB.Color.white);
				surface.SetMaterial(v:GetIcon());
				surface.DrawTexturedRect(5,5,16,16);

				draw.SimpleText(v:GetName(),"JBNormal",28,h/2,JB.Color.white,0,1);
			end

			local dummy = vgui.Create("Panel",pnl);
			dummy:SetSize(pnl:GetWide(),pnl:GetTall());
			dummy:SetPos(0,0);
			dummy.OnMouseReleased = function()
				selectDay(v);
			end
			dummy.OnCursorEntered = function()
				pnl.Hover = true;
			end
			dummy.OnCursorExited=function()
				pnl.Hover = false;
			end

			pnl.PerformLayout = function(self)
				dummy:SetSize(self:GetWide(),self:GetTall());
			end
		end
		
		
		frame:Center();
		frame:MakePopup();
	elseif JB.State == STATE_SETUP and not IsValid(JB:GetWarden()) then
		frame = vgui.Create("JB.Frame");
		frame:SetTitle("Claim warden");
		
		local lbl = Label("Do not claim warden if you don't own a microphone or can't use your microphone.\n Distorted microphone owners are not allowed to claim warden.\n \n Things to remember:\n 1)When giving orders you MUST say no detours or delays. If you don't it is a freeday.\n 2)Cell doors must be open by 9:00 or it is a freeday. The cells must remain open after the first time they are opened.\n 3)You can not make Microphones or Fists KOS.\n 4)Friendly fire is allowed once every three rounds.\n 5)Warday/Seigeday can only be done once every 3 rounds.\n 6)Prisoners do NOT get LR on freedays.\n \n Banned days:\n 1)Isolation Day\n 2)Bloodbath Day\n 3)Extermination Day\n 4)Random Day\n Doing any of those days, even under a different name, is NOT allowed.",frame);
		lbl:SetFont("JBSmall");
		lbl:SetColor(color_text);
		lbl:SizeToContents();
		lbl:SetPos(15,30+15);
		
		local btn = frame:Add("JB.Button");
		btn:SetSize(math.Round(lbl:GetWide()),32);
		btn:SetText("Claim Warden");
		
		btn:SetPos(15,lbl.y + lbl:GetTall() + 15);
		
		btn.OnMouseReleased = function()
			RunConsoleCommand("jb_claim_warden");
			frame:Remove();
		end	
		
		frame:SetSize(lbl:GetWide() + 30,btn.y + btn:GetTall() + 15);
		
		local setupTime;
		local timeLeft;
		frame.Think = function()
			setupTime = tonumber(JB.Config.setupTime);
			timeLeft = math.ceil(math.Clamp(setupTime - math.abs(CurTime() - JB.RoundStartTime),0,setupTime) );
			if timeLeft <= 0 or IsValid(JB:GetWarden()) then
				frame:Remove();
				JB.MENU_WARDEN();
				
				return;
			end
			
			frame:SetTitle("Claim Warden ("..timeLeft.." s)");			
		end
		
		frame:Center();
		frame:MakePopup();
	else
		frame = vgui.Create("JB.Frame");
		frame:SetTitle("Claim warden");

		local lbl = Label("You can only claim warden if it's the start of the round and there is no warden yet.",frame);
		lbl:SetFont("JBSmall");
		lbl:SetColor(color_text);
		lbl:SizeToContents();
		lbl:SetPos(15,30+15);
		frame:SetSize(lbl:GetWide() + 30,30+15+lbl:GetTall()+15);
		
		frame:Center();
		frame:MakePopup();
	end
end
