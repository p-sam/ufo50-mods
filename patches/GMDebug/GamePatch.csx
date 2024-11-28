/*
Reimplements RPC methods from GMDebug server (https://marketplace.gamemaker.io/assets/7998/gmdebug)
Navigate to https://debug.gmcloud.org/ to use
*/

#load "../../patcher/lib/_Utils.csx"
#load "../../patcher/lib/_GameObject.csx"
#load "../../patcher/lib/_Code.csx"

using System.Threading.Tasks;

var obj = DefineGameObject(Data, "obj_gmdebug");
DefineRoomGameObject(Data, 0, obj);

var scriptDir = Path.GetDirectoryName(GetCurrentScript());
var codeDir = Path.Join(scriptDir, "code");
await ImportCodeDir(codeDir, true);
