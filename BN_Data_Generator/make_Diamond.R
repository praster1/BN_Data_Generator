make_Diamond = function(nodes)
{
	if(nodes < 4)
	{
		print("More Nodes!");
		return(break);
	}
	
	arcs = matrix(0, nodes, nodes)
	arcs[1,] = 1
	arcs[1,1] = 0
	arcs[,nodes] = 1
	arcs[1,nodes] = 0
	arcs[nodes,nodes] = 0
	
	arc_name = letters[1:nodes]
	dimnames(arcs)[[1]] = arc_name
	dimnames(arcs)[[2]] = arc_name
	
	Probs = list()
	
	Probs[[1]] = runif(1)
	for (i in 2:(nodes-1))
	{
		Probs[[i]] = runif(2)
	}
	Probs[[nodes]] = runif(2^(nodes-2))
	
	
	result = list(	arcs = arcs,
						Probs = Probs,
						arc_name = arc_name,
						num_of_nodes = nodes
					)
	return(result)
}