source("dependent_packages.R", encoding="utf8")



source("is.acyclic.R", encoding="utf8")					# is.acyclic = function (amat) 
source("is.DAG.R", encoding="utf8")						# is.DAG = function (amat) 

source("big_letters.R", encoding="utf8")				# big_letters = function(size)
source("toss_value.R", encoding="utf8")				# tosscoin = function (times, makespace = FALSE)
source("BN_Data_Generator.R", encoding="utf8")	# BN_Data_Generator = function (arcs, input_Probs, n, node_names)

source("make_Collapse.R", encoding="utf8")			# make_Collapse = function(nodes)
source("make_Line.R", encoding="utf8")				# make_Line = function(nodes)
source("make_Star.R", encoding="utf8")				# make_Star = function(nodes)
source("make_PseudoLoop.R", encoding="utf8")	# make_PseudoLoop = function(nodes)
source("make_Diamond.R", encoding="utf8")			# make_Diamond = function(nodes)
source("make_Rhombus.R", encoding="utf8")		# make_Rhombus = function(nodes)

source("C_M_WO_WC.R", encoding="utf8")			# C_M_WO_WC = function(target_arcs_mat, learnt_arcs_mat)
source("fromto_to_mat.R", encoding="utf8")			# fromto_to_mat = function(input_arcs, node_names)
