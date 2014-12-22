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
make_topology(nodes, topology = "Collapse", input_Probs = NULL, node_names = NULL, cardinalities = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nodes}{
%%     ~~Describe \code{nodes} here~~
}
  \item{topology}{
%%     ~~Describe \code{topology} here~~
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
function (nodes, topology = "Collapse", input_Probs = NULL, node_names = NULL, 
    cardinalities = NULL) 
{
    NeedMoreNodes = function(nodes) {
        if (nodes < nodes) 
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
    checker = check_cardinalities(arcs_mat = arcs_mat, node_names = node_names, 
        cardinalities = cardinalities)
    cardinalities = checker$cardinalities
    num_of_probs = checker$num_of_probs
    node_names = checker$node_names
    if (is.null(input_Probs) & is.null(cardinalities)) {
        input_Probs = list()
        switch(topology, Collapse = {
            for (i in 1:(nodes - 1)) {
                input_Probs[[i]] = runif(1)
            }
            input_Probs[[nodes]] = runif(2^(nodes - 1))
        }, Line = {
            input_Probs[[1]] = runif(1)
            for (i in 2:nodes) {
                input_Probs[[i]] = runif(2)
            }
        }, Star = {
            input_Probs[[1]] = runif(1)
            for (i in 2:nodes) {
                input_Probs[[i]] = runif(2)
            }
        }, PseudoLoop = {
            input_Probs[[1]] = runif(1)
            for (i in 2:(nodes - 1)) {
                input_Probs[[i]] = runif(2)
            }
            input_Probs[[nodes]] = runif(4)
        }, Diamond = {
            input_Probs[[1]] = runif(1)
            for (i in 2:(nodes - 1)) {
                input_Probs[[i]] = runif(2)
            }
            input_Probs[[nodes]] = runif(2^(nodes - 2))
        }, Rhombus = {
            input_Probs[[1]] = runif(1)
            input_Probs[[2]] = runif(1)
            for (i in 3:nodes) {
                input_Probs[[i]] = runif(2^2)
            }
        }, )
    }
    else if (is.null(input_Probs)) {
        input_Probs = list()
        for (i in 1:length(num_of_probs)) {
            input_Probs[[i]] = runif(num_of_probs[i])
        }
    }
    result = list(arcs_mat = arcs_mat, Probs = input_Probs, node_names = node_names, 
        cardinalities = cardinalities, num_of_nodes = nodes)
    return(result)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
