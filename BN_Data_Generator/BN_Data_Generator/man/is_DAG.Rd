\name{is_DAG}
\alias{is_DAG}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
is_DAG(arcs_mat)
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
    unmakeMG = function(arcs_mat) {
        d = nrow(arcs_mat)
        ug = dg = bg = arcs_mat
        M = expand.grid(dg = 0:1, ug = 0:1, bg = 0:1)
        i = strtoi(as.character(arcs_mat), 2)
        GG = M[i + 1, ]
        ug[, ] = GG[, 2]
        dg[, ] = GG[, 1]
        bg[, ] = GG[, 3]
        if (any(ug != t(ug))) 
            stop("Undirected edges are wrongly coded.")
        if (any(bg != t(bg))) 
            stop("Undirected edges are wrongly coded.")
        return(list(dg = dg, ug = ug, bg = bg))
    }
    comp = unmakeMG(arcs_mat)
    ug = comp$ug
    dag = comp$dg
    bg = comp$bg
    out = TRUE
    if (any(arcs_mat > 100)) {
        warning("There are double edges.")
        out = FALSE
    }
    if (!is_acyclic(dag)) {
        warning("Not acyclic.")
        out = FALSE
    }
    return(out)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
