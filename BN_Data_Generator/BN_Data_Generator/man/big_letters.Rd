\name{big_letters}
\alias{big_letters}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
big_letters(char_size)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{char_size}{
%%     ~~Describe \code{char_size} here~~
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
function (char_size) 
{
    letters_list = list()
    letters_list[[1]] = letters
    while (TRUE) {
        num_of_letters = 0
        len_letters_list = length(letters_list)
        for (i in 1:len_letters_list) {
            num_of_letters = num_of_letters + length(letters_list[[i]])
        }
        if (num_of_letters < char_size) {
            merge_mat = merge(letters, letters_list[[len_letters_list]])
            letters_list[[len_letters_list + 1]] = sort(paste(merge_mat[, 
                1], merge_mat[, 2], sep = ""))
        }
        else {
            break
        }
    }
    result = NULL
    for (i in 1:length(letters_list)) {
        result = c(result, letters_list[[i]])
    }
    result = sort(result)
    return(result[1:char_size])
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
