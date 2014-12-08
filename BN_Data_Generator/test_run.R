# Written by Jae-seong Yoo 20141101

rm(list = ls())
setwd("D:/Dropbox/__GitHub/BN_Data_Generator/BN_Data_Generator")

require(bnlearn)

source("tosscoin.R", encoding="utf8")						# tosscoin = function (times, makespace = FALSE)
source("BN_Data_Generator.R", encoding="utf8")		# BN_Data_Generator = function (arcs, input_Probs, n, node_names)

source("make_Collapse.R", encoding="utf8")				# make_Collapse = function(nodes)
source("make_Line.R", encoding="utf8")					# make_Line = function(nodes)
source("make_Star.R", encoding="utf8")					# make_Star = function(nodes)
source("make_PseudoLoop.R", encoding="utf8")		# make_PseudoLoop = function(nodes)
source("make_Diamond.R", encoding="utf8")				# make_Diamond = function(nodes)
source("make_Rhombus.R", encoding="utf8")			# make_Rhombus = function(nodes)

source("C_M_WO_WC.R", encoding="utf8")				# C_M_WO_WC = function(target_arcs_mat, learnt_arcs_mat)
source("from_to_mat.R", encoding="utf8")					# from_to_mat = function(input_arcs, node_names)



##### Start
# set.seed(1234)
require(bnlearn)


n = 1000

nodes = 10
temp = make_Diamond(nodes)
target_arcs_mat = temp$arcs_mat
node_names = temp$node_names
res = BN_Data_Generator(temp$arcs, temp$Probs, n, temp$node_names)
data = res$data


# source("gen_asia.R")
# res = BN_Data_Generator(arcs, Probs, n, node_names)
# data = res$data


# source("real_asia.R", encoding="utf8")
# source("real_insurance.R", encoding="utf8")
# source("real_alarm.R", encoding="utf8")
# source("real_hailfinder.R", encoding="utf8")
# nodes = dim(data)[2]
# node_names = names(data)
# target_arcs_mat = from_to_mat(res$arcs, node_names)





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


bn_hc_arcs_mat = from_to_mat(bn_hc$arcs, node_names)
bn_tabu_arcs_mat = from_to_mat(bn_tabu$arcs, node_names)
bn_mmhc_arcs_mat = from_to_mat(bn_mmhc$arcs, node_names)
bn_rsmax2_arcs_mat = from_to_mat(bn_rsmax2$arcs, node_names)


## C		# Correct Edges : 실제 네트워크 = 결과 네트워크, 방향 일치
## M		# Missed Edges : 실제 네트워크 존재 O, 결과 네트워크 존재 X
## WO	# Wrongly Oriented Edges : 실제 네트워크 = 결과 네트워크, 방향 반대
## WC	# Wrongly Connected Edges : 실제 네트워크 존재 X, 결과 네트워크 존재 O
C_M_WO_WC_mat = rbind(	C_M_WO_WC(target_arcs_mat, bn_hc_arcs_mat),				# HC
										C_M_WO_WC(target_arcs_mat, bn_tabu_arcs_mat),			# TABU
										C_M_WO_WC(target_arcs_mat, bn_mmhc_arcs_mat),		# MMHC
										C_M_WO_WC(target_arcs_mat, bn_rsmax2_arcs_mat))		# RSMAX2
dimnames(C_M_WO_WC_mat)[[1]] = c("HC", "TABU", "MMHC", "RSMAX2")
dimnames(C_M_WO_WC_mat)[[2]] = c("C", "M", "WO", "WC")
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
