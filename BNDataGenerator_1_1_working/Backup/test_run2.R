# Written by Jae-seong Yoo 20141101

rm(list = ls())
setwd("D:/Dropbox/__GitHub/BN_Data_Generator/BN_Data_Generator")



source("include_sources.R", encoding="utf8")



##### Start
set.seed(1234)
require(bnlearn)


n = 1000


# Asia
arcs_mat = rbind(
		#	A	S	T	L	B	E	X	D
		c(0,	0,	1,	0,	0,	0,	0,	0),	#A
		c(0,	0,	0,	1,	1,	0,	0,	0),	#S
		c(0,	0,	0,	0,	0,	1,	0,	0),	#T
		c(0,	0,	0,	0,	0,	1,	0,	0),	#L
		c(0,	0,	0,	0,	0,	0,	0,	1),	#B
		c(0,	0,	0,	0,	0,	0,	1,	1),	#E
		c(0,	0,	0,	0,	0,	0,	0,	0),	#X
		c(0,	0,	0,	0,	0,	0,	0,	0)	#D
		)
node_names = c("A", "S", "T", "L", "B", "E", "X", "D")
dimnames(arcs_mat)[[1]] = node_names
dimnames(arcs_mat)[[2]] = node_names

input_Probs = list(
		c(0.1),									# P(A)
		c(0.5, 0.01), 							# P(S), 			P(~S)
		c(0.05, 0.01),							# P(T|A), 		P(T|~A)
		c(0.1, 0.01, 0.5),						# P(L|S), 		P(L|~S), 		P(L|^S)
		c(	0.6, 0.3, 0.5,						# P(B|S), 		P(B|~S),		P(B|^S)
			0.5, 0.1, 0.3),						# P(~B|S),	P(~B|~S),	P(~B|^S)
		c(1, 1, 1, 0),							# P(E|T,L), 	P(E|~T,L), 	P(E|T,~L), 	P(E|~T,~L)
		c(0.98, 0.05),							# P(X|E), 		P(X|~E)
		c(0.9, 0.7, 0.8, 0.1, 0.5, 0.3)		# P(D|B,E), 	P(D|~B,E), 	P(D|B,~E), 	P(D|~B,~E)
)


					#	A	S	T	L	B	E	X	D
cardinalities = c(2,	3,	2,	2,	3,	2,	2,	2)


# Check DAG
check_dag_arcs = as.matrix(arcs_mat)
if (is_DAG(check_dag_arcs) == FALSE) {
	stop("arcs_mat must a DAG")
}

# Check Sample Size
if (n <= 0) {
	stop("Sample size 'n' must be greater than 0.")
}



# 20141209: sample size가 1000개보다 적으면 데이터가 올바르게 생성되지 않는 버그가 있다.
# 이를 보완하기 위한 부분.
if (n < 10000) {
	temp_n = 1000;
} else {
	temp_n = n;
}
#####


# Node 개수
num_of_nodes = dim(arcs_mat)[1];


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
num_of_parent_nodes = apply(arcs_mat, 2, sum);

list_parent_nodes = list();
for(i in 1:num_of_nodes) {
	if (length(which(arcs_mat[,i]==1)) == 0) {
		list_parent_nodes[[i]] = NULL;
	} else {
		list_parent_nodes[[i]] = which(arcs_mat[,i]==1);
	}
}


# Root node의 개수
root_nodes = sum(num_of_parent_nodes == 0);


# 결과는 여기에 저장이 된다.
result_mat = matrix(0, temp_n, num_of_nodes);
dimnames(result_mat)[[2]] = node_names;
# result_mat



# 지정해야할 조건부 확률 개수만큼 input이 맞는지 확인. 만일 false이면 프로그램 종료
input_prob_len = length(input_Probs);
num_of_probs = NULL
for (i in 1:input_prob_len) {
	num_of_probs[i] = (cardinalities[i]-1) * prod(cardinalities[list_parent_nodes[[i]]])
	if (length(input_Probs[[i]]) != num_of_probs[i]) {
		stop("Input Probs != num_of_probs!");
	}
}



# Root Node Initialization
for(i in 1:root_nodes) {
	p = input_Probs[[i]];
	mat_values = merge("Value", c(1:cardinalities[i]))
	mat_values = paste(mat_values[,1], mat_values[,2], sep="")

	result_mat[,i] = sample(
										mat_values, temp_n,
										prob=c(p, 1-sum(p)), rep=T
										);
}



# Generator
init = root_nodes + 1;

mat = NULL
for (i in init:num_of_nodes) {
	p = input_Probs[[i]]
	num_of_c_cases = prod(cardinalities[list_parent_nodes[[i]]])

	temp_cases = list();
	cases = NULL;
	for (j in 1:length(list_parent_nodes[[i]]))
	{
		temp_cases[[j]] = toss_value(1, cardinalities[list_parent_nodes[[i]][j]])
		if (is.null(cases)) {
			cases = temp_cases[[j]]
			names(cases) = 1;
		} else {
			cases = merge(cases, temp_cases[[j]])
			names(cases) = c(1:dim(cases)[2])
		}
	}
	cases = as.matrix(cases)
	mat_values = merge("Value", c(1:cardinalities[i]))
	mat_values = sort(paste(mat_values[,1], mat_values[,2], sep=""))
	
	stack = 1
	for(j in 1:dim(cases)[1])
	{	
		mat = t(
					t(
						as.matrix(result_mat[,list_parent_nodes[[i]]])
					) ==
						cases[j,]
				);
		mat = (apply(mat, 1, sum) == dim(mat)[2])
		
		if (cardinalities[i] == 2)
		{
			temp_p = p[j]
		} else {
			temp_p = p[stack:(stack + cardinalities[i]-2)]
		}
		len = length(which(mat))
				
		result_mat[which(mat),i] = sample(
															mat_values, len,
															prob=c(temp_p, 1-sum(temp_p)), rep=T
														);
		
		stack = stack + (cardinalities[i]-1)
	}
}





# 20141209: sample size가 1000개보다 적으면 데이터가 올바르게 생성되지 않는 버그가 있다.
# 이를 보완하기 위한 부분.
if (n < 1000) {
	result_mat = result_mat[sample(c(1:1000), size=n), ]
}
#####

res = list(	data = data.frame(result_mat),
				node_names = node_names,
				num_of_nodes = num_of_nodes,
				num_of_parent_nodes = num_of_parent_nodes,
				list_parent_nodes = list_parent_nodes);
				
# res
head(res$data)
apply(res$data, 2, unique)
summary(apply(res$data, 2, factor))