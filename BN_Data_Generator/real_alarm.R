data(alarm)
data = alarm[sample(c(1:20000), n),]

res = empty.graph(names(alarm))
modelstring(res) = paste("[HIST|LVF][CVP|LVV][PCWP|LVV][HYP][LVV|HYP:LVF]",
  "[LVF][STKV|HYP:LVF][ERLO][HRBP|ERLO:HR][HREK|ERCA:HR][ERCA]",
  "[HRSA|ERCA:HR][ANES][APL][TPR|APL][ECO2|ACO2:VLNG][KINK]",
  "[MINV|INT:VLNG][FIO2][PVS|FIO2:VALV][SAO2|PVS:SHNT][PAP|PMB][PMB]",
  "[SHNT|INT:PMB][INT][PRSS|INT:KINK:VTUB][DISC][MVS][VMCH|MVS]",
  "[VTUB|DISC:VMCH][VLNG|INT:KINK:VTUB][VALV|INT:VLNG][ACO2|VALV]",
  "[CCHL|ACO2:ANES:SAO2:TPR][HR|CCHL][CO|HR:STKV][BP|CO:TPR]", sep = "")
  
  
nodes = dim(data)[2]
arcs_mat = matrix(0, nodes, nodes)

arc_name = names(data)
arcs_order_mat = cbind(arc_name, c(1:length(arc_name)))
arcs = cbind(match(res$arc[,1], arcs_order_mat), match(res$arc[,2], arcs_order_mat))


if (length(arcs) > 0)
{
	for (i in 1:dim(arcs)[1])
	{
		from = as.numeric(arcs[i,1])
		to = as.numeric(arcs[i,2])
		arcs_mat[from, to] = arcs_mat[from, to] + 1
	}
}


arcs = arcs_mat
