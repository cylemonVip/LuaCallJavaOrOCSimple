--[[
    Created by YCheng on 21/10/16.
    Copyright 2016 LemonStudio. All rights reserved.
    desc:跨语言调用工具类（Lua->Java, Lua->Object C）
]]

local CLUtil = {}

--lua call java-static-method
--@param = {class = "", method = "", args = {}, sigs = ""}
--@returnFunc, callback
function CLUtil.luajCallStaticMethod(param, returnFunc)
    if param == nil or type(param.class) ~= 'string'  then
        return
    end

    local ok, ret = luaj.callStaticMethod(param.class, param.method, param.args, param.sigs)
    if returnFunc then
        returnFunc(ok, ret)
    end

    if not ok then
        print(string.format("call java-function failure, error:%s", tostring(ret)))
    end
end

--lua call objective-c-static-method
--@param = {class = "", method = "", args = {}, sigs = ""}
--@returnFunc, callback
function CLUtil.luaocCallStaticMethod(param, returnFunc)
    if param == nil or type(param.class) ~= 'string' then
        return
    end

    local ok, ret = luaoc.callStaticMethod(param.class, param.method, param.args, param.sigs)
    if returnFunc then
        returnFunc(ok, ret)
    end
    

    if not ok then
        print(string.format("call objective-c-function failure, error:%s", tostring(ret)))
    end
end

return CLUtil