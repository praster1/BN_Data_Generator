# Written by Jae-seong Yoo 20141222

make_topology = function (nodes, topology = "Collapse", input_Probs = NULL, node_names = NULL, cardinalities = NULL)
{
	# Check Num of Nodes
	NeedMoreNodes = function(nodes)
	{
		if(nodes < nodes)
			stop("Need More Nodes!");
	}
	
	switch (topology,
		"Collapse" = {NeedMoreNodes(3)},
		"Line" = {NeedMoreNodes(3)},
		"Star" = {NeedMoreNodes(3)},
		"PseudoLoop" = {NeedMoreNodes(3)},
		"Diamond" = {NeedMoreNodes(4)},
		"Rhombus" = {NeedMoreNodes(4)},
	)
	
	
	# arcs_mat_mat
	arcs_mat = matrix(0, nodes, nodes);
	switch (topology,
		"Collapse" = {	arcs_mat[,nodes] = 1;
								arcs_mat[nodes,nodes] = 0;
							},
		"Line" = {	for (i in 1:(nodes-1))
						{
							arcs_mat[i,(i+1)] = 1
						}
					},
		"Star" = {	arcs_mat[1,] = 1
						arcs_mat[1,1] = 0
					},
		"PseudoLoop" = {	arcs_mat[1, nodes] = 1
									for (i in 1:(nodes-1))
									{
										arcs_mat[i,(i+1)] = 1
									}
								},
		"Diamond" = {	arcs_mat[1,] = 1
								arcs_mat[1,1] = 0
								arcs_mat[,nodes] = 1
								arcs_mat[1,nodes] = 0
								arcs_mat[nodes,nodes] = 0
							},
		"Rhombus" = {	arcs_mat[1,] = 1
								arcs_mat[2,] = 1
								arcs_mat[(1:2),(1:2)] = 0
								arcs_mat[nodes,nodes] = 0
							},
	)
	
	
	# Check Input Probs & Cardinalities
	checker = check_cardinalities(arcs_mat = arcs_mat, node_names = node_names, cardinalities = cardinalities)
	cardinalities = checker$cardinalities;
	num_of_probs = checker$num_of_probs;
	node_names = checker$node_names;
	
	
	# Random Probs
	if (is.null(input_Probs) & is.null(cardinalities))
	{
		input_Probs = list()
		switch (topology,
			"Collapse" = {	for (i in 1:(nodes-1))
									{
										input_Probs[[i]] = runif(1)
									}
									input_Probs[[nodes]] = runif(2^(nodes-1))
								},
			"Line" = {	input_Probs[[1]] = runif(1)
							for (i in 2:nodes)
							{
								input_Probs[[i]] = runif(2)
							}
						},
			"Star" = {	input_Probs[[1]] = runif(1)
							for (i in 2:nodes)
							{
								input_Probs[[i]] = runif(2)
							}
						},
			"PseudoLoop" = {	input_Probs[[1]] = runif(1)
										for (i in 2:(nodes-1))
										{
											input_Probs[[i]] = runif(2)
										}
										input_Probs[[nodes]] = runif(4)
									},
			"Diamond" = {	input_Probs[[1]] = runif(1)
									for (i in 2:(nodes-1))
									{
										input_Probs[[i]] = runif(2)
									}
									input_Probs[[nodes]] = runif(2^(nodes-2))
								},
			"Rhombus" = {	input_Probs[[1]] = runif(1)
									input_Probs[[2]] = runif(1)
									for (i in 3:nodes)
									{
										input_Probs[[i]] = runif(2^2)
									}
								},
		)
	} else if (is.null(input_Probs)) {
		input_Probs = list()
		for (i in 1:length(num_of_probs))
		{
			input_Probs[[i]] = runif(num_of_probs[i])
		}
	}
	
	
	result = list(	arcs_mat = arcs_mat,
						Probs = input_Probs,
						node_names = node_names,
						cardinalities = cardinalities,
						num_of_nodes = nodes
					)
	return(result)
}