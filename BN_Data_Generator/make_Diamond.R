# Written by Jae-seong Yoo 20141101

make_Diamond = function(nodes)
{
	if(nodes < 4)
	{
		print("Need More Nodes!");
		return(NULL);
	}
	
	arcs = matrix(0, nodes, nodes)
	arcs[1,] = 1
	arcs[1,1] = 0
	arcs[,nodes] = 1
	arcs[1,nodes] = 0
	arcs[nodes,nodes] = 0
	
	Probs = list()
	
	Probs[[1]] = runif(1)
	for (i in 2:(nodes-1))
	{
		Probs[[i]] = runif(2)
	}
	Probs[[nodes]] = runif(2^(nodes-2))
	
	
	result = list(	arcs_mat = arcs,
						Probs = Probs,
						num_of_nodes = nodes
					)
	return(result)
}