/*
Extends the max number of players and inputs to 6

Based on the "Multiplayer+" patch by greenhead352 on Discord
https://discord.com/channels/525973026429206530/1297222360969252994
*/

#load "../../patcher/lib/_Utils.csx"
#load "../../patcher/lib/_Patch.csx"
#load "../../patcher/lib/_Graphics.csx"
#load "../../patcher/lib/_UFO50.csx"

using System.Threading.Tasks;

var ufo50Version = GetUFO50Version(Data);
var scriptDir = Path.GetDirectoryName(GetCurrentScript());

await ApplyCompatibleCodePatch(ufo50Version, scriptDir, new[] {
    new PatchVersionRange("1.3.1", "1.4.2")
}, true);

ImportGraphics(Path.GetDirectoryName(GetCurrentScript()), true);

var sMenuP1P2 = Data.Sprites.ByName("sMenuP1P2");
sMenuP1P2.OriginX = 64;
