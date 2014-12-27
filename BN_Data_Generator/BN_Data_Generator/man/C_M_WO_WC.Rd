\name{C_M_WO_WC}
\alias{C_M_WO_WC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Correct, Missing, Wrongly Oriented, Wronglyy Corrected Arcs
}
\description{
	The existence of the known network structures allows us to define three important terms which indicate the performance of the algorithm (in terms of the number of graphical errors in the learnt structure).
}
\usage{
	C_M_WO_WC(target_arcs_mat, learnt_arcs_mat)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
	\item{target_arcs_mat}{ A matrix of known network structure. }
	\item{learnt_arcs_mat}{ A matrix of learnt network structure. }
}

\details{
%%  ~~ If necessary, more details than the description above ~~
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
