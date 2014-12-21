\name{BN_Data_Generator}
\alias{BN_Data_Generator}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
BN_Data_Generator(arcs, input_Probs, n, node_names = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arcs}{
%%     ~~Describe \code{arcs} here~~
}
  \item{input_Probs}{
%%     ~~Describe \code{input_Probs} here~~
}
  \item{n}{
%%     ~~Describe \code{n} here~~
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
function (arcs, input_Probs, n, node_names = NULL) 
{
    check_dag_arcs = as.matrix(arcs)
    if (is.DAG(check_dag_arcs) == FALSE) {
        stop("arcs must a DAG")
    }
    if (n <= 0) {
        stop("Sample size 'n' must be greater than 0.")
    }
    if (n < 1000) {
        temp_n = 1000
    }
    else {
        temp_n = n
    }
    num_of_nodes = dim(arcs)[1]
    if (is.null(node_names)) {
        node_names = big_letters(num_of_nodes)
    }
    if (is.null(cardinalities)) {
        cardinalities = rep(2, num_of_nodes)
    }
    else if (sum(cardinalities < 2) > 0) {
        stop("All cardinality must be at least 2.")
    }
    else if (num_of_nodes != length(cardinalities)) {
        stop("Wrong length of cardinalities")
    }
    num_of_parent_nodes = apply(arcs, 2, sum)
    list_parent_nodes = list()
    for (i in 1:num_of_nodes) {
        if (length(which(arcs[, i] == 1)) == 0) {
            list_parent_nodes[[i]] = NULL
        }
        else {
            list_parent_nodes[[i]] = which(arcs[, i] == 1)
        }
    }
    root_nodes = sum(num_of_parent_nodes == 0)
    result_mat = matrix(0, temp_n, num_of_nodes)
    dimnames(result_mat)[[2]] = node_names
    num_of_probs = t(as.matrix(2^num_of_parent_nodes))
    dimnames(num_of_probs)[[2]] = node_names
    num_of_probs
    input_prob_len = length(input_Probs)
    for (i in 1:input_prob_len) {
        if (length(input_Probs[[i]]) != num_of_probs[i]) {
            stop("Input Probs != num_of_probs!")
        }
    }
    for (i in 1:root_nodes) {
        p = input_Probs[[i]][1]
        mat_values = merge("Value", c(1:cardinalities[i]))
        result_mat[, i] = sample(paste(mat_values[, 1], mat_values[, 
            2], sep = ""), temp_n, prob = c(p, 1 - p), rep = T)
    }
    init = 0
    for (i in 1:length(list_parent_nodes)) {
        if (!is.null(list_parent_nodes[[i]])) {
            init = i
            break
        }
    }
    mat = NULL
    for (i in init:num_of_nodes) {
        for (j in 1:num_of_probs[i]) {
            p = input_Probs[[i]][j]
            mat = t(t(as.matrix(result_mat[, list_parent_nodes[[i]]])) == 
                as.matrix(toss_value(as.numeric(num_of_parent_nodes[i]), 
                  2))[j, ])
            mat = (apply(mat, 1, sum) == as.numeric(num_of_parent_nodes[i]))
            if (sum(mat) > 0) {
                len = sum(mat)
                result_mat[mat, i] = sample(c("Value1", "Value2"), 
                  len, prob = c(p, 1 - p), rep = T)
            }
        }
    }
    if (n < 1000) {
        result_mat = result_mat[sample(c(1:1000), size = n), 
            ]
    }
    res = list(data = data.frame(result_mat), node_names = node_names, 
        num_of_nodes = num_of_nodes, num_of_parent_nodes = num_of_parent_nodes, 
        list_parent_nodes = list_parent_nodes)
    return(res)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
