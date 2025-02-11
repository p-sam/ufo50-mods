/*
Allow up to 16 gamepads using gmdinput extension

https://github.com/p-sam/gmdinput
*/

#load "../../patcher/lib/_Utils.csx"
#load "../../patcher/lib/_Patch.csx"
#load "../../patcher/lib/_GameObject.csx"
#load "../../patcher/lib/_Extension.csx"
#load "../../patcher/lib/_UFO50.csx"
#load "_Extension.csx"

using System.Threading.Tasks;
using System.IO;

var scriptDir = Path.GetDirectoryName(GetCurrentScript());
var dataDir = GetCurrentUFO50Dir();
var codeDir = Path.Join(scriptDir, "code");
var extDllName = "gmdinput.dll";

var extension = Data.Extensions.ByName("Steamworks");

uint lastExtFuncId = 0;
foreach(var file in extension.Files) {
    foreach(var func in file.Functions) {
        if(func.ID > lastExtFuncId) {
            lastExtFuncId = func.ID;
        }
    }
}

var extFile = DefineExtensionFile(Data, extension, extDllName);
extFile.Functions.Clear();
lastExtFuncId = _Patch_GMDInput_DLL_Define(Data, extFile, lastExtFuncId);

var obj = DefineGameObject(Data, "obj_gmdinput");
obj.Visible = true;
obj.Persistent = true;
DefineRoomGameObject(Data, 0, obj);

await ImportCodeDir(codeDir, true);
File.Copy(Path.Combine(scriptDir, "res", extDllName), Path.Combine(dataDir, extDllName), true);
