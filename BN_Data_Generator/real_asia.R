require(bnlearn)
data(asia)

if (n >= 5000)
{
	data = asia[sample(c(1:5000), n, rep=T),]
} else {
	data = asia[sample(c(1:5000), n),]
}

res = empty.graph(names(asia))
modelstring(res) = "[A][S][T|A][L|S][B|S][D|B:E][E|T:L][X|E]"

nodes = dim(data)[2]
arcs_mat = matrix(0, nodes, nodes)

arc_name = names(data)
arcs_order_mat = cbind(arc_name, c(1:length(arc_name)))
arcs = cbind(match(res$arc[,1], arcs_order_mat), match(res$arc[,2], arcs_order_mat))


if (length(arcs) > 0)
{
	for (i in 1:dim(arcs)[1])
	{
		from = as.numeric(arcs[i,1])
		to = as.numeric(arcs[i,2])
		arcs_mat[from, to] = arcs_mat[from, to] + 1
	}
}


arcs = arcs_mat