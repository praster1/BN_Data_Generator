# Written by Jae-seong Yoo 20141101

make_Collapse = function (nodes, input_Probs = NULL, cardinalities = NULL)
{
	if(nodes < 3)
	{
		stop("Need More Nodes!");
	}


	arcs = matrix(0, nodes, nodes)
	arcs[,nodes] = 1
	arcs[nodes,nodes] = 0
	
	
	# Check Input Probs & Cardinalities
	checker = check_input_Probs(arcs = arcs, cardinalities = cardinalities)
	cardinalities = checker$cardinalities;
	
	
	if (is.NULL(input_Probs))
	{
		input_Probs = list()
		
		for (i in 1:(nodes-1))
		{
			input_Probs[[i]] = runif(1)
		}
		input_Probs[[nodes]] = runif(2^(nodes-1))
	}
	
	
	result = list(	arcs_mat = arcs,
						Probs = input_Probs,
						num_of_nodes = nodes
					)
	return(result)
}