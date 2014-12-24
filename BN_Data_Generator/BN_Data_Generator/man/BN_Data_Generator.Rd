\name{BN_Data_Generator}
\alias{BN_Data_Generator}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{
	Data Generator based on Bayesian Network Model
}

\description{
	Data Generator based on Bayesian Network Model
}

\usage{
BN_Data_Generator(arcs_mat, input_Probs, n, node_names = NULL, cardinalities = NULL)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arcs_mat}{ A matrix that determines the arcs.}

  \item{input_Probs}{ The conditional probabilities. }
  \item{n}{ Data size. }
  \item{node_names}{ The names of each nodes. }
  \item{cardinalities}{ The cardinalities of each nodes. }
}

\details{
%%  ~~ If necessary, more details than the description above ~~
}

\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}

\references{
	Jae-seong Yoo, (2014), "A Study on Comparison of Bayesian Network Structure Learning Algorithms for Selecting Appropriate Models", M.S. thesis, Department of Statistics, Korea University, Seoul.
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
