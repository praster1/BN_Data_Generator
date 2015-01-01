\name{C_M_WO_WC}
\alias{C_M_WO_WC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
C_M_WO_WC(target_arcs_mat, learnt_arcs_mat)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{target_arcs_mat}{
%%     ~~Describe \code{target_arcs_mat} here~~
}
  \item{learnt_arcs_mat}{
%%     ~~Describe \code{learnt_arcs_mat} here~~
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
function (target_arcs_mat, learnt_arcs_mat) 
{
    nodes = dim(target_arcs_mat)[2]
    C = 0
    M = 0
    WO = 0
    WC = 0
    for (i in 1:nodes) {
        C = C + abs(sum((target_arcs_mat[, i] == 1) & (learnt_arcs_mat[, 
            i] == 1) & (target_arcs_mat[, i] == learnt_arcs_mat[, 
            i])))
        M = M + abs(sum((target_arcs_mat[, i] == 1) & (learnt_arcs_mat[, 
            i] == 0) & (target_arcs_mat[, i] != learnt_arcs_mat[, 
            i])) - sum((target_arcs_mat[, i] == 1) & (learnt_arcs_mat[i, 
            ] == 1) & (target_arcs_mat[, i] == learnt_arcs_mat[i, 
            ])))
        WO = WO + abs(sum((target_arcs_mat[, i] == 1) & (learnt_arcs_mat[i, 
            ] == 1) & (target_arcs_mat[, i] == learnt_arcs_mat[i, 
            ])))
        WC = WC + abs(sum((target_arcs_mat[, i] == 0) & (learnt_arcs_mat[, 
            i] == 1) & (target_arcs_mat[, i] != learnt_arcs_mat[, 
            i])) - sum((target_arcs_mat[i, ] == 0) & (learnt_arcs_mat[i, 
            ] == 1) & (target_arcs_mat[i, ] != learnt_arcs_mat[i, 
            ])))
    }
    result = t(as.matrix(c(C, M, WO, WC)))
    dimnames(result)[[2]] = c("C", "M", "WO", "WC")
    return(result)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
