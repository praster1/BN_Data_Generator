# Written by Jae-seong Yoo 20141101

rm(list = ls())
setwd("D:/Dropbox/__GitHub/BN_Data_Generator/BN_Data_Generator")


package.skeleton(name="BN_Data_Generator",
							code_files=c(	"is_acyclic.R",
												"is_DAG.R",
							
												"big_letters.R",
												"toss_value.R",
												"BN_Data_Generator.R",
												"check_cardinalities.R",
												
												"make_topology.R",
												
												"C_M_WO_WC.R",
												"fromto_to_mat.R",
												"mat_to_fromto.R",
												
												"gen_asia.R",
												
												"real_lizards.R",
												"real_alarm.R",
												"real_asia.R",
												"real_hailfinder.R",
												"real_insurance.R"
											)
						)


# Further steps are described in './BN_Data_Generator/Read-and-delete-me'

# * Edit the help file skeletons in 'man', possibly combining help files for multiple functions.
# * Edit the exports in 'NAMESPACE', and add necessary imports.
# * Put any C/C++/Fortran code in 'src'.
# * If you have compiled code, add a useDynLib() directive to 'NAMESPACE'. 
# * Run R CMD build to build the package tarball.
# * Run R CMD check to check the package tarball.

# Read "Writing R Extensions" for more information.



require(tools)
Rd = parse_Rd("D:/Dropbox/__GitHub/BN_Data_Generator/BN_Data_Generator/BN_Data_Generator/man/BN_Data_Generator-package.Rd", verbose=TRUE)


##### run at terminal
setwd("D:/Dropbox/__GitHub/BN_Data_Generator/BN_Data_Generator/BN_Data_Generator/man")
system("R CMD Rd2pdf .")



##### run at terminal
setwd("~/Dropbox/__GitHub/BN_Data_Generator/BN_Data_Generator/BN_Data_Generator/man")
system("R CMD Rd2pdf --no-preview --no-clean .")
