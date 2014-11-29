# Toss Coin
tosscoin = function (times, makespace = FALSE) 
{
	temp <- list()
	for (i in 1:times) {
		temp[[i]] <- c("Y", "N")
	}
	res <- expand.grid(temp, KEEP.OUT.ATTRS = FALSE)
	names(res) <- c(paste(rep("toss", times), 1:times, sep = ""))
	if (makespace) 
		res$probs <- rep(1, 2^times)/2^times
	return(res)
}