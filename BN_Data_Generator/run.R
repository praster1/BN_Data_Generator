rm(list = ls())
setwd("D:/Dropbox/__베이지안 네트워크/Scores/R")

source("tosscoin.R")						# tosscoin = function (times, makespace = FALSE)
source("BN_Data_Generator.R")		# BN_Data_Generator = function (arcs, input_Probs, n, node_names)
source("make_Collapse.R")			# make_Collapse = function(nodes)
source("make_Line.R")					# make_Line = function(nodes)
source("make_Star.R")					# make_Star = function(nodes)
source("make_PseudoLoop.R")		# make_PseudoLoop = function(nodes)
source("make_Diamond.R")			# make_Diamond = function(nodes)
source("make_Rhombus.R")			# make_Rhombus = function(nodes)



##### 시작
# set.seed(1234)
require(bnlearn)


n = 1000

# nodes = 7
# temp = make_Rhombus(nodes)
# arcs = temp$arcs
# arc_name = temp$arc_name
# arcs_order_mat = cbind(arc_name, c(1:length(arc_name)))

# res = BN_Data_Generator(temp$arcs, temp$Probs, n, temp$arc_name)
# data = res$data

# source("gen_asia.R")
# res = BN_Data_Generator(arcs, Probs, n, arc_name)
# data = res$data


# setwd("D:/Dropbox/__베이지안 네트워크/Scores")
# setwd("F:/Scores/Generated_by_WEKA")
# setwd("D:/Dropbox/__베이지안 네트워크/Scores/Generated_by_WEKA_09")

# data = data[sample(c(1:30000), n),]


source("real_asia.R")
# source("real_insurance.R")
# source("real_alarm.R")
# source("real_hailfinder.R")




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
# score(bn_hc, data, type = "k2")
round(score(bn_hc, data, type = "loglik"), 2)
round(score(bn_hc, data, type = "aic"), 2)
round(score(bn_hc, data, type = "bic"), 2)


bn_tabu = tabu(data)			# Tabu search (TABU)
# bn_tabu
# coefficients(bn.fit(bn_tabu, data))
round(score(bn_tabu, data, type = "bde"), 2)
# score(bn_tabu, data, type = "k2")
round(score(bn_tabu, data, type = "loglik"), 2)
round(score(bn_tabu, data, type = "aic"), 2)
round(score(bn_tabu, data, type = "bic"), 2)



# Hybsrid algorithms
bn_mmhc = mmhc(data)		# the Max-Min Hill Climbing (MMHC)
# bn_mmhc
# coefficients(bn.fit(bn_mmhc, data))
round(score(bn_mmhc, data, type = "bde"), 2)
# score(bn_mmhc, data, type = "k2")
round(score(bn_mmhc, data, type = "loglik"), 2)
round(score(bn_mmhc, data, type = "aic"), 2)
round(score(bn_mmhc, data, type = "bic"), 2)


bn_rsmax2 = rsmax2(data)	# the more general 2-phase Restricted Maximization (RSMAX2)
# bn_rsmax2
# coefficients(bn.fit(bn_rsmax2, data))
round(score(bn_rsmax2, data, type = "bde"), 2)
# score(bn_rsmax2, data, type = "k2")
round(score(bn_rsmax2, data, type = "loglik"), 2)
round(score(bn_rsmax2, data, type = "aic"), 2)
round(score(bn_rsmax2, data, type = "bic"), 2)



bn_hc_arcs = cbind(match(bn_hc$arcs[,1], arcs_order_mat), match(bn_hc$arcs[,2], arcs_order_mat))
bn_tabu_arcs = cbind(match(bn_tabu$arcs[,1], arcs_order_mat), match(bn_tabu$arcs[,2], arcs_order_mat))
bn_mmhc_arcs = cbind(match(bn_mmhc$arcs[,1], arcs_order_mat), match(bn_mmhc$arcs[,2], arcs_order_mat)) 
bn_rsmax2_arcs = cbind(match(bn_rsmax2$arcs[,1], arcs_order_mat), match(bn_rsmax2$arcs[,2], arcs_order_mat))

