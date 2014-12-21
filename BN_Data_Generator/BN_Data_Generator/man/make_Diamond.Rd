\name{make_Diamond}
\alias{make_Diamond}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
make_Diamond(nodes, input_Probs = NULL, node_names = NULL, cardinalities = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nodes}{
%%     ~~Describe \code{nodes} here~~
}
  \item{input_Probs}{
%%     ~~Describe \code{input_Probs} here~~
}
  \item{node_names}{
%%     ~~Describe \code{node_names} here~~
}
  \item{cardinalities}{
%%     ~~Describe \code{cardinalities} here~~
}
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
function (nodes, input_Probs = NULL, node_names = NULL, cardinalities = NULL) 
{
    if (nodes < 4) {
        stop("Need More Nodes!")
    }
    arcs = matrix(0, nodes, nodes)
    arcs[1, ] = 1
    arcs[1, 1] = 0
    arcs[, nodes] = 1
    arcs[1, nodes] = 0
    arcs[nodes, nodes] = 0
    checker = check_cardinalities(arcs = arcs, node_names = node_names, 
        cardinalities = cardinalities)
    cardinalities = checker$cardinalities
    num_of_probs = checker$num_of_probs
    node_names = checker$node_names
    if (is.null(input_Probs) & is.null(cardinalities)) {
        input_Probs = list()
        input_Probs[[1]] = runif(1)
        for (i in 2:(nodes - 1)) {
            input_Probs[[i]] = runif(2)
        }
        input_Probs[[nodes]] = runif(2^(nodes - 2))
    }
    else if (is.null(input_Probs)) {
        input_Probs = list()
        for (i in 1:length(num_of_probs)) {
            input_Probs[[i]] = runif(num_of_probs[i])
        }
    }
    result = list(arcs_mat = arcs, Probs = input_Probs, node_names = node_names, 
        cardinalities = cardinalities, num_of_nodes = nodes)
    return(result)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
