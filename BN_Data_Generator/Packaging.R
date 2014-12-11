packages <- c("bnlearn")
if (length(setdiff(packages, rownames(installed.packages()))) > 0)
{
  install.packages(setdiff(packages, rownames(installed.packages())))  
}


source("tosscoin.R", encoding="utf8")						# tosscoin = function (times, makespace = FALSE)
source("BN_Data_Generator.R", encoding="utf8")		# BN_Data_Generator = function (arcs, input_Probs, n, node_names)

source("make_Collapse.R", encoding="utf8")				# make_Collapse = function(nodes)
source("make_Line.R", encoding="utf8")					# make_Line = function(nodes)
source("make_Star.R", encoding="utf8")					# make_Star = function(nodes)
source("make_PseudoLoop.R", encoding="utf8")		# make_PseudoLoop = function(nodes)
source("make_Diamond.R", encoding="utf8")				# make_Diamond = function(nodes)
source("make_Rhombus.R", encoding="utf8")			# make_Rhombus = function(nodes)

source("C_M_WO_WC.R", encoding="utf8")				# C_M_WO_WC = function(target_arcs_mat, learnt_arcs_mat)
source("fromto_to_mat.R", encoding="utf8")				# fromto_to_mat = function(input_arcs, node_names)

source("real_asia.R", encoding="utf8")
source("real_insurance.R", encoding="utf8")
source("real_alarm.R", encoding="utf8")
source("real_hailfinder.R", encoding="utf8")