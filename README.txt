1.此处仅有app文件夹中的代码
2.全局变量的生命放在AppDefine.lua中
3.宏定义放在AppMacors.lua中
4.平台声明判断放在MyApp.lua中
5.方法调用放在MainScene.lua中
6.调用具体方法在CLUtil.lua中


Java调用相关
{
JAVA:
    被调用的方法声明：Java方法声明: Public Static void printFromLua(String info){}
    类名需要全路径:
    cc.exports.ANDROID_NATIVE_CLASS_NAME = "org/cocos2dx/lua/AppActivity"

Lua:
    参数:
    local args = {"This Statement From luaocCallStaticMethod!"}
    参数类型:
    local sigs = "(Ljava/lang/String;)V"
    组合:
    local param = {class = ANDROID_NATIVE_CLASS_NAME,  method = "printFromLua", args = args, sigs = sigs}
    调用
    CLUtil.luajCallStaticMethod(param, <自定义回调函数>)
    
    注: 1.参数类型和返回值对应表:
            1.String->Ljava/lang/String; 
            2.float/double->F
            3.int->I
        2.Java必须将参数和参数类型一一对应
}
OC调用相关
{
OC:
    被调用的方法声明：OC方法声明: 
        + (void)printFromLua :(NSDictionary*)dict;
    OC方法实现:
        + (void)printFromLua : (NSDictionary*)dict
        {
            //查找key值对应的value
            NSString *info = [dict objectForKey:@"info"];
        }

Lua:
    参数:
    local args = { info = "This Statement From luaocCallStaticMethod!"}
    组合:
    local param = {class = IOS_NATIVE_CLASS_NAME,  method = "printFromLua", args = args}
    调用:
    CLUtil.luaocCallStaticMethod(param, <自定义回调函数>)

    注: 1.OC调用无需参数类型，但args，必须是key和value对应，以便OC查找
}











