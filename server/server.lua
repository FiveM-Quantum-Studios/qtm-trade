lib.callback.register('tiz:getItemCount', function(source, item)
    return qtm.Inventory.GetItemCount(source, item)
end)

lib.callback.register('tiz:barygaSell', function(source, item, count)
    local itemConfig = Config.Prices[item]

    if itemConfig and qtm.Inventory.GetItemCount(source, item) >= count * itemConfig.quantity then
        qtm.Inventory.RemoveItem(source, item, count * itemConfig.quantity)
        qtm.Inventory.AddItem(source, itemConfig.reward, itemConfig.price * count)
        return true
    else
        return false
    end
end)

qtm.Server.VersionChecker('qtm-trade')