bn_hc_arcs_mat = bn_tabu_arcs_mat = bn_mmhc_arcs_mat = bn_rsmax2_arcs_mat = matrix(0, nodes, nodes)
dimnames(bn_hc_arcs_mat)[[1]] = arc_name
dimnames(bn_hc_arcs_mat)[[2]] = arc_name
dimnames(bn_tabu_arcs_mat)[[1]] = arc_name
dimnames(bn_tabu_arcs_mat)[[2]] = arc_name
dimnames(bn_mmhc_arcs_mat)[[1]] = arc_name
dimnames(bn_mmhc_arcs_mat)[[2]] = arc_name
dimnames(bn_rsmax2_arcs_mat)[[1]] = arc_name
dimnames(bn_rsmax2_arcs_mat)[[2]] = arc_name

if (length(bn_hc_arcs) > 0)
{
	for (i in 1:dim(bn_hc_arcs)[1])
	{
		from = as.numeric(bn_hc_arcs[i,1])
		to = as.numeric(bn_hc_arcs[i,2])
		bn_hc_arcs_mat[from, to] = bn_hc_arcs_mat[from, to] + 1
	}
}

if (length(bn_tabu_arcs) > 0)
{
	for (i in 1:dim(bn_tabu_arcs)[1])
	{
		from = as.numeric(bn_tabu_arcs[i,1])
		to = as.numeric(bn_tabu_arcs[i,2])
		bn_tabu_arcs_mat[from, to] = bn_tabu_arcs_mat[from, to] + 1
	}
}

if (length(bn_mmhc_arcs) > 0)
{
	for (i in 1:dim(bn_mmhc_arcs)[1])
	{
		from = as.numeric(bn_mmhc_arcs[i,1])
		to = as.numeric(bn_mmhc_arcs[i,2])
		bn_mmhc_arcs_mat[from, to] = bn_mmhc_arcs_mat[from, to] + 1
	}
}

if (length(bn_rsmax2_arcs) > 0)
{
	for (i in 1:dim(bn_rsmax2_arcs)[1])
	{
		from = as.numeric(bn_rsmax2_arcs[i,1])
		to = as.numeric(bn_rsmax2_arcs[i,2])
		bn_rsmax2_arcs_mat[from, to] = bn_rsmax2_arcs_mat[from, to] + 1
	}
}


## C		# Correct Edges : 실제 네트워크 = 결과 네트워크, 방향 일치
## M		# Missed Edges : 실제 네트워크 존재 O, 결과 네트워크 존재 X
## WO	# Wrongly Oriented Edges : 실제 네트워크 = 결과 네트워크, 방향 반대
## WC	# Wrongly Connected Edges : 실제 네트워크 존재 X, 결과 네트워크 존재 O
C_M_WO_WC_mat = matrix(0, 4, 4)
dimnames(C_M_WO_WC_mat)[[1]] = c("HC", "TABU", "MMHC", "RSMAX2")
dimnames(C_M_WO_WC_mat)[[2]] = c("C", "M", "WO", "WC")

