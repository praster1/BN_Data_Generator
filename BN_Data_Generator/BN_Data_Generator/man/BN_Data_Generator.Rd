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
BN_Data_Generator(arcs, input_Probs, n, node_names = NULL, cardinalities = NULL)
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
function (arcs, input_Probs, n, node_names = NULL, cardinalities = NULL) 
{
    if (n <= 0) {
        stop("Sample size 'n' must be greater than 0.")
    }
    if (n < 10000) {
        temp_n = 1000
    }
    else {
        temp_n = n
    }
    num_of_nodes = dim(arcs)[1]
    result_mat = matrix(0, temp_n, num_of_nodes)
    dimnames(result_mat)[[2]] = node_names
    checker = check_cardinalities(arcs = arcs, node_names = node_names, 
        cardinalities = cardinalities)
    cardinalities = checker$cardinalities
    node_names = checker$node_names
    list_parent_nodes = checker$list_parent_nodes
    num_of_probs = checker$num_of_probs
    num_of_parent_nodes = checker$num_of_parent_nodes
    num_of_root_nodes = checker$num_of_root_nodes
    input_prob_len = length(input_Probs)
    for (i in 1:input_prob_len) {
        if (as.numeric(length(input_Probs[[i]])) != as.numeric(num_of_probs[i])) {
            stop("Input Probs != num_of_probs!")
        }
    }
    for (i in 1:num_of_root_nodes) {
        p = input_Probs[[i]]
        mat_values = merge("Value", c(1:cardinalities[i]))
        mat_values = paste(mat_values[, 1], mat_values[, 2], 
            sep = "")
        result_mat[, i] = sample(mat_values, temp_n, prob = c(p, 
            1 - sum(p)), rep = T)
    }
    init = num_of_root_nodes + 1
    mat = NULL
    for (i in init:num_of_nodes) {
        p = input_Probs[[i]]
        temp_list_of_pn = as.numeric(list_parent_nodes[[i]])
        num_of_c_cases = prod(cardinalities[temp_list_of_pn])
        temp_cases = list()
        cases = NULL
        for (j in 1:length(temp_list_of_pn)) {
            temp_cases[[j]] = toss_value(1, cardinalities[temp_list_of_pn[j]])
            if (is.null(cases)) {
                cases = temp_cases[[j]]
                names(cases) = 1
            }
            else {
                cases = merge(cases, temp_cases[[j]])
                names(cases) = c(1:dim(cases)[2])
            }
        }
        cases = as.matrix(cases)
        mat_values = merge("Value", c(1:cardinalities[i]))
        mat_values = sort(paste(mat_values[, 1], mat_values[, 
            2], sep = ""))
        stack = 1
        for (j in 1:dim(cases)[1]) {
            mat = t(t(as.matrix(result_mat[, temp_list_of_pn])) == 
                cases[j, ])
            mat = (apply(mat, 1, sum) == dim(mat)[2])
            if (cardinalities[i] == 2) {
                temp_p = p[j]
            }
            else {
                temp_p = p[stack:(stack + cardinalities[i] - 
                  2)]
            }
            len = length(which(mat))
            result_mat[which(mat), i] = sample(mat_values, len, 
                prob = c(temp_p, 1 - sum(temp_p)), rep = T)
            stack = stack + (cardinalities[i] - 1)
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
