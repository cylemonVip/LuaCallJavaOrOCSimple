--执行全局变量的声明
require("app.data.AppDefine")
require("app.data.AppMacors")

local MyApp = class("MyApp", cc.load("mvc").AppBase)

function MyApp:onCreate()
	--随机种子
    math.randomseed(os.time())

    --根据平台,初始化调用变量
    if (cc.PLATFORM_OS_IPHONE == TARGET_PLATFORM) 
        or (cc.PLATFORM_OS_IPAD == TARGET_PLATFORM) 
        or (cc.PLATFORM_OS_MAC  == TARGET_PLATFORM) then
        cc.exports.luaoc = require("cocos.cocos2d.luaoc")
    elseif cc.PLATFORM_OS_ANDROID == TARGET_PLATFORM then
        cc.exports.luaj = require("cocos.cocos2d.luaj")
    end

end

return MyApp
