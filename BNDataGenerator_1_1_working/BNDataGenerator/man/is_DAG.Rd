\name{is_DAG}
\alias{is_DAG}

\title{
	Directed acyclic graphs
}

\description{
	This function tests whether the given graph is a DAG, a directed acyclic graph.
}

\usage{
	is_DAG(arcs_mat)
}

\arguments{
  \item{arcs_mat}{ A matrix that determines the arcs. }
}

\details{
	is_dag checks whether there is a directed cycle in the graph. If not, the graph is a DAG.
}
\value{
	A logical vector of length one.
}

\author{ Jae-seong Yoo <praster1@gmail.com> }

\seealso{
	\code{\link{is_acyclic}}
}