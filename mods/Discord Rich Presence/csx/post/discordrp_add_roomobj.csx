var name = "obj_mod_discordrp";
var room = Data.GeneralInfo.RoomOrder[0].Resource;

var objDef = Data.GameObjects.ByName(name);

if (objDef == null)
{
    objDef = new UndertaleGameObject()
    {
        Name = Data.Strings.MakeString(name)
    };
    Data.GameObjects.Add(objDef);
}

UndertaleRoom.GameObject obj = null;

foreach(var o in room.GameObjects) {
    if(o.ObjectDefinition == objDef) {
        obj = o;
        break;
    }
}

if (obj == null)
{
    obj = new UndertaleRoom.GameObject()
    {
        InstanceID = Data.GeneralInfo.LastObj++,
        ObjectDefinition = objDef,
    };
    room.GameObjects.Add(obj);
}
