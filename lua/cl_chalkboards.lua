local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        loadData()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    loadData()
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    PlayerData = {}
end)

function loadData()
    PlayerData = QBCore.Functions.GetPlayerData()
    for k,v in pairs(BoardModelToTexture) do
        RemoveReplaceTexture(v.texture, v.dict)
    end
    local boards = lib.callback.await("chalkboards:getBoards", false)
    for k,data in pairs(boards) do
        BoardsCreated[data.chalkboardid] = data
        BoardsCreated[data.chalkboardid].zone = lib.zones.sphere({
            coords = data.coords,
            radius = 25.0,
            onEnter = function(zone)
                DUILoaded = false
                local data = BoardsCreated[zone.chalkboardid]
                if BoardTexturesUsed[data.model] then return end
                BoardTexturesUsed[data.model] = true
                data.duiObj = CreateDui(string.format("https://cfx-nui-%s/web/dist/index.html", GetCurrentResourceName()), BoardModelToSize[data.model].width, BoardModelToSize[data.model].height)
                data.duiHandle = GetDuiHandle(data.duiObj)
                data.txdid = "texture_" .. math.random(1, 100000)
                data.txd = CreateRuntimeTxd(data.txdid)
                data.textureid = "textureid_" .. math.random(1, 100000)
                data.texture = CreateRuntimeTextureFromDuiHandle(data.txd, data.textureid, data.duiHandle)
                data.dict = BoardModelToTexture[data.model].dict
                data.texture = BoardModelToTexture[data.model].texture
                RemoveReplaceTexture(BoardModelToTexture[data.model].texture, BoardModelToTexture[data.model].dict)
                AddReplaceTexture(BoardModelToTexture[data.model].texture, BoardModelToTexture[data.model].dict, data.txdid, data.textureid)
                while not DUILoaded do Wait(0) end
                SendDuiMessage(data.duiObj, json.encode({
                    action = "chalkboard",
                    content = data.content,
                    picTemplate = data.picTemplate,
                }))
            end,
            onExit = function(zone)
                local data = BoardsCreated[zone.chalkboardid]
                if data.duiObj then
                    DestroyDui(data.duiObj)
                    data.duiObj = nil
                    BoardTexturesUsed[data.model] = false
                end
            end,
            chalkboardid = data.chalkboardid
        })
    end
end

RegisterNetEvent("chalkboards:client:setChalkboard1", function()
    local input = lib.inputDialog("Choose Chalkboard Template", {
        { type = "select", label = "Choose a template", description = "Board textures are duplicated based on template. Choose a different template if you want to display more than one board data", options = {
            { label = "Template 1", value = "bzzz_chalkboards_1a" },
            { label = "Template 2", value = "bzzz_chalkboards_1b" },
            { label = "Template 3", value = "bzzz_chalkboards_1c" },
            { label = "Template 4", value = "bzzz_chalkboards_1d" },
            { label = "Template 5", value = "bzzz_chalkboards_1e" },
        }}
    })
    if not input then return end
    local model = GetHashKey(input[1])
    local object = DoObjectSettingThing(model)
    Entity(object).state:set('owner', PlayerData.citizenid, true)
    local chalkboardid = "chalkboard_" .. math.random(1, 100000)
    Entity(object).state:set('chalkboardid', chalkboardid, true)
    TriggerServerEvent("chalkboards:server:createNewBoardZone", {
        model = model,
        chalkboardid = chalkboardid,
        coords = GetEntityCoords(object),
        picTemplate = 1,
        content = ""
    })
end)

RegisterNetEvent("chalkboards:client:setChalkboard2", function()
    local input = lib.inputDialog("Choose Chalkboard Template", {
        { type = "select", label = "Choose a template", description = "Board textures are duplicated based on template. Choose a different template if you want to display more than one board data", options = {
            { label = "Template 1", value = "bzzz_chalkboards_2f" },
            { label = "Template 2", value = "bzzz_chalkboards_2g" },
            { label = "Template 3", value = "bzzz_chalkboards_2h" },
            { label = "Template 4", value = "bzzz_chalkboards_2i" },
            { label = "Template 5", value = "bzzz_chalkboards_2j" },
        }}
    })
    if not input then return end
    local model = GetHashKey(input[1])
    local object = DoObjectSettingThing2(model)
    Entity(object).state:set('owner', PlayerData.citizenid, true)
    local chalkboardid = "chalkboard_" .. math.random(1, 100000)
    Entity(object).state:set('chalkboardid', chalkboardid, true)
    TriggerServerEvent("chalkboards:server:createNewBoardZone", {
        model = model,
        chalkboardid = chalkboardid,
        coords = GetEntityCoords(object),
        picTemplate = 2,
        content = ""
    })
end)

RegisterNetEvent("chalkboards:client:setChalkboard3", function()
    local input = lib.inputDialog("Choose Chalkboard Template", {
        { type = "select", label = "Choose a template", description = "Board textures are duplicated based on template. Choose a different template if you want to display more than one board data", options = {
            { label = "Template 1", value = "bzzz_chalkboards_3k" },
            { label = "Template 2", value = "bzzz_chalkboards_3l" },
            { label = "Template 3", value = "bzzz_chalkboards_3m" },
            { label = "Template 4", value = "bzzz_chalkboards_3n" },
            { label = "Template 5", value = "bzzz_chalkboards_3o" },
        }}
    })
    if not input then return end
    local model = GetHashKey(input[1])
    local object = DoObjectSettingThing2(model)
    Entity(object).state:set('owner', PlayerData.citizenid, true)
    local chalkboardid = "chalkboard_" .. math.random(1, 100000)
    Entity(object).state:set('chalkboardid', chalkboardid, true)
    TriggerServerEvent("chalkboards:server:createNewBoardZone", {
        model = model,
        chalkboardid = chalkboardid,
        coords = GetEntityCoords(object),
        picTemplate = 3,
        content = ""
    })
end)

