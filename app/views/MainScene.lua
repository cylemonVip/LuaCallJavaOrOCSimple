

local MainScene = class("MainScene", cc.load("mvc").ViewBase)

-- MainScene.RESOURCE_FILENAME = "MainScene.csb"

function MainScene:onCreate()

    local callback = function()

    	local str = ""

        if (cc.PLATFORM_OS_IPHONE == TARGET_PLATFORM) 
	        or (cc.PLATFORM_OS_IPAD == TARGET_PLATFORM) 
	        or (cc.PLATFORM_OS_MAC  == TARGET_PLATFORM) then
	        str = "PLATFORM_OS_IPHONE Called Success"

	    elseif cc.PLATFORM_OS_ANDROID == TARGET_PLATFORM then
	    	str = "PLATFORM_OS_ANDROID Called Success"
	    end
        
        local lable = cc.Label:createWithTTF(str, "BRLNSR.TTF", 50)
        lable:setPosition(cc.p(480, 320))
        self:addChild(lable)

    end

    if (cc.PLATFORM_OS_IPHONE == TARGET_PLATFORM)
        or (cc.PLATFORM_OS_IPAD == TARGET_PLATFORM)
        or (cc.PLATFORM_OS_MAC  == TARGET_PLATFORM) then

        local args = { info = "This Statement From luaocCallStaticMethod!"}
    	local param = {class = IOS_NATIVE_CLASS_NAME,  method = "printFromLua", args = args}
        CLUtil.luaocCallStaticMethod(param, callback)

    elseif cc.PLATFORM_OS_ANDROID == TARGET_PLATFORM then
    	
    	local args = {"This Statement From luaocCallStaticMethod!"}
    	local sigs = "(Ljava/lang/String;)V"
    	local param = {class = ANDROID_NATIVE_CLASS_NAME,  method = "printFromLua", args = args, sigs = sigs}
    	CLUtil.luajCallStaticMethod(param, callback)
    end
    
end

return MainScene
