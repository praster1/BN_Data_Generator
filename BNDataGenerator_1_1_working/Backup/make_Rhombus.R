# Written by Jae-seong Yoo 20141101

make_Rhombus = function(nodes, input_Probs = NULL, node_names = NULL, cardinalities = NULL)
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
	
	
	# Check Input Probs & Cardinalities
	checker = check_cardinalities(arcs = arcs, node_names = node_names, cardinalities = cardinalities)
	cardinalities = checker$cardinalities;
	num_of_probs = checker$num_of_probs;
	node_names = checker$node_names;
	
	
	if (is.null(input_Probs) & is.null(cardinalities))
	{
		input_Probs = list()
		input_Probs[[1]] = runif(1)
		input_Probs[[2]] = runif(1)
		for (i in 3:nodes)
		{
			input_Probs[[i]] = runif(2^2)
		}
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
						cardinalities = cardinalities,
						num_of_nodes = nodes
					)
	return(result)
}