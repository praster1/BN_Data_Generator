# Written by Jae-seong Yoo 20141101

make_Line = function(nodes)
{
	if(nodes < 3)
	{
		stop("Need More Nodes!");
	}

	arcs = matrix(0, nodes, nodes)	
	for (i in 1:(nodes-1))
	{
		arcs[i,(i+1)] = 1
	}
	
	
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


