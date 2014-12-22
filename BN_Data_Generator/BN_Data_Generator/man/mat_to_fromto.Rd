\name{mat_to_fromto}
\alias{mat_to_fromto}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
mat_to_fromto(arcs_mat)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arcs_mat}{
%%     ~~Describe \code{arcs_mat} here~~
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
function (arcs_mat) 
{
    check_dag_arcs = as.matrix(arcs)
    if (is_DAG(check_dag_arcs) == FALSE) {
        stop("arcs must a DAG")
    }
    node_names = dimnames(arcs_mat)[[2]]
    num_of_nodes = length(node_names)
    result_mat = NULL
    for (i in 1:num_of_nodes) {
        where = which(arcs[i, ] == 1)
        len = length(where)
        if (len > 0) {
            for (j in 1:len) {
                temp = c(node_names[i], node_names[where[j]])
                result_mat = rbind(result_mat, temp)
            }
        }
    }
    dimnames(result_mat)[[1]] = NULL
    dimnames(result_mat)[[2]] = c("from", "to")
    return(result_mat)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
