JB.Zones={}

hook.Add("InitPostEntity","JB.InitPostEntity.LoadZones",function()
  if not file.Exists("jailbreak","DATA") then
    file.CreateDir("jailbreak")
  end

  if not file.Exists("jailbreak/zones","DATA") then
    file.CreateDir("jailbreak/zones")
  end

  if file.Exists("jailbreak/zones/"..game.GetMap()..".txt","DATA") then
    local data=util.JSONToTable(file.Read("jailbreak/zones/"..game.GetMap()..".txt","DATA"));

    if not data or not data[1] then return end

    JB.Zones=data

    for k,v in pairs(data) do
      local ent=ents.Create("jb_zone")
      ent:SetPos(Vector(0,0,0))
      ent:Spawn()

      ent.handle_min:SetPos(Vector(v.startpos))
      ent.handle_max:SetPos(Vector(v.endpos))
      ent._zoneid=k;
    end
  end
end)

function JB.SaveZone(startpos,endpos,zoneid)
  if not file.Exists("jailbreak","DATA") then
    file.CreateDir("jailbreak")
  end

  if not file.Exists("jailbreak/zones","DATA") then
    file.CreateDir("jailbreak/zones")
  end

  if not zoneid then
    zoneid = (#JB.Zones) + 1
  end

  JB.Zones[zoneid] = {}
  JB.Zones[zoneid]["startpos"]=startpos
  JB.Zones[zoneid]["endpos"]=endpos



  file.Write("jailbreak/zones/"..(game.GetMap())..".txt",util.TableToJSON(JB.Zones))

  print(startpos,endpos)

  PrintTable(JB.Zones)

  return zoneid
end

concommand.Add("jb_admin_configmode",function(ply)
	if not ply:IsSuperAdmin() then return end

	ply:Give("weapon_physgun")
	ply:SelectWeapon("weapon_physgun")
	ply:ChatPrint("You have entered map configuration mode.")
end)

local waitSave=false;
function JB.Gamemode:OnPhysgunFreeze(weapon, physobj, ent, ply)
	if not ply:IsSuperAdmin() or waitSave then return false end

	if not IsValid(ent) or ent:GetClass() ~= "jb_zone_handle" then return false end

	ent.isPositioned=true;

	local finishEnt=ent:GetZoneEntity()

	if IsValid(finishEnt.handle_min) and IsValid(finishEnt.handle_max) and finishEnt.handle_min.isPositioned and finishEnt.handle_max.isPositioned then
    ent._zoneid=JB.SaveZone(tostring(finishEnt.handle_min:GetPos()),tostring(finishEnt.handle_max:GetPos()),ent._zoneid)

		ply:ChatPrint("Zone saved.")
	end

	return true
end

function JB.Gamemode:OnPhysgunReload(physgun, ply)
	if not ply:IsSuperAdmin() then return false end

	local ent=ents.Create("jb_zone")
	ent:Spawn()

	local ps=ply:GetEyeTrace().HitPos
	ent.handle_min:SetPos(ps+Vector(-.1,-.1,-.1))
	ent.handle_max:SetPos(ps+Vector(.1,.1,.1))

	ent:Think()

	ply:ChatPrint("Guard-only zone designator spawned. Freeze both handles (green circles) to save guard-only zone.")

	return true
end

function JB.Gamemode:PhysgunPickup(ply,ent)
		return ply:IsSuperAdmin() and ent:GetClass() == "jb_zone_handle"
end

local oldCleanup=game.CleanUpMap
function game.CleanUpMap(dontsend,filters)
  if not dontsend then
    dontsend=false
  end

  if not filters then
    filters={}
  end

  table.insert(filters,"jb_zone_handle")
  table.insert(filters,"jb_zone")

  return oldCleanup(dontsend,filters)
end
