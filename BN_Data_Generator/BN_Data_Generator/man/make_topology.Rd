\name{make_topology}
\alias{make_topology}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
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
	The volume of the manifold is a geometric characteristic associated with the BN’s topology. Each BN produces a different magnitude of the volume based on the BN’s DAG.
	“Collapse”, “Line”, “Star”, “PseudoLoop”, “Diamond”, “Rhombus”.
}

\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}

\references{
	Eitel J. M. L., (2008), An Information-geometric approach to learning Bayesian network topologies from data, Innovations in Bayesian Networks Studies in Computational Intelligence, Vol. 156, 187-217.
}

\author{
%%  ~~who you are~~
}

\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}

\examples{

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
