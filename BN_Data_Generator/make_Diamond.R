# Written by Jae-seong Yoo 20141101

make_Diamond = function(nodes, input_Probs = NULL, node_names = NULL, cardinalities = NULL)
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
	checker = check_input_Probs(arcs = arcs, node_names = node_names, cardinalities = cardinalities)
	cardinalities = checker$cardinalities;
	num_of_probs = checker$num_of_probs;
	node_names = checker$node_names;
	
	
	if (is.null(input_Probs) & is.null(cardinalities))
	{
		input_Probs = list()
		input_Probs[[1]] = runif(1)
		for (i in 2:(nodes-1))
		{
			input_Probs[[i]] = runif(2)
		}
		input_Probs[[nodes]] = runif(2^(nodes-2))
	} else if (is.null(input_Probs)) {
		input_Probs = list()
		for (i in 1:length(num_of_probs))
		{
			input_Probs[[i]] = runif(num_of_probs[i])
		}
	}
	
	
	result = list(	arcs_mat = arcs,
						Probs = input_Probs,
						node_names = node_names,
						num_of_nodes = nodes
					)
	return(result)
}