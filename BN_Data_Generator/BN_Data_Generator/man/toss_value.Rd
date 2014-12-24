\name{toss_value}
\alias{toss_value}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{
%%  ~~function to do ... ~~
}

\description{
	Sets up a sample space for the experiment of tossing a coin repeatedly with the outcomes "H" or "T".
}

\usage{
	toss_value(times, num_of_cases, makespace = FALSE)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{times}{ Number of tosses. }
  \item{num_of_cases}{ Cardinality. }
  \item{makespace}{ Logical. }
}

\details{
%%  ~~ If necessary, more details than the description above ~~
}

\value{
	A data frame, with an equally likely probs column if makespace is TRUE.
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
	toss_value(1, 3)
	toss_value(2, 3)
	toss_value(3, 4, makespace = TRUE)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
