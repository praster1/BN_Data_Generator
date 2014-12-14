# Written by Jae-seong Yoo 20141101

rm(list = ls())
setwd("D:/Dropbox/__GitHub/BN_Data_Generator/BN_Data_Generator")


package.skeleton(name="BN_Data_Generator",
								code_files=c(	"big_letters.R",
													"BN_Data_Generator.R",
													"C_M_WO_WC.R",
													"fromto_to_mat.R",
													"mat_to_fromto.R",
													"is.acyclic.R",
													"is.DAG.R",
													"make_Collapse.R",
													"make_Diamond.R",
													"make_Line.R",
													"make_PseudoLoop.R",
													"make_Rhombus.R",
													"make_Star.R",
													"real_alarm.R",
													"real_asia.R",
													"real_hailfinder.R",
													"real_insurance.R",
													"toss_value.R"
								))



require(tools)
Rd = parse_Rd("D:/Dropbox/__GitHub/BN_Data_Generator/BN_Data_Generator/BN_Data_Generator/man/BN_Data_Generator-package.Rd", verbose=TRUE)


##### run at cmd
R CMD Rd2pdf BN_Data_Generator-package.Rd