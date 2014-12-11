# Written by Jae-seong Yoo 20141101

BN_Data_Generator = function (arcs, input_Probs, n, node_names = NULL, cardinalities = NULL)
{
	# Check DAG
	check_dag_arcs = as.matrix(arcs)
	if (is.DAG(check_dag_arcs) == FALSE) {
		stop("arcs must a DAG")
	}
	
	# Check Sample Size
	if (n <= 0) {
		stop("Sample size 'n' must be greater than 0.")
	}



	# 20141209: sample size가 1000개보다 적으면 데이터가 올바르게 생성되지 않는 버그가 있다.
	# 이를 보완하기 위한 부분.
	if (n < 1000) {
		temp_n = 1000;
	} else {
		temp_n = n;
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
	} else if (sum(cardinalities < 2)) {
		stop("All cardinality must be at least 2.")
	} else if (num_of_nodes != length(cardinalities)) {
		stop("Wrong length of cardinalities")
	}
	
	
	# 각 Node의 Parent Node 개수
	num_of_parent_nodes = apply(arcs, 2, sum);
	
	list_parent_nodes = list();
	for(i in 1:num_of_nodes) {
		if (length(which(arcs[,i]==1)) == 0) {
			list_parent_nodes[[i]] = NULL;
		} else {
			list_parent_nodes[[i]] = which(arcs[,i]==1);
		}
	}
	
	
	# Root node의 개수
	root_nodes = sum(num_of_parent_nodes == 0);

	
	# 결과는 여기에 저장이 된다.
	result_mat = matrix(0, temp_n, num_of_nodes);
	dimnames(result_mat)[[2]] = node_names;
	# result_mat
	
	
	# 지정해야할 조건부 확률 개수
	num_of_probs = t(as.matrix(2^num_of_parent_nodes));
	dimnames(num_of_probs)[[2]] = node_names;
	num_of_probs
	
	
	
	# 지정해야할 조건부 확률 개수만큼 input이 맞는지 확인. 만일 false이면 프로그램 종료
	input_prob_len = length(input_Probs);
	for (i in 1:input_prob_len) {
		if (length(input_Probs[[i]]) != num_of_probs[i]) {
			cat("Error");
			return(NULL);
		}
	}
	
	
	
	# Root Node Initialization
	for(i in 1:root_nodes) {
		p = input_Probs[[i]][1];
		# result_mat[,i] = sample(c("Value1", "Value2"), temp_n, prob=c(p, 1-p), rep=T);
		mat_values = merge("Value", c(1:cardinalities[i]))
		result_mat[,i] = sample(
										paste(mat_values[,1], mat_values[,2], sep=""), temp_n, prob=c(p, 1-p),
										rep=T
								);
	}


	
	# Generator
	init = 0
	for (i in 1:length(list_parent_nodes)) {
		if (!is.null(list_parent_nodes[[i]])) {
			init = i;
			break;
		}
	}
	
	mat = NULL
	for (i in init:num_of_nodes) {
		for (j in 1:num_of_probs[i]) {
			p = input_Probs[[i]][j];
			
			mat = 	t(t(
							as.matrix(result_mat[,list_parent_nodes[[i]]])) ==
							as.matrix(toss_value(as.numeric(num_of_parent_nodes[i]), 2))[j,]
						);
			mat = (apply(mat, 1, sum) == as.numeric(num_of_parent_nodes[i]));
			
			if(sum(mat) > 0)
			{
				len = sum(mat);
				result_mat[mat, i] = sample(c("Value1", "Value2"), len, prob=c(p, 1-p), rep=T);
			}
		}
	}
	
	
	# 20141209: sample size가 1000개보다 적으면 데이터가 올바르게 생성되지 않는 버그가 있다.
	# 이를 보완하기 위한 부분.
	if (n < 1000) {
		result_mat = result_mat[sample(c(1:1000), size=n), ]
	}
	
	res = list(	data = data.frame(result_mat),
					node_names = node_names,
					num_of_nodes = num_of_nodes,
					num_of_parent_nodes = num_of_parent_nodes,
					list_parent_nodes = list_parent_nodes);
	return(res);
}