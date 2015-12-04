--##############################  Main Code Begin  ##############################--
local composer = require( "composer" )

local scene = composer.newScene()

-- "scene:create()"
function scene:create( event )
	local sceneGroup = self.view
	
	local W = __appContentWidth__
	local H = __appContentHeight__ - 57
	
	local bg = display.newRect(sceneGroup, 0, 0, __appContentWidth__, __appContentHeight__)
	bg:setFillColor(0.6, 0.6, 0.6, 1)
	
	-- 여기서부터 시작
	local txt = display.newText(sceneGroup, "2", 0, 0, 0, 0, native.systemFontBold, 40)
	txt.x, txt.y = (W * 0.5) - (txt.width * 0.5), (H * 0.5) - (txt.height * 0.5)
end

-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )

-- -------------------------------------------------------------------------------

return scene
--##############################  Main Code End  ##############################--