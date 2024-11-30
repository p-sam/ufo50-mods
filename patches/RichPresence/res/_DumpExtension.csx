using System.Text.Json;

string _ExportUTString(UndertaleString s) {
    return $"Data.Strings.MakeString({_ExportString(s.Content)})";
}
string _ExportString(string s) {
    return $"{JsonSerializer.Serialize(s)}";
}

class CodeDumper(string filePath, string indentSpaces = "    ") : StreamWriter(filePath) {
    public void WriteLine(int indent, string line) {
        for(int i = 0; i < indent; i++) {
            this.Write(indentSpaces);
        }
        this.WriteLine(line);
    }
}

void DumpExtensionFunctions(UndertaleExtensionFile file, string exportedFuncName, string outFilePath) {
    using var outputFile = new StreamWriter(outFilePath);

    outputFile.WriteLine($"void {exportedFuncName}(UndertaleData utdata, UndertaleExtensionFile file, uint funcIdOffset = 0) {{");

    foreach(var func in file.Functions) {
        outputFile.Write($"    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings");
        outputFile.Write($", ++funcIdOffset");
        outputFile.Write($", {func.Kind}");
        outputFile.Write($", {_ExportString(func.Name.Content)}");
        outputFile.Write($", UndertaleExtensionVarType.{func.RetType}");
        outputFile.Write($", {_ExportString(func.ExtName.Content)}");
        foreach(var arg in func.Arguments) {
            outputFile.Write($", UndertaleExtensionVarType.{arg.Type}");
        }
        outputFile.WriteLine(");");
    }

    outputFile.WriteLine("");
    outputFile.WriteLine($"    file.CleanupScript = {_ExportUTString(file.CleanupScript)};");
    outputFile.WriteLine($"    file.InitScript = {_ExportUTString(file.InitScript)};");

    outputFile.WriteLine("}");
}

EnsureDataLoaded();

var extension = Data.Extensions.ByName("NekoPresence");
foreach(var file in extension.Files) {
    if(file.Filename.Content == "NekoPresence_x64.dll") {
        DumpExtensionFunctions(file, "_Patch_NekoPresence_DefineFunction", Path.Combine(ScriptPath, @"..", "extension.dump.txt"));
        return;
    }
}

throw new ScriptException("Cannot find extension dll");