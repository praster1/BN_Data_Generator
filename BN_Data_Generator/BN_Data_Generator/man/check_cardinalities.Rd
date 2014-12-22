\name{check_cardinalities}
\alias{check_cardinalities}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
check_cardinalities(arcs, node_names = NULL, cardinalities = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arcs}{
%%     ~~Describe \code{arcs} here~~
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
function (arcs, node_names = NULL, cardinalities = NULL) 
{
    check_dag_arcs = as.matrix(arcs)
    if (is_DAG(check_dag_arcs) == FALSE) {
        stop("arcs must a DAG")
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
    for (m in 1:num_of_nodes) {
        if (length(which(arcs[, m] == 1)) == 0) {
            list_parent_nodes[[m]] = NULL
        }
        else {
            list_parent_nodes[[m]] = which(arcs[, m] == 1)
        }
    }
    num_of_root_nodes = sum(num_of_parent_nodes == 0)
    num_of_probs = NULL
    for (k in 1:num_of_nodes) {
        num_of_probs[k] = (cardinalities[k] - 1) * prod(cardinalities[list_parent_nodes[[k]]])
    }
    text_of_probs = list()
    for (i in 1:length(num_of_parent_nodes)) {
        temp_text = NULL
        present_cardinality = as.matrix(toss_value(1, cardinalities[i]))
        if (num_of_parent_nodes[i] == 0) {
            for (j in 1:(cardinalities[i] - 1)) {
                temp_text = c(temp_text, paste("P(", node_names[i], 
                  " = ", present_cardinality[j, 1], ")", sep = ""))
            }
        }
        else {
            temp_list_of_pn = as.numeric(list_parent_nodes[[i]])
            for (j in 1:(cardinalities[i] - 1)) {
                temp_cases = list()
                cases = NULL
                for (k in 1:length(temp_list_of_pn)) {
                  temp_cases[[k]] = toss_value(1, cardinalities[temp_list_of_pn[k]])
                  if (is.null(cases)) {
                    cases = temp_cases[[k]]
                    names(cases) = 1
                  }
                  else {
                    cases = merge(cases, temp_cases[[k]])
                    names(cases) = c(1:dim(cases)[2])
                  }
                }
                cases = as.matrix(cases)
                for (k in 1:dim(cases)[1]) {
                  temp_text_conditional = NULL
                  for (m in 1:dim(cases)[2]) {
                    case_value = paste(node_names[temp_list_of_pn[m]], 
                      " = ", cases[k, m], sep = "")
                    if (m == 1) {
                      temp_text_conditional = case_value
                    }
                    else {
                      temp_text_conditional = paste(temp_text_conditional, 
                        paste(", ", case_value), sep = "")
                    }
                  }
                  temp_text = c(temp_text, paste("P(", node_names[i], 
                    " = ", present_cardinality[j, 1], "|", temp_text_conditional, 
                    ")", sep = ""))
                }
            }
        }
        text_of_probs[[i]] = temp_text
    }
    res = list(cardinalities = cardinalities, node_names = node_names, 
        num_of_root_nodes = num_of_root_nodes, num_of_probs = num_of_probs, 
        num_of_parent_nodes = num_of_parent_nodes, list_parent_nodes = list_parent_nodes, 
        list_of_probs = text_of_probs)
    return(res)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
