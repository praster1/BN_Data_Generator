# Written by Jae-seong Yoo 20141101

make_Rhombus = function(nodes)
{
	if(nodes < 4)
	{
		stop("Need More Nodes!");
	}

	arcs = matrix(0, nodes, nodes)
	arcs[1,] = 1
	arcs[2,] = 1
	arcs[(1:2),(1:2)] = 0
	arcs[nodes,nodes] = 0
	
	Probs = list()
	
	Probs[[1]] = runif(1)
	Probs[[2]] = runif(1)
	for (i in 3:nodes)
	{
		Probs[[i]] = runif(2^2)
	}
	
	
	result = list(	arcs_mat = arcs,
						Probs = Probs,
						num_of_nodes = nodes
					)
	return(result)
}