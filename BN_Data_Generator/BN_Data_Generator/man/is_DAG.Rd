\name{is_DAG}
\alias{is_DAG}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}

\description{
	This function tests whether the given graph is a DAG, a directed acyclic graph.
}

\usage{
	is_DAG(arcs_mat)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arcs_mat}{ A matrix that determines the arcs. }
}

\details{
	is_dag checks whether there is a directed cycle in the graph. If not, the graph is a DAG.
}
\value{
	A logical vector of length one.
}

\references{
%% ~put references to the literature/web site here ~
}

\author{
%%  ~~who you are~~
}

\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
	\code{\link{is_acyclic}}
}

\examples{

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
