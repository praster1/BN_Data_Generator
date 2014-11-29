make_Collapse = function (nodes)
{
	if(nodes < 3)
	{
		print("More Nodes!");
		return(break);
	}


	arcs = matrix(0, nodes, nodes)
	arcs[,nodes] = 1
	arcs[nodes,nodes] = 0
	
	arc_name = letters[1:nodes]
	dimnames(arcs)[[1]] = arc_name
	dimnames(arcs)[[2]] = arc_name
	
	Probs = list()
	
	for (i in 1:(nodes-1))
	{
		Probs[[i]] = runif(1)
	}
	Probs[[nodes]] = runif(2^(nodes-1))
	
	
	result = list(	arcs = arcs,
						Probs = Probs,
						arc_name = arc_name,
						num_of_nodes = nodes
					)
	return(result)
}