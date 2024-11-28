#load "../../patcher/lib/_Utils.csx"

void FixUpDecomp_NetworkFunctions(UndertaleData utdata) {
	var networkSendRawFuncInfo = utdata.BuiltinList.Functions["network_send_raw"];
	if(networkSendRawFuncInfo.ArgumentCount < 4) {
		networkSendRawFuncInfo.ArgumentCount = 4;
	}
}

if(ScriptPath == GetCurrentScript()) {
	FixUpDecomp_NetworkFunctions(Data);
}
