# Written by Jae-seong Yoo 20141101

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