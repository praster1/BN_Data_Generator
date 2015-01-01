\name{gen_asia}
\alias{gen_asia}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
gen_asia()
}
%- maybe also 'usage' for other objects documented here.
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
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function () 
{
    arcs_mat = rbind(c(0, 0, 1, 0, 0, 0, 0, 0), c(0, 0, 0, 1, 
        1, 0, 0, 0), c(0, 0, 0, 0, 0, 1, 0, 0), c(0, 0, 0, 0, 
        0, 1, 0, 0), c(0, 0, 0, 0, 0, 0, 0, 1), c(0, 0, 0, 0, 
        0, 0, 1, 1), c(0, 0, 0, 0, 0, 0, 0, 0), c(0, 0, 0, 0, 
        0, 0, 0, 0))
    nodename = c("A", "S", "T", "L", "B", "E", "X", "D")
    dimnames(arcs_mat)[[1]] = nodename
    dimnames(arcs_mat)[[2]] = nodename
    input_Probs = list(c(0.01), c(0.5), c(0.05, 0.01), c(0.1, 
        0.01), c(0.6, 0.3), c(1, 1, 1, 0), c(0.98, 0.05), c(0.9, 
        0.7, 0.8, 0.1))
    num_of_nodes = length(nodename)
    cardinality = rep(2, num_of_nodes)
    result = list(arcs_mat = arcs_mat, Probs = input_Probs, nodename = nodename, 
        cardinality = cardinality, num_of_nodes = num_of_nodes)
    return(result)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
