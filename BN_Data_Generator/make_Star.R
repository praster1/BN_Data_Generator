# Written by Jae-seong Yoo 20141101

make_Star = function(nodes)
{
	if(nodes < 3)
	{
		print("Need More Nodes!");
		return(NULL);
	}

	arcs = matrix(0, nodes, nodes)
	arcs[1,] = 1
	arcs[1,1] = 0
	
	Probs = list()
	
	Probs[[1]] = runif(1)
	for (i in 2:nodes)
	{
		Probs[[i]] = runif(2)
	}
	
	
	result = list(	arcs_mat = arcs,
						Probs = Probs,
						num_of_nodes = nodes
					)
	return(result)
}