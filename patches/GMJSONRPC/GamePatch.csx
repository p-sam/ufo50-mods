/*
Starts a websocket server on port 64325 allowing RPC via JSON payloads
*/

#load "../../patcher/lib/_Utils.csx"
#load "../../patcher/lib/_GameObject.csx"
#load "../../patcher/lib/_Code.csx"
#load "_Decomp.csx"

using System.Threading.Tasks;
using System.Collections.Generic;

FixUpDecomp_NetworkFunctions(Data);
var obj = DefineGameObject(Data, "obj_gmjsonrpc");
obj.Visible = true;
obj.Persistent = true;
DefineRoomGameObject(Data, 0, obj);

var scriptDir = Path.GetDirectoryName(GetCurrentScript());
var codeDir = Path.Join(scriptDir, "code");
await ImportCodeDir(codeDir, true);