for (i in 1:nodes)
{
	# HC
	C_M_WO_WC_mat[1,1] = C_M_WO_WC_mat[1,1] + abs(
											sum((arcs[,i] == 1) &
													(bn_hc_arcs_mat[,i] == 1) &
													(arcs[,i] == bn_hc_arcs_mat[,i])))
				
	C_M_WO_WC_mat[1,2] = C_M_WO_WC_mat[1,2] + abs(
											sum((arcs[,i] == 1) &
													(bn_hc_arcs_mat[,i] == 0) &
													(arcs[,i] != bn_hc_arcs_mat[,i])) -
											sum((arcs[,i] == 1) &
													(bn_hc_arcs_mat[i,] == 1) &
													(arcs[,i] == bn_hc_arcs_mat[i,])))
				
	C_M_WO_WC_mat[1,3] = C_M_WO_WC_mat[1,3] + abs(
											sum((arcs[,i] == 1) &
													(bn_hc_arcs_mat[i,] == 1) &
													(arcs[,i] == bn_hc_arcs_mat[i,])))
				
	C_M_WO_WC_mat[1,4] = C_M_WO_WC_mat[1,4] + abs(
											sum((arcs[,i] == 0) &
													(bn_hc_arcs_mat[,i] == 1) &
													(arcs[,i] != bn_hc_arcs_mat[,i])) -
											sum((arcs[i,] == 0) &
													(bn_hc_arcs_mat[i,] == 1) &
													(arcs[i,] != bn_hc_arcs_mat[i,])))

	# TABU
	C_M_WO_WC_mat[2,1] = C_M_WO_WC_mat[2,1] + abs(
											sum((arcs[,i] == 1) &
													(bn_tabu_arcs_mat[,i] == 1) &
													(arcs[,i] == bn_tabu_arcs_mat[,i])))
				
	C_M_WO_WC_mat[2,2] = C_M_WO_WC_mat[2,2] + abs(
											sum((arcs[,i] == 1) &
													(bn_tabu_arcs_mat[,i] == 0) &
													(arcs[,i] != bn_tabu_arcs_mat[,i])) -
											sum((arcs[,i] == 1) &
													(bn_tabu_arcs_mat[i,] == 1) &
													(arcs[,i] == bn_tabu_arcs_mat[i,])))
				
	C_M_WO_WC_mat[2,3] = C_M_WO_WC_mat[2,3] + abs(
											sum((arcs[,i] == 1) &
													(bn_tabu_arcs_mat[i,] == 1) &
													(arcs[,i] == bn_tabu_arcs_mat[i,])))
				
	C_M_WO_WC_mat[2,4] = C_M_WO_WC_mat[2,4] + abs(
											sum((arcs[,i] == 0) &
													(bn_tabu_arcs_mat[,i] == 1) &
													(arcs[,i] != bn_tabu_arcs_mat[,i])) -
											sum((arcs[i,] == 0) &
													(bn_tabu_arcs_mat[i,] == 1) &
													(arcs[i,] != bn_tabu_arcs_mat[i,])))

	# MMHC
	C_M_WO_WC_mat[3,1] = C_M_WO_WC_mat[3,1] + abs(
											sum((arcs[,i] == 1) &
													(bn_mmhc_arcs_mat[,i] == 1) &
													(arcs[,i] == bn_mmhc_arcs_mat[,i])))
				
	C_M_WO_WC_mat[3,2] = C_M_WO_WC_mat[3,2] + abs(
											sum((arcs[,i] == 1) &
													(bn_mmhc_arcs_mat[,i] == 0) &
													(arcs[,i] != bn_mmhc_arcs_mat[,i])) -
											sum((arcs[,i] == 1) &
													(bn_mmhc_arcs_mat[i,] == 1) &
													(arcs[,i] == bn_mmhc_arcs_mat[i,])))

	C_M_WO_WC_mat[3,3] = C_M_WO_WC_mat[3,3] + abs(
											abs(sum((arcs[,i] == 1) &
													(bn_mmhc_arcs_mat[i,] == 1) &
													(arcs[,i] == bn_mmhc_arcs_mat[i,]))))
				
	C_M_WO_WC_mat[3,4] = C_M_WO_WC_mat[3,4] + abs(
											sum((arcs[,i] == 0) &
													(bn_mmhc_arcs_mat[,i] == 1) &
													(arcs[,i] != bn_mmhc_arcs_mat[,i])) -
											sum((arcs[i,] == 0) &
													(bn_mmhc_arcs_mat[i,] == 1) &
													(arcs[i,] != bn_mmhc_arcs_mat[i,])))
													
	# RSMAX2
	C_M_WO_WC_mat[4,1] = C_M_WO_WC_mat[4,1] + abs(
											sum((arcs[,i] == 1) &
													(bn_rsmax2_arcs_mat[,i] == 1) &
													(arcs[,i] == bn_rsmax2_arcs_mat[,i])))
				
	C_M_WO_WC_mat[4,2] = C_M_WO_WC_mat[4,2] + abs(
											sum((arcs[,i] == 1) &
													(bn_rsmax2_arcs_mat[,i] == 0) &
													(arcs[,i] != bn_rsmax2_arcs_mat[,i])) -
											sum((arcs[,i] == 1) &
													(bn_rsmax2_arcs_mat[i,] == 1) &
													(arcs[,i] == bn_rsmax2_arcs_mat[i,])))
				
	C_M_WO_WC_mat[4,3] = C_M_WO_WC_mat[4,3] + abs(
											sum((arcs[,i] == 1) &
													(bn_rsmax2_arcs_mat[i,] == 1) &
													(arcs[,i] == bn_rsmax2_arcs_mat[i,])))
				
	C_M_WO_WC_mat[4,4] = C_M_WO_WC_mat[4,4] + abs(
											sum((arcs[,i] == 0) &
													(bn_rsmax2_arcs_mat[,i] == 1) &
													(arcs[,i] != bn_rsmax2_arcs_mat[,i])) -
											sum((arcs[i,] == 0) &
													(bn_rsmax2_arcs_mat[i,] == 1) &
													(arcs[i,] != bn_rsmax2_arcs_mat[i,])))
}

C_M_WO_WC_mat


			
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



