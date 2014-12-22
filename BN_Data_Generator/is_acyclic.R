is_acyclic = function (amat) 
{
	
	transClos = function (amat) 
	{
		if (nrow(amat) == 1) 
			return(amat)
		A = amat
		diag(A) = 1
		repeat {
			B = sign(A %*% A)
			if (all(B == A)) 
				break
			else A = B
		}
		diag(A) = 0
		A
	}

	B = transClos(amat)
	l = B[lower.tri(B)]
	u = t(B)[lower.tri(t(B))]
	com = (l & u)
	return(all(!com))
}