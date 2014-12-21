# Written by Jae-seong Yoo 20141221

real_lizards = function(n, rep=T)
{
	packages = c("bnlearn")
	if (length(setdiff(packages, rownames(installed.packages()))) > 0)
	{
		install.packages(setdiff(packages, rownames(installed.packages())))  
	}
	
	
	data(lizards, package = "bnlearn")
	data = lizards[sample(c(1:409), n, rep=rep),]

	res = empty.graph(names(lizards))
	modelstring(res) = "[Species][Diameter|Species][Height|Species]"
	  
	arcs = fromto_to_mat(temp$res$arcs, dimnames(temp$data)[[2]])
	  
	result = list(	arcs_mat = arcs,
						node_names = dimnames(data)[[2]],
						data = data,
						res = res)
						
	return(result)
}