PlayerData = {}
p = nil
BoardsCreated = {}
BoardTexturesUsed = {}
function DoObjectSettingThing(model)
	local settingObject = true
	local heading = GetEntityHeading(cache.ped) - 180.0
	lib.requestModel(model)
	local offset = GetOffsetFromEntityInWorldCoords(cache.ped, 0.0, 1.5, 0.0)
	local object = CreateObjectNoOffset(model, offset.x, offset.y, offset.z, true, true, false)
    SetEntityHeading(object, 0)
    SetEntityAlpha(object, 150)
    SetEntityCollision(object, false, false)
    FreezeEntityPosition(object, true)
	lib.showTextUI('[SCROLL] Change Rotation | [E] Confirm')
	while settingObject do
        local hit, hitCoords = RayCastGamePlayCamera(20.0, object)
        if hit ~= 0 then
			local _, groundZ = GetGroundZFor_3dCoord(hitCoords.x, hitCoords.y, hitCoords.z, false)
			SetEntityCoords(object, hitCoords.x, hitCoords.y, groundZ, false, false, false)
			if IsControlJustPressed(0, 241) then -- Scrollup
				heading+=5
				SetEntityHeading(object, heading)
			end
			if IsControlJustPressed(0, 242) then -- Scrolldow
				heading-=5
				SetEntityHeading(object, heading)
			end
            if IsControlJustPressed(0, 38) then
				settingObject = false
				break
            end
        end
		Wait(0)
	end
	lib.hideTextUI()
    SetEntityCollision(object, true, true)
    SetEntityAlpha(object, 255)
    FreezeEntityPosition(object, true)
    PlaceObjectOnGroundProperly(object)
    return object
end

function DoObjectSettingThing2(model)
	local settingObject = true
	local heading = GetEntityHeading(cache.ped) - 180.0
	lib.requestModel(model)
	local offset = GetOffsetFromEntityInWorldCoords(cache.ped, 0.0, 1.5, 0.0)
	local object = CreateObjectNoOffset(model, offset.x, offset.y, offset.z, true, true, false)
    SetEntityHeading(object, 0)
    SetEntityAlpha(object, 150)
    SetEntityCollision(object, false, false)
    FreezeEntityPosition(object, true)
	lib.showTextUI('[SCROLL] Change Rotation | [E] Confirm')
	while settingObject do
        local hit, hitCoords = RayCastGamePlayCamera(20.0, object)
        if hit ~= 0 then
			SetEntityCoords(object, hitCoords.x, hitCoords.y, hitCoords.z, false, false, false)
			local offset = GetOffsetFromEntityInWorldCoords(object, 0.0, 0.5, 0.0)
			SetEntityCoords(object, offset.x, offset.y, offset.z, false, false, false)
			if IsControlJustPressed(0, 241) then -- Scrollup
				heading+=1
				SetEntityHeading(object, heading)
			end
			if IsControlJustPressed(0, 242) then -- Scrolldow
				heading-=1
				SetEntityHeading(object, heading)
			end
            if IsControlJustPressed(0, 38) then
				settingObject = false
				break
            end
        end
		Wait(0)
	end
	lib.hideTextUI()
    SetEntityCollision(object, true, true)
    SetEntityAlpha(object, 255)
    FreezeEntityPosition(object, true)
    return object
end


function RotationToDirection(rotation)
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestSweptSphere(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, 0.2, 339, PlayerPedId(), 4))
	return b, c, e
end

BoardModelToTexture = {
	[`bzzz_chalkboards_1a`] = {texture = "bzzz_chalkboards_1", dict = "board_a"},
	[`bzzz_chalkboards_1b`] = {texture = "bzzz_chalkboards_1", dict = "board_b"},
	[`bzzz_chalkboards_1c`] = {texture = "bzzz_chalkboards_1", dict = "board_c"},
	[`bzzz_chalkboards_1d`] = {texture = "bzzz_chalkboards_1", dict = "board_d"},
	[`bzzz_chalkboards_1e`] = {texture = "bzzz_chalkboards_1", dict = "board_e"},
	[`bzzz_chalkboards_2f`] = {texture = "bzzz_chalkboards_2", dict = "board_f"},
	[`bzzz_chalkboards_2g`] = {texture = "bzzz_chalkboards_2", dict = "board_g"},
	[`bzzz_chalkboards_2h`] = {texture = "bzzz_chalkboards_2", dict = "board_h"},
	[`bzzz_chalkboards_2i`] = {texture = "bzzz_chalkboards_2", dict = "board_i"},
	[`bzzz_chalkboards_2j`] = {texture = "bzzz_chalkboards_2", dict = "board_j"},
	[`bzzz_chalkboards_3k`] = {texture = "bzzz_chalkboards_3", dict = "board_k"},
	[`bzzz_chalkboards_3l`] = {texture = "bzzz_chalkboards_3", dict = "board_l"},
	[`bzzz_chalkboards_3m`] = {texture = "bzzz_chalkboards_3", dict = "board_m"},
	[`bzzz_chalkboards_3n`] = {texture = "bzzz_chalkboards_3", dict = "board_n"},
	[`bzzz_chalkboards_3o`] = {texture = "bzzz_chalkboards_3", dict = "board_o"},
	[`bzzz_chalkboards_4p`] = {texture = "bzzz_chalkboards_4", dict = "board_p"},
	[`bzzz_chalkboards_4q`] = {texture = "bzzz_chalkboards_4", dict = "board_q"},
	[`bzzz_chalkboards_4r`] = {texture = "bzzz_chalkboards_4", dict = "board_r"},
	[`bzzz_chalkboards_4s`] = {texture = "bzzz_chalkboards_4", dict = "board_s"},
	[`bzzz_chalkboards_4t`] = {texture = "bzzz_chalkboards_4", dict = "board_t"},
}

BoardModelToSize = {
	[`bzzz_chalkboards_1a`] = {width = 256, height = 512},
	[`bzzz_chalkboards_1b`] = {width = 256, height = 512},
	[`bzzz_chalkboards_1c`] = {width = 256, height = 512},
	[`bzzz_chalkboards_1d`] = {width = 256, height = 512},
	[`bzzz_chalkboards_1e`] = {width = 256, height = 512},
	[`bzzz_chalkboards_2f`] = {width = 512, height = 256},
	[`bzzz_chalkboards_2g`] = {width = 512, height = 256},
	[`bzzz_chalkboards_2h`] = {width = 512, height = 256},
	[`bzzz_chalkboards_2i`] = {width = 512, height = 256},
	[`bzzz_chalkboards_2j`] = {width = 512, height = 256},
	[`bzzz_chalkboards_3k`] = {width = 256, height = 256},
	[`bzzz_chalkboards_3l`] = {width = 256, height = 256},
	[`bzzz_chalkboards_3m`] = {width = 256, height = 256},
	[`bzzz_chalkboards_3n`] = {width = 256, height = 256},
	[`bzzz_chalkboards_3o`] = {width = 256, height = 256},
	[`bzzz_chalkboards_4p`] = {width = 256, height = 512},
	[`bzzz_chalkboards_4q`] = {width = 256, height = 512},
	[`bzzz_chalkboards_4r`] = {width = 256, height = 512},
	[`bzzz_chalkboards_4s`] = {width = 256, height = 512},
	[`bzzz_chalkboards_4t`] = {width = 256, height = 512},
}