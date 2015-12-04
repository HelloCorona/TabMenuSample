local widget = require("widget")

local Class = {}

-- 탭 메뉴 생성
Class.create = function (imgs)
	local g = display.newGroup()
	g.selectedMenu = nil
	
	local menuList = {}
	
	-- 메뉴 생성
	local menuWidth = __appContentWidth__ / #imgs
	for i=1, #imgs do
		local menu = display.newImage(g, imgs[i], 0, 0)
		menu.x, menu.width = (i - 1) * menuWidth, menuWidth
		menu.index = i
		
		-- 메뉴 탭(Tap)
		local function on_MenuSelect(e)
			g.select(e.target.index)
		end
		menu:addEventListener("tap", on_MenuSelect)
		
		menuList[#menuList + 1] = menu
		g:insert(menu)
	end
	
	--===============================
	--
	-- Public Methods
	--
	--===============================

	-- 메뉴 선택
	g.select = function (index)
		local target = menuList[index]
		if g.selectedMenu == target then return end

		local oldIndex = nil

		if g.selectedMenu ~= nil then
			oldIndex = g.selectedMenu.index
			g.selectedMenu:setFillColor(1, 1, 1, 1)
		end
		g.selectedMenu = target
		target:setFillColor(1, 1, 1, 0.9)

		g:dispatchEvent({name="selected", oldIndex=oldIndex, newIndex=target.index})
	end
	
	return g
end

return Class
