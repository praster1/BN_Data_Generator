\name{make_topology}
\alias{make_topology}

\title{
	Bayesian Networks with varying topologies
}

\description{
	Bayesian Networks with varying topologies (DAGs) with number of nodes.
}

\usage{
	make_topology(nodes, topology, Probs, nodename=NULL, cardinality=NULL)
}

\arguments{
  \item{nodes}{ The number of nodes. }
  \item{topology}{ Geometric characteristic. Collapse, Line, Star, PseudoLoop, Diamond, Rhombus. }
  \item{Probs}{ The conditional probabilities. }
  \item{nodename}{ The names of each nodes. }
  \item{cardinality}{ The cardinality of each nodes. }
}

\details{
	The volume of the manifold is a geometric characteristic associated with the topology of Bayesian network. Each BN produces a different magnitude of the volume based on the DAG of Bayesian network.
	Collapse, Line, Star, PseudoLoop, Diamond, Rhombus.
}

\references{
	Eitel J. M. L., (2008), An Information-geometric approach to learning Bayesian network topologies from data, Innovations in Bayesian Networks Studies in Computational Intelligence, Vol. 156, 187-217.
}

\author{ Jae-seong Yoo <praster1@gmail.com> }

\seealso{
	See demo(topology).
}