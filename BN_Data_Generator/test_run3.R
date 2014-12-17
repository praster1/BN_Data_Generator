# Written by Jae-seong Yoo 20141101
rm(list = ls())
setwd("D:/Dropbox/__GitHub/BN_Data_Generator/BN_Data_Generator")

source("include_sources.R", encoding="utf8")

##### Start
set.seed(1234)
require(bnlearn)

n = 1000

# Asia
arcs = rbind(
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
dimnames(arcs)[[1]] = node_names
dimnames(arcs)[[2]] = node_names

input_Probs = list(
		c(0.1),									# P(A)
		c(0.5, 0.01), 							# P(S), 			P(~S)
		c(0.05, 0.01),							# P(T|A), 		P(T|~A)
		c(0.1, 0.01, 0.5),						# P(L|S), 		P(L|~S), 		P(L|^S)
		c(	0.6, 0.3, 0.5,						# P(B|S), 		P(B|~S),		P(B|^S)
			0.5, 0.1, 0.3),						# P(~B|S),	P(~B|~S),	P(~B|^S)
		c(1, 1, 1, 0),							# P(E|T,L), 	P(E|~T,L), 	P(E|T,~L), 	P(E|~T,~L)
		c(0.98, 0.05),							# P(X|E), 		P(X|~E)
		c(0.9, 0.7, 0.8, 0.1, 0.5, 0.3)			# P(D|B,E), 	P(D|~B,E), 	P(D|B,~E), 	P(D|~B,~E)
)

					#	A	S	T	L	B	E	X	D
cardinalities = c(2,	3,	2,	2,	3,	2,	2,	2)

# check_input_Probs
res1 = check_input_Probs(arcs, node_names, cardinalities)
res1

res2 = BN_Data_Generator(arcs, input_Probs, n, node_names, cardinalities)
res2
data = res2$data



list_parent_nodes = res1$list_parent_nodes
num_of_probs = res1$num_of_probs
list_parent_nodes
num_of_probs



# Constraint-based algorithms
bn_gs = gs(data)				# the Grow-Shrink(GS)
bn_gs
# coefficients(bn.fit(bn_gs, data))

bn_iamb = iamb(data)			# the Incremental Association(IAMB)
bn_iamb
# coefficients(bn.fit(bn_iamb, data))


# Score-Based Algorithm
bn_hc = hc(data)				# Hill-Climbing (HC)
# bn_hc
# coefficients(bn.fit(bn_hc, data))
round(score(bn_hc, data, type = "bde"), 2)
round(score(bn_hc, data, type = "k2"), 2)
round(score(bn_hc, data, type = "loglik"), 2)
round(score(bn_hc, data, type = "aic"), 2)
round(score(bn_hc, data, type = "bic"), 2)


bn_tabu = tabu(data)			# Tabu search (TABU)
# bn_tabu
# coefficients(bn.fit(bn_tabu, data))
round(score(bn_tabu, data, type = "bde"), 2)
round(score(bn_tabu, data, type = "k2"), 2)
round(score(bn_tabu, data, type = "loglik"), 2)
round(score(bn_tabu, data, type = "aic"), 2)
round(score(bn_tabu, data, type = "bic"), 2)



# Hybsrid algorithms
bn_mmhc = mmhc(data)		# the Max-Min Hill Climbing (MMHC)
# bn_mmhc
# coefficients(bn.fit(bn_mmhc, data))
round(score(bn_mmhc, data, type = "bde"), 2)
round(score(bn_mmhc, data, type = "k2"), 2)
round(score(bn_mmhc, data, type = "loglik"), 2)
round(score(bn_mmhc, data, type = "aic"), 2)
round(score(bn_mmhc, data, type = "bic"), 2)


bn_rsmax2 = rsmax2(data)	# the more general 2-phase Restricted Maximization (RSMAX2)
# bn_rsmax2
# coefficients(bn.fit(bn_rsmax2, data))
round(score(bn_rsmax2, data, type = "bde"), 2)
round(score(bn_rsmax2, data, type = "k2"), 2)
round(score(bn_rsmax2, data, type = "loglik"), 2)
round(score(bn_rsmax2, data, type = "aic"), 2)
round(score(bn_rsmax2, data, type = "bic"), 2)


bn_hc_arcs_mat = fromto_to_mat(bn_hc$arcs, node_names)
bn_tabu_arcs_mat = fromto_to_mat(bn_tabu$arcs, node_names)
bn_mmhc_arcs_mat = fromto_to_mat(bn_mmhc$arcs, node_names)
bn_rsmax2_arcs_mat = fromto_to_mat(bn_rsmax2$arcs, node_names)


## C		# Correct Edges : 실제 네트워크 = 결과 네트워크, 방향 일치
## M		# Missed Edges : 실제 네트워크 존재 O, 결과 네트워크 존재 X
## WO	# Wrongly Oriented Edges : 실제 네트워크 = 결과 네트워크, 방향 반대
## WC	# Wrongly Connected Edges : 실제 네트워크 존재 X, 결과 네트워크 존재 O
C_M_WO_WC_mat = rbind(	C_M_WO_WC(target_arcs_mat, bn_hc_arcs_mat),			# HC
										C_M_WO_WC(target_arcs_mat, bn_tabu_arcs_mat),			# TABU
										C_M_WO_WC(target_arcs_mat, bn_mmhc_arcs_mat),		# MMHC
										C_M_WO_WC(target_arcs_mat, bn_rsmax2_arcs_mat))		# RSMAX2
dimnames(C_M_WO_WC_mat)[[1]] = c("HC", "TABU", "MMHC", "RSMAX2")
dimnames(C_M_WO_WC_mat)[[2]] = c("C", "M", "WO", "WC")
C_M_WO_WC_mat

# big_letters(num_of_nodes)
			
par(mfrow = c(2, 3))

# Constraint-based algorithms
plot(bn_gs, main = "Grow-Shrink")
plot(bn_iamb, main = "Incremental Association")

# Score-Based Algorithm
plot(bn_hc, main = "Hill-Climbing")		
plot(bn_tabu, main = "Tabu search")		

# Hybrid algorithms
plot(bn_mmhc, main = "Max-Min Hill Climbing")
plot(bn_rsmax2, main = "Restricted Maximization")
