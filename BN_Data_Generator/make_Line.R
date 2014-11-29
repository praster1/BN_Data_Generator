make_Line = function(nodes)
{
	if(nodes < 3)
	{
		print("More Nodes!");
		return(break);
	}

	arcs = matrix(0, nodes, nodes)	
	for (i in 1:(nodes-1))
	{
		arcs[i,(i+1)] = 1
	}
	
	
	arc_name = letters[1:nodes]
	dimnames(arcs)[[1]] = arc_name
	dimnames(arcs)[[2]] = arc_name
	
	Probs = list()
	
	Probs[[1]] = runif(1)
	for (i in 2:nodes)
	{
		Probs[[i]] = runif(2)
	}
	
	
	result = list(	arcs = arcs,
						Probs = Probs,
						arc_name = arc_name,
						num_of_nodes = nodes
					)
	return(result)
}


