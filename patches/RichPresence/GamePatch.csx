/*
Discord Rich Presence using NekoPresence extension

https://github.com/nkrapivin/NekoPresence
*/

#load "../../patcher/lib/_Utils.csx"
#load "../../patcher/lib/_Patch.csx"
#load "../../patcher/lib/_GameObject.csx"
#load "../../patcher/lib/_UFO50.csx"
#load "_Extension.csx"

using System.Threading.Tasks;
using System.IO;

var ufo50Version = GetUFO50Version(Data);
var scriptDir = Path.GetDirectoryName(GetCurrentScript());
var dataDir = Path.GetDirectoryName(FilePath);
var codeDir = Path.Join(scriptDir, "code");
var extDllName = "NekoPresence_x64.dll";

await ApplyCompatibleCodePatch(ufo50Version, scriptDir, new[] {
    new PatchVersionRange("1.3.1", "1.4.2")
}, true);

var npExtension = Data.Extensions.ByName("Steamworks");
UndertaleExtensionFile npFile = null;

uint lastExtFuncId = 0;
foreach(var file in npExtension.Files) {
    if(file.Filename.Content == extDllName) {
        npFile = file;
    } else {
        foreach(var func in file.Functions) {
            if(func.ID > lastExtFuncId) {
                lastExtFuncId = func.ID;
            }
        }
    }
}

if(npFile == null) {
    npFile = new UndertaleExtensionFile() {
        Filename = Data.Strings.MakeString(extDllName)
    };
    npExtension.Files.Add(npFile);
}

npFile.Functions.Clear();
_Patch_NekoPresence_DefineFunction(Data, npFile, lastExtFuncId);

var obj = DefineGameObject(Data, "obj_richpresence");
obj.Visible = true;
obj.Persistent = true;
DefineRoomGameObject(Data, 0, obj);

await ImportCodeDir(codeDir, true);
File.Copy(Path.Combine(scriptDir, "res", extDllName), Path.Combine(dataDir, extDllName), true);
