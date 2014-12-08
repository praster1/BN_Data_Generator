# Written by Jae-seong Yoo 20141101

make_Collapse = function (nodes)
{
	if(nodes < 3)
	{
		print("Need More Nodes!");
		return(break);
	}


	arcs = matrix(0, nodes, nodes)
	arcs[,nodes] = 1
	arcs[nodes,nodes] = 0
	
	node_names = letters[1:nodes]
	dimnames(arcs)[[1]] = node_names
	dimnames(arcs)[[2]] = node_names
	
	Probs = list()
	
	for (i in 1:(nodes-1))
	{
		Probs[[i]] = runif(1)
	}
	Probs[[nodes]] = runif(2^(nodes-1))
	
	
	result = list(	arcs_mat = arcs,
						Probs = Probs,
						node_names = node_names,
						num_of_nodes = nodes
					)
	return(result)
}