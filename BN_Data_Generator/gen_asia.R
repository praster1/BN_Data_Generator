# Written by Jae-seong Yoo 20141101

# Asia
arcs = rbind(
		#	A	S	T	L	B	E	X	D
		c(0,	0,	1,	0,	0,	0,	0,	0),	#A
		c(0,	0,	0,	1,	1,	0,	0,	0),	#S
		c(0,	0,	0,	0,	0,	1,	0,	0),	#T
		c(0,	0,	0,	0,	0,	1,	0,	0),	#L
		c(0,	0,	0,	0,	0,	0,	0,	1),	#B
		c(0,	0,	0,	0,	0,	0,	1,	1),	#E
		c(0,	0,	0,	0,	0,	0,	0,	0),	#X
		c(0,	0,	0,	0,	0,	0,	0,	0)	#D
		)
arc_name = c("A", "S", "T", "L", "B", "E", "X", "D")
dimnames(arcs)[[1]] = arc_name
dimnames(arcs)[[2]] = arc_name

Probs = list(
	c(0.01),						# P(A)
	c(0.5), 						# P(S)
	c(0.05, 0.01),				# P(T|A), P(T|~A)
	c(0.1, 0.01),				# P(L|S), P(L|~S)
	c(0.6, 0.3),				# P(B|S), P(B|~S)
	c(1, 1, 1, 0),				# P(E|T,L), P(E|~T,L), P(E|T,~L), P(E|~T,~L)
	c(0.98, 0.05),				# P(X|E), P(X|~E)
	c(0.9, 0.7, 0.8, 0.1)		# P(D|B,E), P(D|~B,E), P(D|B,~E), P(D|~B,~E)
)




