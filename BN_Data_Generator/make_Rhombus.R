# Written by Jae-seong Yoo 20141101

make_Rhombus = function(nodes)
{
	if(nodes < 4)
	{
		print("Need More Nodes!");
		return(break);
	}

	arcs = matrix(0, nodes, nodes)
	arcs[1,] = 1
	arcs[2,] = 1
	arcs[(1:2),(1:2)] = 0
	arcs[nodes,nodes] = 0
	
	node_names = letters[1:nodes]
	dimnames(arcs)[[1]] = node_names
	dimnames(arcs)[[2]] = node_names
	
	Probs = list()
	
	Probs[[1]] = runif(1)
	Probs[[2]] = runif(1)
	for (i in 3:nodes)
	{
		Probs[[i]] = runif(2^2)
	}
	
	
	result = list(	arcs_mat = arcs,
						Probs = Probs,
						node_names = node_names,
						num_of_nodes = nodes
					)
	return(result)
}