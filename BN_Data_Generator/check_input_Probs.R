# Written by Jae-seong Yoo 20141217

check_input_Probs = function (arcs, node_names = NULL, cardinalities = NULL)
{
	# Check DAG
	check_dag_arcs = as.matrix(arcs)
	if (is.DAG(check_dag_arcs) == FALSE) {
		stop("arcs must a DAG")
	}
	
	# Node 개수
	num_of_nodes = dim(arcs)[1];

	# node_names가 NULL이면 임의로 node 이름을 부여한다.
	if (is.null(node_names)) {
		node_names = big_letters(num_of_nodes)
	}

	# Cardinality가 NULL이면 모두 2로 설정한다.
	# Cardinality는 모두 2보다 커야 한다.
	if (is.null(cardinalities)) {
		cardinalities = rep(2, num_of_nodes)
	} else if (sum(cardinalities < 2) > 0) {
		stop("All cardinality must be at least 2.")
	} else if (num_of_nodes != length(cardinalities)) {
		stop("Wrong length of cardinalities")
	}

	# 각 Node의 Parent Node 개수
	num_of_parent_nodes = apply(arcs, 2, sum);

	list_parent_nodes = list();
	for(m in 1:num_of_nodes) {
		if (length(which(arcs[,m]==1)) == 0) {
			list_parent_nodes[[m]] = NULL;
		} else {
			list_parent_nodes[[m]] = which(arcs[,m]==1);
		}
	}


	# Root node의 개수
	num_of_root_nodes = sum(num_of_parent_nodes == 0);


	# 지정해야할 조건부 확률 개수
	num_of_probs = NULL;
	for (k in 1:num_of_nodes) {
		num_of_probs[k] = (cardinalities[k]-1) * prod(cardinalities[list_parent_nodes[[k]]])
	}
	
	res = list(	cardinalities = cardinalities,
					node_names = node_names,
					num_of_root_nodes = num_of_root_nodes,
					list_parent_nodes = list_parent_nodes,
					num_of_probs = num_of_probs,
					num_of_parent_nodes = num_of_parent_nodes)
}