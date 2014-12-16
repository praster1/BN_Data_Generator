\name{is.acyclic}
\alias{is.acyclic}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
is.acyclic(amat)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{amat}{
%%     ~~Describe \code{amat} here~~
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
function (amat) 
{
    transClos = function(amat) {
        if (nrow(amat) == 1) 
            return(amat)
        A = amat
        diag(A) = 1
        repeat {
            B = sign(A \%*\% A)
            if (all(B == A)) 
                break
            else A = B
        }
        diag(A) = 0
        A
    }
    B = transClos(amat)
    l = B[lower.tri(B)]
    u = t(B)[lower.tri(t(B))]
    com = (l & u)
    return(all(!com))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
