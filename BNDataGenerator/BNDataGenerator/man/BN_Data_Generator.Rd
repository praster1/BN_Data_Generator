\name{BN_Data_Generator}
\alias{BN_Data_Generator}

\title{
	Data Generator based on Bayesian Network Model
}

\description{
	Data Generator based on Bayesian Network Model
}

\usage{
	BN_Data_Generator(arcs_mat, Probs, n, nodename=NULL, cardinality=NULL)
}

\arguments{
  \item{arcs_mat}{ A matrix that determines the arcs.}
  \item{Probs}{ The conditional probabilities. }
  \item{n}{ Data size. }
  \item{nodename}{ The names of each nodes. }
  \item{cardinality}{ The cardinality of each nodes. }
}

\references{
	Jae-seong Yoo, (2014), "A Study on Comparison of Bayesian Network Structure Learning Algorithms for Selecting Appropriate Models", M.S. thesis, Department of Statistics, Korea University, Seoul.
}

\author{ Jae-seong Yoo <praster1@gmail.com> }

\seealso{
	See demo(gen_asia) or demo(topology).
}

\keyword{ Bayesian Network }