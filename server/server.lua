local ox_inventory = exports.ox_inventory

lib.callback.register('tiz:barygaSell', function(source, item, count)
    local itemConfig = Config.Prices[item]

    if itemConfig and ox_inventory:GetItemCount(source, item) >= count * itemConfig.quantity then
        ox_inventory:RemoveItem(source, item, count * itemConfig.quantity)
        ox_inventory:AddItem(source, itemConfig.reward, itemConfig.price * count)
        return true
    else
        return false
    end
end)