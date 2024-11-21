/*
Skips cracktro and "play forever" screen

Imported from sdlwdr on Discord
https://discord.com/channels/525973026429206530/1297649115215298680
*/

#load "../../patcher/lib/_Utils.csx"
#load "../../patcher/lib/_Patch.csx"
#load "../../patcher/lib/_UFO50.csx"

using System.Threading.Tasks;

var ufo50Version = GetUFO50Version(Data);
var scriptDir = Path.GetDirectoryName(GetCurrentScript());

await ApplyCompatibleCodePatch(ufo50Version, scriptDir, new[] {
    new PatchVersionRange("1.3.1", "1.4.2")
}, true);
