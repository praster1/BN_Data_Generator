# Written by Jae-seong Yoo 20141101

make_Diamond = function(nodes, input_Probs = NULL, cardinalities = NULL)
{
	if(nodes < 4)
	{
		stop("Need More Nodes!");
	}
	
	arcs = matrix(0, nodes, nodes)
	arcs[1,] = 1
	arcs[1,1] = 0
	arcs[,nodes] = 1
	arcs[1,nodes] = 0
	arcs[nodes,nodes] = 0
	
	
	# Check Input Probs & Cardinalities
	checker = check_input_Probs(arcs = arcs, cardinalities = cardinalities)
	cardinalities = checker$cardinalities;
	num_of_probs = checker$num_of_probs;
	
	
	input_Probs = list()
	if (is.NULL(input_Probs) & is.NULL(cardinalities))
	{
		input_Probs[[1]] = runif(1)
		for (i in 2:(nodes-1))
		{
			input_Probs[[i]] = runif(2)
		}
		input_Probs[[nodes]] = runif(2^(nodes-2))
	} else if (is.NULL(input_Probs)) {
		for (i in 1:length(num_of_probs))
		{
			input_Probs[[i]] = NULL;
			for (j in 1:num_of_probs[i])
			{
				input_Probs[[i]] = c(input_Probs[[i]], runif(1))
			}
		}
	}
	
	
	result = list(	arcs_mat = arcs,
						Probs = input_Probs,
						num_of_nodes = nodes
					)
	return(result)
}