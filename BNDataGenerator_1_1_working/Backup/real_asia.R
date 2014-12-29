# Written by Jae-seong Yoo 20141101


real_asia = function(n, rep=T)
{
	packages = c("bnlearn")
	if (length(setdiff(packages, rownames(installed.packages()))) > 0)
	{
		install.packages(setdiff(packages, rownames(installed.packages())))  
	}
	
	data(asia, package = "bnlearn")
	data = asia[sample(c(1:5000), n, rep=rep),]

	res = empty.graph(names(asia))
	modelstring(res) = "[A][S][T|A][L|S][B|S][D|B:E][E|T:L][X|E]"

	arcs_mat = fromto_to_mat(temp$res$arcs, dimnames(temp$data)[[2]])
	  
	result = list(	arcs_mat = arcs_mat,
						node_names = dimnames(data)[[2]],
						data = data,
						res = res)
						
	return(result)
}