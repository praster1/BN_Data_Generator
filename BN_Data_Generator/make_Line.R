# Written by Jae-seong Yoo 20141101

make_Line = function(nodes, input_Probs = NULL, cardinalities = NULL)
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
	
	
	# Check Input Probs & Cardinalities
	checker = check_input_Probs(arcs = arcs, cardinalities = cardinalities)
	cardinalities = checker$cardinalities;
	
	
	if (is.NULL(input_Probs))
	{
		input_Probs = list()
		
		input_Probs[[1]] = runif(1)
		for (i in 2:nodes)
		{
			input_Probs[[i]] = runif(2)
		}
	}
	
	
	result = list(	arcs_mat = arcs,
						Probs = input_Probs,
						num_of_nodes = nodes
					)
	return(result)
}


