local QBCore = exports['qb-core']:GetCoreObject()
BoardsCreated = {}

QBCore.Functions.CreateUseableItem("chalkboard1", function(source, item)
    local src = source
    exports.ox_inventory:RemoveItem(src, "chalkboard1", 1)
    TriggerClientEvent('chalkboards:client:setChalkboard1', src)
end)

QBCore.Functions.CreateUseableItem("chalkboard2", function(source, item)
    local src = source
    exports.ox_inventory:RemoveItem(src, "chalkboard2", 1)
    TriggerClientEvent('chalkboards:client:setChalkboard2', src)
end)

QBCore.Functions.CreateUseableItem("chalkboard3", function(source, item)
    local src = source
    exports.ox_inventory:RemoveItem(src, "chalkboard3", 1)
    TriggerClientEvent('chalkboards:client:setChalkboard3', src)
end)

QBCore.Functions.CreateUseableItem("chalkboard4", function(source, item)
    local src = source
    exports.ox_inventory:RemoveItem(src, "chalkboard4", 1)
    TriggerClientEvent('chalkboards:client:setChalkboard4', src)
end)

lib.callback.register("chalkboards:getBoards", function()
    return BoardsCreated
end)

RegisterNetEvent("chalkboards:server:deleteChalkboard", function(typeA, id)
    local src = source
    exports.ox_inventory:AddItem(src, typeA, 1)
    BoardsCreated[id] = nil
    TriggerClientEvent('chalkboards:client:deleteChalkboard', -1, id)
end)

RegisterNetEvent("chalkboards:server:createNewBoardZone", function(data)
    BoardsCreated[data.chalkboardid] = data
    TriggerClientEvent("chalkboards:client:createNewBoardZone", -1, data)
end)

RegisterNetEvent("chalkboards:server:updateChalkboardContent", function(id, content)
    BoardsCreated[id].content = content
    TriggerClientEvent("chalkboards:client:updateChalkboardContent", -1, id, content)
end)

RegisterNetEvent("chalkboards:deleteEntity", function(netID)
    local object = NetworkGetEntityFromNetworkId(netID)
    if object == 0 or not DoesEntityExist(object) then return end
    DeleteEntity(object)
end)
