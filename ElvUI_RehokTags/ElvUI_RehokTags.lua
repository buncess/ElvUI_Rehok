local E, L, V, P, G = unpack(ElvUI)
local RT = E:NewModule('RehokTags');
local _G = _G


function RT:NewTags() 
	
	-- Displays CurrentHP | Percent --(2.04B | 100)--
	_G["ElvUF"].Tags.Events['rcurrper'] = 'UNIT_HEALTH_FREQUENT UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED'
	_G["ElvUF"].Tags.Methods['rcurper'] = function(unit)
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
	_G["ElvUF"].Tags.Events['rcurr'] = 'UNIT_HEALTH_FREQUENT UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED'
	_G["ElvUF"].Tags.Methods['rcurr'] = function(unit)
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
	_G["ElvUF"].Tags.Events['rper'] = 'UNIT_HEALTH_FREQUENT UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED'
	_G["ElvUF"].Tags.Methods['rper'] = function(unit)
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
	_G["ElvUF"].Tags.Events['rpow'] = 'UNIT_POWER UNIT_POWER_FREQUENT'
	_G["ElvUF"].Tags.Methods['rpow'] = function(unit) 
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
	_G["ElvUF"].Tags.Events['rcurrpow'] = 'UNIT_POWER UNIT_POWER_FREQUENT'
	_G["ElvUF"].Tags.Methods['rcurrpow'] = function(unit) 
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



 -- Displays long names better --(First Name Second Name Last Name = F.S Last Name)--
	_G["ElvUF"].Tags.Methods['rname'] = function(unit) 
		local name = UnitName(unit)
		name = name:gsub('(%S+) ',function(t) return t:sub(1,1)..'.' end)
    return name
end
end



-- Testing later, Just saving code

function()

local isLogging = LoggingCombat(toggle)
if isLogging == 1 then
return true
end


function RT:Initialize()
	print("|cffe300ffRehok Tags have Initialized.|r")
	RT:NewTags()
end

E:RegisterModule(RT:GetName())
