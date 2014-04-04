require "card"
function print_lua_table (lua_table, indent)
	indent = indent or 0
	for k, v in pairs(lua_table) do
		if type(k) == "string" then
			k = string.format("%q", k)
		end
		local szSuffix = ""
		if type(v) == "table" then
			szSuffix = "{"
		end
		local szPrefix = string.rep("    ", indent)
		formatting = szPrefix.."["..k.."]".." = "..szSuffix
		if type(v) == "table" then
			print(formatting)
			print_lua_table(v, indent + 1)
			print(szPrefix.."},")
		else
			local szValue = ""
			if type(v) == "string" then
				szValue = string.format("%q", v)
			else
				szValue = tostring(v)
			end
			print(formatting..szValue..",")
		end
	end
end

function ShuffleArray_Fisher_Yates(cards, num)
    local i = num
    local j
    local temp

    if i == 0 then return nil end
    math.randomseed(os.time())
    while i > 0 do
        j = math.floor(math.random() * 100000000) % i + 1
        temp = cards[i]
        cards[i] = cards[j]
        cards[j] = temp
        i = i-1
    end
    return cards
end

function GenerateCards(num)
    if num ~= nil and num == 52 then
        num = 52 
    else
        num = 54
    end
    --先生成52张牌
    local cards = {}
    for i = 1,4 do
        for j = 1, 13 do
            local card = Card.new(i, j)
            cards[card:cardValue()] = card:description()
        end
    end
    if num == 54 then
        local card = Card.new(CardTypeBlackJoker, CardTypeJoker)
        cards[card:cardValue()] = card:description()
        local card = Card.new(CardTypeRedJoker, CardTypeJoker)
        cards[card:cardValue()] = card:description()
    end
    return cards
end

function DealCards(users, cardShoe)
    for i = 1, INIT_CARDS do
        for j = 1, #users do
            users[j].cards[i] = cardShoe:getCard()
        end
    end
end

function GetActiveUser(users)
    local targetID = 0
    for i = 1, #users do
        if users[i].isActive then
            targetID = i
            users[i].isActive = false
            break
        end
    end
    if targetID == 0 then
        --随机找个开始的人
        math.randomseed(os.time())
        local randid = math.floor(math.random() * 100000000) % #users + 1
        targetID = randid
    end

    targetID = targetID % #users + 1
    users[targetID].isActive = true

    return targetID
end

function StartGame(users, cardShoe, cardTable)
    DealCards(users, cardShoe)
    local KeepGame = true
    local test = 10
    local FirstPublicCard = cardShoe:getCard()
    cardTable:addCard(FirstPublicCard)
    print('Pulic:')
    print_lua_table(cardTable.cards)
    while KeepGame do
        local userid = GetActiveUser(users)
        KeepGame = false
    end
end

