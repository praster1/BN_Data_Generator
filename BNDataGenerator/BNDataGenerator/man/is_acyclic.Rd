\name{is_acyclic}
\alias{is_acyclic}

\title{
	Acyclic graphs
}

\description{
	This function checks for each node in a DAG whether backtracing arcs leading to it results in an "infinite recursion" error indicating that there actually is a cyclic part in the DAG (which then obviously seems not to be a DAG).
}

\usage{
	is_acyclic(arcs_mat)
}

\arguments{
  \item{arcs_mat}{ A matrix that determines the arcs. }
}

\details{
}

\value{
	A list with two elements. acyclic is a boolean indicating whether the DAG is acyclic (=TRUE) or contains a cyclic component (=FALSE). nodewise is a vector containing 1 boolean per node in the DAG, TRUE indicating that backtracing from this node does not lead to a cyclic component, FALSE indicating that backtracing from this node leads to a cyclic component.
}

\references{
}

\author{ Jae-seong Yoo <praster1@gmail.com> }

\note{
}

\seealso{
	\code{\link{is_DAG}}
}

\examples{
}

\keyword{ }
