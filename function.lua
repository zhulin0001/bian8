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
        local card = Card.new(CardTypeBlackJoker)
        cards[card:cardValue()] = card:description()
        local card = Card.new(CardTypeRedJoker)
        cards[card:cardValue()] = card:description()
    end
end

local cards = GenerateCards(54)
print_lua_table(cards)
--cards = ShuffleArray_Fisher_Yates(cards, 52)
--print_lua_table(cards)

