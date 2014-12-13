# Written by Jae-seong Yoo 20141101

real_alarm = function(n)
{
	data = data(alarm)

	if (n >= 20000)
	{
		data = alarm[sample(c(1:20000), n, rep=T),]
	} else {
		data = alarm[sample(c(1:20000), n),]
	}

	res = empty.graph(names(alarm))
	modelstring(res) = paste("[HIST|LVF][CVP|LVV][PCWP|LVV][HYP][LVV|HYP:LVF]",
			"[LVF][STKV|HYP:LVF][ERLO][HRBP|ERLO:HR][HREK|ERCA:HR][ERCA]",
			"[HRSA|ERCA:HR][ANES][APL][TPR|APL][ECO2|ACO2:VLNG][KINK]",
			"[MINV|INT:VLNG][FIO2][PVS|FIO2:VALV][SAO2|PVS:SHNT][PAP|PMB][PMB]",
			"[SHNT|INT:PMB][INT][PRSS|INT:KINK:VTUB][DISC][MVS][VMCH|MVS]",
			"[VTUB|DISC:VMCH][VLNG|INT:KINK:VTUB][VALV|INT:VLNG][ACO2|VALV]",
			"[CCHL|ACO2:ANES:SAO2:TPR][HR|CCHL][CO|HR:STKV][BP|CO:TPR]", sep = "")
	  
	result = list(	data = data, res = res)
						
	return(result)
}