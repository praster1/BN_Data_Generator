# Written by Jae-seong Yoo 20141101

make_PseudoLoop = function(nodes)
{
	if(nodes < 3)
	{
		print("Need More Nodes!");
		return(break);
	}

	arcs = matrix(0, nodes, nodes)	
	arcs[1, nodes] = 1
	for (i in 1:(nodes-1))
	{
		arcs[i,(i+1)] = 1
	}
	
	
	node_names = letters[1:nodes]
	dimnames(arcs)[[1]] = node_names
	dimnames(arcs)[[2]] = node_names
	
	Probs = list()
	
	Probs[[1]] = runif(1)
	for (i in 2:(nodes-1))
	{
		Probs[[i]] = runif(2)
	}
	Probs[[nodes]] = runif(4)
		
	
	result = list(	arcs_mat = arcs,
						Probs = Probs,
						node_names = node_names,
						num_of_nodes = nodes
					)
	return(result)
}