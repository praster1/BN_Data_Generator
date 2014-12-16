mat_to_fromto = function(arcs_mat)
{
	# Check DAG
	check_dag_arcs = as.matrix(arcs)
	if (is.DAG(check_dag_arcs) == FALSE) {
		stop("arcs must a DAG")
	}
	
	node_names = dimnames(arcs_mat)[[2]]
	num_of_nodes = length(node_names)
	result_mat = NULL
	

	for (i in 1:num_of_nodes)
	{
		where = which(arcs[i,] == 1)
		len = length(where)
		if (len > 0)
		{
			for (j in 1:len)
			{
				temp = c(node_names[i], node_names[where[j]])
				result_mat = rbind(result_mat, temp)
			}
		}
	}
	
	dimnames(result_mat)[[1]] = NULL
	dimnames(result_mat)[[2]] = c("from", "to")
	
	return(result_mat);
}