RegisterNetEvent("chalkboards:client:setChalkboard4", function()
    local input = lib.inputDialog("Choose Chalkboard Template", {
        { type = "select", label = "Choose a template", description = "Board textures are duplicated based on template. Choose a different template if you want to display more than one board data", options = {
            { label = "Template 1", value = "bzzz_chalkboards_4p" },
            { label = "Template 2", value = "bzzz_chalkboards_4q" },
            { label = "Template 3", value = "bzzz_chalkboards_4r" },
            { label = "Template 4", value = "bzzz_chalkboards_4s" },
            { label = "Template 5", value = "bzzz_chalkboards_4t" },
        }}
    })
    if not input then return end
    local model = GetHashKey(input[1])
    local object = DoObjectSettingThing2(model)
    Entity(object).state:set('owner', PlayerData.citizenid, true)
    local chalkboardid = "chalkboard_" .. math.random(1, 100000)
    Entity(object).state:set('chalkboardid', chalkboardid, true)
    TriggerServerEvent("chalkboards:server:createNewBoardZone", {
        model = model,
        chalkboardid = chalkboardid,
        coords = GetEntityCoords(object),
        picTemplate = 4,
        content = ""
    })
end)

RegisterNetEvent("chalkboards:client:setChalkboardContent", function(data)
    local state = Entity(data.entity).state
    if state then
        if state.owner == PlayerData.citizenid then
            SendNUIMessage({
                action = "editChalkboard",
                content = BoardsCreated[state.chalkboardid]?.content or "Text here..."
            })
            SetNuiFocus(true, true)
            p = promise.new()
            local content = Citizen.Await(p)
            SetNuiFocus(false, false)
            TriggerServerEvent("chalkboards:server:updateChalkboardContent", state.chalkboardid, content)
        else
            lib.notify({
                type = 'error',
                title = 'You do not own this chalkboard.'
            })
        end
    end
end)

RegisterNUICallback("savechalkboard", function(data, cb)
    p:resolve(data.content)
    cb('ok')
end)

RegisterNuiCallback('loaded', function(_, cb)
    DUILoaded = true
    cb('ok')
end)

RegisterNetEvent("chalkboards:client:createNewBoardZone", function(data)
    BoardsCreated[data.chalkboardid] = data
    BoardsCreated[data.chalkboardid].zone = lib.zones.sphere({
        coords = data.coords,
        radius = 25.0,
        onEnter = function(zone)
            DUILoaded = false
            local data = BoardsCreated[zone.chalkboardid]
            if BoardTexturesUsed[data.model] then return end
            BoardTexturesUsed[data.model] = true
            data.duiObj = CreateDui(string.format("https://cfx-nui-%s/web/dist/index.html", GetCurrentResourceName()), BoardModelToSize[data.model].width, BoardModelToSize[data.model].height)
            data.duiHandle = GetDuiHandle(data.duiObj)
            data.txdid = "texture_" .. math.random(1, 100000)
            data.txd = CreateRuntimeTxd(data.txdid)
            data.textureid = "textureid_" .. math.random(1, 100000)
            data.texture = CreateRuntimeTextureFromDuiHandle(data.txd, data.textureid, data.duiHandle)
            data.dict = BoardModelToTexture[data.model].dict
            data.texture = BoardModelToTexture[data.model].texture
            RemoveReplaceTexture(BoardModelToTexture[data.model].texture, BoardModelToTexture[data.model].dict)
            AddReplaceTexture(BoardModelToTexture[data.model].texture, BoardModelToTexture[data.model].dict, data.txdid, data.textureid)
            while not DUILoaded do Wait(0) end
            SendDuiMessage(data.duiObj, json.encode({
                action = "chalkboard",
                content = data.content,
                picTemplate = data.picTemplate,
            }))
        end,
        onExit = function(zone)
            local data = BoardsCreated[zone.chalkboardid]
            if data.duiObj then
                DestroyDui(data.duiObj)
                data.duiObj = nil
                BoardTexturesUsed[data.model] = false
            end
        end,
        chalkboardid = data.chalkboardid
    })
end)

RegisterNetEvent("chalkboards:client:deleteChalkboard", function(id)
    local data = BoardsCreated[id]
    if data then
        if data.zone then
            data.zone:remove()
        end
        if data.duiObj then
            DestroyDui(data.duiObj)
            data.duiObj = nil
        end
        BoardTexturesUsed[data.model] = false
        BoardsCreated[id] = nil
    end
end)

RegisterNetEvent("chalkboards:client:updateChalkboardContent", function(id, content)
    local data = BoardsCreated[id]
    if data then
        data.content = content
        if data.duiObj then
            SendDuiMessage(data.duiObj, json.encode({
                action = "chalkboard",
                content = content,
                picTemplate = data.picTemplate,
            }))
        end
    end
end)
