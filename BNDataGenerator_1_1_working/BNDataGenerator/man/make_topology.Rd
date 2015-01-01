\name{make_topology}
\alias{make_topology}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
make_topology(nodes, topology, Probs = NULL, nodename = NULL, cardinality = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nodes}{
%%     ~~Describe \code{nodes} here~~
}
  \item{topology}{
%%     ~~Describe \code{topology} here~~
}
  \item{Probs}{
%%     ~~Describe \code{Probs} here~~
}
  \item{nodename}{
%%     ~~Describe \code{nodename} here~~
}
  \item{cardinality}{
%%     ~~Describe \code{cardinality} here~~
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
function (nodes, topology, Probs = NULL, nodename = NULL, cardinality = NULL) 
{
    NeedMoreNodes = function(num_of_nodes) {
        if (nodes < num_of_nodes) 
            stop("Need More Nodes!")
    }
    switch(topology, Collapse = {
        NeedMoreNodes(3)
    }, Line = {
        NeedMoreNodes(3)
    }, Star = {
        NeedMoreNodes(3)
    }, PseudoLoop = {
        NeedMoreNodes(3)
    }, Diamond = {
        NeedMoreNodes(4)
    }, Rhombus = {
        NeedMoreNodes(4)
    }, )
    arcs_mat = matrix(0, nodes, nodes)
    switch(topology, Collapse = {
        arcs_mat[, nodes] = 1
        arcs_mat[nodes, nodes] = 0
    }, Line = {
        for (i in 1:(nodes - 1)) {
            arcs_mat[i, (i + 1)] = 1
        }
    }, Star = {
        arcs_mat[1, ] = 1
        arcs_mat[1, 1] = 0
    }, PseudoLoop = {
        arcs_mat[1, nodes] = 1
        for (i in 1:(nodes - 1)) {
            arcs_mat[i, (i + 1)] = 1
        }
    }, Diamond = {
        arcs_mat[1, ] = 1
        arcs_mat[1, 1] = 0
        arcs_mat[, nodes] = 1
        arcs_mat[1, nodes] = 0
        arcs_mat[nodes, nodes] = 0
    }, Rhombus = {
        arcs_mat[1, ] = 1
        arcs_mat[2, ] = 1
        arcs_mat[(1:2), (1:2)] = 0
        arcs_mat[nodes, nodes] = 0
    }, )
    checker = check_cardinality(arcs_mat = arcs_mat, nodename = nodename, 
        cardinality = cardinality)
    cardinality = checker$cardinality
    num_of_probs = checker$num_of_probs
    nodename = checker$nodename
    if (is.null(Probs) & is.null(cardinality)) {
        Probs = list()
        switch(topology, Collapse = {
            for (i in 1:(nodes - 1)) {
                Probs[[i]] = runif(1)
            }
            Probs[[nodes]] = runif(2^(nodes - 1))
        }, Line = {
            Probs[[1]] = runif(1)
            for (i in 2:nodes) {
                Probs[[i]] = runif(2)
            }
        }, Star = {
            Probs[[1]] = runif(1)
            for (i in 2:nodes) {
                Probs[[i]] = runif(2)
            }
        }, PseudoLoop = {
            Probs[[1]] = runif(1)
            for (i in 2:(nodes - 1)) {
                Probs[[i]] = runif(2)
            }
            Probs[[nodes]] = runif(4)
        }, Diamond = {
            Probs[[1]] = runif(1)
            for (i in 2:(nodes - 1)) {
                Probs[[i]] = runif(2)
            }
            Probs[[nodes]] = runif(2^(nodes - 2))
        }, Rhombus = {
            Probs[[1]] = runif(1)
            Probs[[2]] = runif(1)
            for (i in 3:nodes) {
                Probs[[i]] = runif(2^2)
            }
        }, )
    }
    else if (is.null(Probs)) {
        Probs = list()
        for (i in 1:length(num_of_probs)) {
            Probs[[i]] = runif(num_of_probs[i])
        }
    }
    result = list(arcs_mat = arcs_mat, Probs = Probs, nodename = nodename, 
        cardinality = cardinality, num_of_nodes = nodes)
    return(result)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
