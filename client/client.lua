RegisterNetEvent('tiz:openMenuBarygos')
AddEventHandler('tiz:openMenuBarygos', function()
    local options = {}

    for item, data in pairs(Config.Prices) do
        local quantity = data.quantity or 0
        local rewardAmount = data.price or 0 
        local reward = data.reward or "unknown"
        local rewardLabel = data.rewardLabel or "Unknown Reward" 
        local label = data.label or "Unknown item"
        local icon = data.icon or "default-icon"

        if quantity > 0 and rewardAmount > 0 and reward and label and icon and rewardLabel then
            table.insert(options, {
                title = label,
                description = string.format('%s %d\n%s %d %s', Config.Language.requiredAmount, quantity, Config.Language.youReceive, rewardAmount, rewardLabel),
                icon = icon,
                onSelect = function()
                    local itemCount = lib.callback.await('tiz:getItemCount', false, item)

                    if itemCount and itemCount >= quantity then
                        local maxSellable = math.floor(itemCount / quantity)

                        local slider = lib.inputDialog(Config.Language.inputTitle, {
                            {
                                type = 'slider', 
                                label = Config.Language.quantity, 
                                description = Config.Language.howMuchToSell, 
                                min = 1, 
                                max = maxSellable, 
                                step = 1, 
                                default = 1,
                                required = true,
                                icon = 'hashtag'
                            }
                        })
                        if not slider then return end
                        local sell = lib.callback.await('tiz:barygaSell', false, item, slider[1])
                        if sell then
                            qtm.Notification(nil, Config.Language.notifyTitle, 'success', Config.Language.purchaseSuccess)
                        else
                            qtm.Notification(nil, Config.Language.notifyTitle, 'error', Config.Language.notEnough)
                        end
                    else
                        qtm.Notification(nil, Config.Language.notifyTitle, 'error', Config.Language.notEnough)
                    end
                end,
            })
        else
            print(string.format("Config error for item '%s': Missing or invalid data", item))
        end
    end

    lib.registerContext({
        id = 'Baryga_Menu',
        title = Config.Language.contextTitle,
        options = options
    })

    lib.showContext('Baryga_Menu')
end)