\name{make_topology}
\alias{make_topology}

\title{
	Bayesian Networks with varying topologies
}

\description{
	Bayesian Networks with varying topologies (DAGs) with number of nodes.
}

\usage{
	make_topology(nodes, topology = "Collapse", input_Probs = NULL, node_names = NULL, cardinalities = NULL)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nodes}{ The number of nodes. }
  \item{topology}{ Geometric characteristic. }
  \item{input_Probs}{ The conditional probabilities. }
  \item{node_names}{ The names of each nodes. }
  \item{cardinalities}{ The cardinalities of each nodes. }
}

\details{
	The volume of the manifold is a geometric characteristic associated with the topology of Bayesian network. Each BN produces a different magnitude of the volume based on the DAG of Bayesian network.
	Collapse, Line, Star, PseudoLoop, Diamond, Rhombus.
}

\value{
}

\references{
	Eitel J. M. L., (2008), An Information-geometric approach to learning Bayesian network topologies from data, Innovations in Bayesian Networks Studies in Computational Intelligence, Vol. 156, 187-217.
}

\author{ Jae-seong Yoo <praster1@gmail.com> }

\note{
}

\seealso{
	See demo(topology).
}

\examples{
}

\keyword{ }
