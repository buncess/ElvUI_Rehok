local E, L, V, P, G = unpack(ElvUI)
local RT = E:NewModule('RehokTags');
local _G = _G


function RT:NewTags() 
	
-- Displays CurrentHP | Percent --(2.04B | 100)--
_G["ElvUF"].Tags.Events['health:current|percent|rehok'] = 'UNIT_HEALTH_FREQUENT UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED'
_G["ElvUF"].Tags.Methods['health:current|percent|rehok'] = function(unit)
	local status = UnitIsDead(unit) and L["Dead"] or UnitIsGhost(unit) and L["Ghost"] or not UnitIsConnected(unit) and L["Offline"]
		if (status) then
			return status
		else
	local v = UnitHealth(unit)
	local p = (UnitHealth(unit)/UnitHealthMax(unit))*100
		if abs(v) >= 1e9 then
			return format("%.2fB", v / 1e9) .. " | " .. format("%.0f", p)
		elseif abs(v) >= 1e6 then
			return format("%.2fM", v / 1e6) .. " | " .. format("%.0f", p)
		elseif abs(v) >= 1e3 then
			return format("%.1fk", v / 1e3) .. " | " .. format("%.0f", p)
		else
			return format("%d", v) .. " | " .. format("%.1f", p)
		end
	end
end
	
-- Displays current HP --(2.04B, 2.04M, 204k, 204)--
_G["ElvUF"].Tags.Events['health:current|rehok'] = 'UNIT_HEALTH_FREQUENT UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED'
_G["ElvUF"].Tags.Methods['health:current|rehok'] = function(unit)
	local status = UnitIsDead(unit) and L["Dead"] or UnitIsGhost(unit) and L["Ghost"] or not UnitIsConnected(unit) and L["Offline"]
		if (status) then
		      	return status
		else
	local v = UnitHealth(unit)
		if abs(v) >= 1e9 then
			return format("%.2fB", v / 1e9)
		elseif abs(v) >= 1e6 then
			return format("%.2fM", v / 1e6)
		elseif abs(v) >= 1e3 then
			return format("%.1fK", v / 1e3)
		else
			return format("%d", v)
		end
	end
end

-- Displays Percent only --(intended for boss frames)--
_G["ElvUF"].Tags.Events['health:percent|rehok'] = 'UNIT_HEALTH_FREQUENT UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED'
_G["ElvUF"].Tags.Methods['health:percent|rehok'] = function(unit)
	local status = UnitIsDead(unit) and L["Dead"] or UnitIsGhost(unit) and L["Ghost"] or not UnitIsConnected(unit) and L["Offline"]
	if (status) then
		return status
	else
	local p = (UnitHealth(unit)/UnitHealthMax(unit))*100
		if p >= 1.1 then
			return format("%.0f", p)
		else
			return format("%.1f", p)
		end
	end
end



-- Displays current power and 0 when no power instead of hiding when at 0, Also formats it like HP tag
_G["ElvUF"].Tags.Events['power:current|rehok'] = 'UNIT_POWER UNIT_POWER_FREQUENT'
_G["ElvUF"].Tags.Methods['power:current|rehok'] = function(unit) 
	local v = UnitPower(unit)
	if abs(v) >= 1e9 then
		return format("%.2fB", v / 1e9)
	elseif abs(v) >= 1e6 then
		return format("%.2fM", v / 1e6)
	elseif abs(v) >= 1e3 then
		return format("%.1fk", v / 1e3)
	else
		return format("%d", v)
	end
end
	
 -- Displays CurrenPower | Percent --(2.04B | 100)--
_G["ElvUF"].Tags.Events['power:current|percent|rehok'] = 'UNIT_POWER UNIT_POWER_FREQUENT'
_G["ElvUF"].Tags.Methods['power:current|percent|rehok'] = function(unit) 
	local v = UnitPower(unit)
	local p = (UnitPower(unit)/UnitPowerMax(unit))*100
		if abs(v) >= 1e9 then
			return format("%.2fB", v / 1e9) .. " | " .. format("%.0f", p)		
		elseif abs(v) >= 1e6 then
			return format("%.2fM", v / 1e6) .. " | " .. format("%.0f", p)
		elseif abs(v) >= 1e3 then
			return format("%.1fk", v / 1e3) .. " | " .. format("%.0f", p)
		else
			return format("%d", v) .. " | " .. format("%.1f", p)
		end
	end
end

-- Displays current power --(2.04B, 2.04M, 204k, 204, 0)--
_G["ElvUF"].Tags.Events['power:current|rehok'] = 'UNIT_POWER UNIT_POWER_FREQUENT'
_G["ElvUF"].Tags.Methods['power:current|rehok'] = function(unit) 
	local v = UnitPower(unit)
		if abs(v) >= 1e9 then
			return format("%.2fB", v / 1e9)
		elseif abs(v) >= 1e6 then
			return format("%.2fM", v / 1e6)
		elseif abs(v) >= 1e3 then
			return format("%.1fk", v / 1e3)
		else
			return format("%d", v)
		end
	end
end

	
 -- Displays Power Percent
_G["ElvUF"].Tags.Events['power:percent|rehok'] = 'UNIT_POWER UNIT_POWER_FREQUENT'
_G["ElvUF"].Tags.Methods['power:percent|rehok'] = function(unit) 
local p = (UnitPower(unit)/UnitPowerMax(unit))*100
	return format("%.1f",p)
end


 -- Displays long names better --(First Name Second Name Last Name = F.S Last Name)--
_G["ElvUF"].Tags.Methods['name:short|rehok'] = function(unit) 
	local name = UnitName(unit)
		name = name:gsub('(%S+) ',function(t) return t:sub(1,1)..'.' end)
    	return name
	end
end


function RT:Initialize()
	print("|cA330C9ffRehok Tags|r have Initialized. Thank you for using my addon :)")
	RT:NewTags()
end

E:RegisterModule(RT:GetName())
