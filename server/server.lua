lib.callback.register('tiz:barygaSell', function(source, item, count)
    local itemConfig = Config.Prices[item]

    if itemConfig and GetItemCount(source, item) >= count * itemConfig.quantity then
        RemoveItem(source, item, count * itemConfig.quantity)
        AddItem(source, itemConfig.reward, itemConfig.price * count)
        return true
    else
        return false
    end
end)