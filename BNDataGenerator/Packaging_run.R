# Written by Jae-seong Yoo 20141101

rm(list = ls())
setwd("D:/Dropbox/__GitHub/BN_Data_Generator/BNDataGenerator")


package.skeleton(name="BNDataGenerator",
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
												
												"gen_asia.R"
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



##### run at terminal
setwd("D:/Dropbox/__GitHub/BN_Data_Generator/BNDataGenerator/BNDataGenerator/man")
system("R CMD Rd2pdf .")


setwd("D:/Dropbox/__GitHub/BN_Data_Generator/BNDataGenerator")
system("Rcmd check BNDataGenerator")
system("Rcmd build BNDataGenerator")