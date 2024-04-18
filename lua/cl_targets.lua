exports.ox_target:addModel({`bzzz_chalkboards_1a`, `bzzz_chalkboards_1b`, `bzzz_chalkboards_1c`, `bzzz_chalkboards_1d`, `bzzz_chalkboards_1e`}, {
    {
        icon = 'fa-solid fa-pen',
        label = "Write Something",
        distance = 4.0,
        event = 'chalkboards:client:setChalkboardContent',
    },
    {
        icon = 'fa-solid fa-trash-alt',
        label = "Delete Chalkboard",
        event = 'chalkboards:client:deleteChalkboard',
        distance = 4.0,
        onSelect = function(data)
            local state = Entity(data.entity).state
            if state then
                if state.owner == PlayerData.citizenid then
                    TriggerServerEvent("chalkboards:deleteEntity", NetworkGetNetworkIdFromEntity(data.entity))
                    TriggerServerEvent("chalkboards:server:deleteChalkboard", "chalkboard1", state.chalkboardid)
                else
                    lib.notify({
                        type = 'error',
                        title = 'You do not own this chalkboard.'
                    })
                end
            end
        end
    }
})

exports.ox_target:addModel({`bzzz_chalkboards_2f`, `bzzz_chalkboards_2g`, `bzzz_chalkboards_2h`, `bzzz_chalkboards_2i`, `bzzz_chalkboards_2j`}, {
    {
        icon = 'fa-solid fa-play',
        label = "Write Something",
        event = 'chalkboards:client:setChalkboardContent',
        distance = 4.0,
    },
    {
        icon = 'fa-solid fa-trash-alt',
        label = "Delete Chalkboard",
        distance = 4.0,
        onSelect = function(data)
            local state = Entity(data.entity).state
            if state then
                if state.owner == PlayerData.citizenid then
                    TriggerServerEvent("chalkboards:deleteEntity", NetworkGetNetworkIdFromEntity(data.entity))
                    TriggerServerEvent("chalkboards:server:deleteChalkboard", "chalkboard2", state.chalkboardid)
                else
                    lib.notify({
                        type = 'error',
                        title = 'You do not own this chalkboard.'
                    })
                end
            end
        end
    }
})

exports.ox_target:addModel({`bzzz_chalkboards_3k`, `bzzz_chalkboards_3l`, `bzzz_chalkboards_3m`, `bzzz_chalkboards_3n`, `bzzz_chalkboards_3o`}, {
    {
        icon = 'fa-solid fa-play',
        label = "Write Something",
        event = 'chalkboards:client:setChalkboardContent',
        distance = 4.0,
    },
    {
        icon = 'fa-solid fa-trash-alt',
        label = "Delete Chalkboard",
        distance = 4.0,
        onSelect = function(data)
            local state = Entity(data.entity).state
            if state then
                if state.owner == PlayerData.citizenid then
                    TriggerServerEvent("chalkboards:deleteEntity", NetworkGetNetworkIdFromEntity(data.entity))
                    TriggerServerEvent("chalkboards:server:deleteChalkboard", "chalkboard3", state.chalkboardid)
                else
                    lib.notify({
                        type = 'error',
                        title = 'You do not own this chalkboard.'
                    })
                end
            end
        end
    }
})

exports.ox_target:addModel({`bzzz_chalkboards_4p`, `bzzz_chalkboards_4q`, `bzzz_chalkboards_4r`, `bzzz_chalkboards_4s`, `bzzz_chalkboards_4t`}, {
    {
        icon = 'fa-solid fa-play',
        label = "Write Something",
        event = 'chalkboards:client:setChalkboardContent',
        distance = 4.0,
    },
    {
        icon = 'fa-solid fa-trash-alt',
        label = "Delete Chalkboard",
        distance = 4.0,
        onSelect = function(data)
            local state = Entity(data.entity).state
            if state then
                if state.owner == PlayerData.citizenid then
                    TriggerServerEvent("chalkboards:deleteEntity", NetworkGetNetworkIdFromEntity(data.entity))
                    TriggerServerEvent("chalkboards:server:deleteChalkboard", "chalkboard4", state.chalkboardid)
                else
                    lib.notify({
                        type = 'error',
                        title = 'You do not own this chalkboard.'
                    })
                end
            end
        end
    }
})