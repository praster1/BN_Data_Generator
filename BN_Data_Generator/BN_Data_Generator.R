BN_Data_Generator = function (arcs, input_Probs, n, node_names)
{
	# Node 개수
	num_of_nodes = dim(arcs)[1];

	# 각 Node의 Parent Node 개수
	num_of_parent_nodes = apply(arcs, 2, sum);
	
	list_parent_nodes = list();
	for(i in 1:num_of_nodes)
	{
		if (length(which(arcs[,i]==1)) == 0)
		{
			list_parent_nodes[[i]] = NULL;
		} else {
			list_parent_nodes[[i]] = which(arcs[,i]==1);
		}
	}
	
	# Root node의 개수
	root_nodes = sum(num_of_parent_nodes == 0);

	# 결과는 여기에 저장이 된다.
	result_mat = matrix(0, n, num_of_nodes);
	dimnames(result_mat)[[2]] = node_names;
	# result_mat
	
	# 지정해야할 조건부 확률 개수
	num_of_probs = t(as.matrix(2^num_of_parent_nodes));
	dimnames(num_of_probs)[[2]] = node_names;
	num_of_probs
	
	
	
	# 지정해야할 조건부 확률 개수만큼 input이 맞는지 확인. 만일 false이면 프로그램 종료
	input_prob_len = length(input_Probs);
	for (i in 1:input_prob_len)
	{
		if (length(input_Probs[[i]]) != num_of_probs[i])
		{
			cat("Error");
			return(break);
		}
	}
	
	
	
	# Root Node Initialization
	for(i in 1:root_nodes)
	{
		p = input_Probs[[i]][1];
		result_mat[,i] = sample(c("Y", "N"), n, prob=c(p, 1-p), rep=T);
	}


	
	# Generator
	init = 0
	for (i in 1:length(list_parent_nodes))
	{
		if (!is.null(list_parent_nodes[[i]]))
		{
			init = i;
			break;
		}
	}
	
	mat = NULL
	for (i in init:num_of_nodes)
	{
		
		for (j in 1:num_of_probs[i])
		{
			p = input_Probs[[i]][j];
			
			mat = 	t(t(
						as.matrix(result_mat[,list_parent_nodes[[i]]])) ==
						as.matrix(tosscoin(as.numeric(num_of_parent_nodes[i])))[j,]
						);
			mat = (apply(mat, 1, sum) == as.numeric(num_of_parent_nodes[i]));
			
			if(sum(mat) > 0)
			{
				len = sum(mat);
				result_mat[mat, i] = sample(c("Y", "N"), len, prob=c(p, 1-p), rep=T);
			}
		}
	}
	
	res = list(	data = data.frame(result_mat),
					node_names = node_names,
					num_of_nodes = num_of_nodes,
					num_of_parent_nodes = num_of_parent_nodes,
					list_parent_nodes = list_parent_nodes);
	return(res);
}