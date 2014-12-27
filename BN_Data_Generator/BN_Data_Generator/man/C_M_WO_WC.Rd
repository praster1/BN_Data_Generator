\name{C_M_WO_WC}
\alias{C_M_WO_WC}

\title{
Correct, Missing, Wrongly Oriented, Wronglyy Corrected Arcs
}

\description{
	The existence of the known network structures allows us to define three important terms which indicate the performance of the algorithm (in terms of the number of graphical errors in the learnt structure).
}

\usage{
	C_M_WO_WC(target_arcs_mat, learnt_arcs_mat)
}

\arguments{
	\item{target_arcs_mat}{ A matrix of known network structure. }
	\item{learnt_arcs_mat}{ A matrix of learnt network structure. }
}

\details{
}

\value{
	\item{C (Correct Arcs)}{Edges present in the original network and in the learnt network structure.}
	\item{M (Missing Arcs)}{Edges present in the original network but not in the learnt network structure.}
	\item{WO (Wrongly Oriented Arcs)}{Edges present in the learnt network structure, but having opposite orientation when compared with the corresponding edge in the original network structure.}
	\item{WC (Wrongly Corrected Arcs)}{Edges not present in the original network but included in the learnt network structure.}
}
	
\references{
	X.-w. Chen, G. Anantha, and X. Wang, (2006), An effective structure learning method for constructing gene networks, Bioinformatics, Vol. 22, 1367-1374.
}

\author{ Jae-seong Yoo <praster1@gmail.com> }

\note{
}

\seealso{
}

\examples{
}

\keyword{ }
