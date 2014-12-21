\name{fromto_to_mat}
\alias{fromto_to_mat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fromto_to_mat(input_arcs, node_names)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{input_arcs}{
%%     ~~Describe \code{input_arcs} here~~
}
  \item{node_names}{
%%     ~~Describe \code{node_names} here~~
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
function (input_arcs, node_names) 
{
    if (dim(input_arcs)[1] == 0) {
        stop("It has not any arc")
    }
    num_of_nodes = length(node_names)
    arcs_mat = matrix(0, num_of_nodes, num_of_nodes)
    arcs_order_mat = cbind(node_names, c(1:length(node_names)))
    temp_arcs = cbind(match(input_arcs[, 1], arcs_order_mat), 
        match(input_arcs[, 2], arcs_order_mat))
    if (length(temp_arcs) > 0) {
        for (i in 1:dim(temp_arcs)[1]) {
            from = as.numeric(temp_arcs[i, 1])
            to = as.numeric(temp_arcs[i, 2])
            arcs_mat[from, to] = arcs_mat[from, to] + 1
        }
    }
    dimnames(arcs_mat)[[1]] = node_names
    dimnames(arcs_mat)[[2]] = node_names
    return(arcs_mat)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
