# Written by Jae-seong Yoo 20141101

real_alarm = function(n, rep=T)
{
	packages = c("bnlearn")
	if (length(setdiff(packages, rownames(installed.packages()))) > 0)
	{
		install.packages(setdiff(packages, rownames(installed.packages())))  
	}
	
	data(alarm, package = "bnlearn")
	data = alarm[sample(c(1:20000), n, rep=rep),]

	res = empty.graph(names(alarm))
	modelstring(res) = paste("[HIST|LVF][CVP|LVV][PCWP|LVV][HYP][LVV|HYP:LVF]",
			"[LVF][STKV|HYP:LVF][ERLO][HRBP|ERLO:HR][HREK|ERCA:HR][ERCA]",
			"[HRSA|ERCA:HR][ANES][APL][TPR|APL][ECO2|ACO2:VLNG][KINK]",
			"[MINV|INT:VLNG][FIO2][PVS|FIO2:VALV][SAO2|PVS:SHNT][PAP|PMB][PMB]",
			"[SHNT|INT:PMB][INT][PRSS|INT:KINK:VTUB][DISC][MVS][VMCH|MVS]",
			"[VTUB|DISC:VMCH][VLNG|INT:KINK:VTUB][VALV|INT:VLNG][ACO2|VALV]",
			"[CCHL|ACO2:ANES:SAO2:TPR][HR|CCHL][CO|HR:STKV][BP|CO:TPR]", sep = "")
	  
	arcs_mat = fromto_to_mat(temp$res$arcs, dimnames(temp$data)[[2]])
	  
	result = list(	arcs_mat = arcs_mat,
						node_names = dimnames(data)[[2]],
						data = data,
						res = res)
						
	return(result)
}