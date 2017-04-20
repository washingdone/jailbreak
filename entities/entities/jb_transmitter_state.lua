AddCSLuaFile();

ENT.Base 				="base_point"
ENT.Type				="point"
ENT.PrintName 			="JB State Transmitter"

function ENT:Initialize()
	JB.TRANSMITTER = self;
	JB:DebugPrint("Setup State Transmitter!");
	//self:SetPredictable(true);
end
function ENT:Think()
	if not IsValid(JB.TRANSMITTER) and IsValid(self) then // there is no registered transmitter and yet we're here. What's going on? Let's assume that we are the transmitter that is being looked for.
		JB.TRANSMITTER = self;
	end
end
function ENT:SetupDataTables()
	self:NetworkVar( "Int",	0, "JBState" );
	self:NetworkVar( "Int",	1, "JBRoundsPassed" );
	
	self:NetworkVar( "Vector", 0, "JBWarden_PointerPos")
	self:NetworkVar( "Vector", 1, "JBWarden_GreenPointerPos")
	
	self:NetworkVar( "String", 0, "JBLastRequestPicked" );
	self:NetworkVar( "String", 0, "JBDayPicked" );
	self:NetworkVar( "String", 1, "JBWarden_PointerType");
	self:NetworkVar( "String", 2, "JBWarden_GreenPointerType");
	
	self:NetworkVar( "Float", 0, "JBRoundStartTime" );
		
	self:NetworkVar( "Entity", 0, "JBLastRequestPrisoner" );
	self:NetworkVar( "Entity", 1, "JBLastRequestGuard" );
	self:NetworkVar( "Entity", 2, "JBWarden" );

	self:NetworkVar ( "Bool", 0, "JBWarden_PVPDamage");
	self:NetworkVar ( "Bool", 1, "JBWarden_ItemPickup");
		
	if ( SERVER ) then
		self:SetJBRoundStartTime(0);
		self:SetJBState(STATE_IDLE);
		self:SetJBRoundsPassed(0);
		self:SetJBWarden_PointerType("0");
		self:SetJBWarden_GreenPointerType("0");
		self:SetJBWarden_PointerPos(Vector(0,0,0));
		self:SetJBWarden_GreenPointerPos(Vector(0,0,0));
	end
end
function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS;
end
function ENT:KeyValue( key, value )
	if ( self:SetNetworkKeyValue( key, value ) ) then
		return
	end
end
function ENT:CanEditVariables( ply )
	return false;
end