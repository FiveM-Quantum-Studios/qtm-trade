Config = {}

Config.Ped = vec3(2489.8376, 4959.6323, 44.7936)
Config.Heading = 49.0624
Config.PedModel = `a_m_o_salton_01`
----------------------------------------------------------------------------------
Config.Prices = {
    water = { 
        price = 1, -- Reward Amount
        label = 'Water', 
        icon = 'book-skull', -- https://fontawesome.com/icons
        reward = 'black_money', 
        rewardLabel = 'Black Money',
        quantity = 5 -- How much of 'water' does the player need to trade.
    },
    -- Add other items here as needed
}
----------------------------------------------------------------------------------
Config.Language = {
    requiredAmount = 'Required Amount:',
    youReceive = 'You receive:',
    inputTitle = 'Trader',
    quantity = 'Quantity',
    howMuchToSell = 'How much would you like to receive?',
    notifyTitle = 'Trader',
    purchaseSuccess = 'Your trade has been succesfull',
    notEnough = 'You do not have enough',
    contextTitle = 'Trader',
    targetLabel = 'Trader'
}