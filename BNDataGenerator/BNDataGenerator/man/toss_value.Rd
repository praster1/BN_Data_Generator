\name{toss_value}
\alias{toss_value}

\title{
	Tossing a Cardinality
}

\description{
	Sets up a sample space for the experiment of tossing a cardinality repeatedly with the outcomes "Values".
}

\usage{
	toss_value(times, num_of_cases, makespace = FALSE)
}

\arguments{
  \item{times}{ Number of tosses. }
  \item{num_of_cases}{ Cardinality. }
  \item{makespace}{ Logical. }
}

\details{
}

\value{
	A data frame, with an equally likely probs column if makespace is TRUE.
}

\references{
}

\author{ Jae-seong Yoo <praster1@gmail.com> }

\note{
	It developed of 'tosscoin' function in prob package.
}

\seealso{
}

\examples{
	toss_value(1, 3)
	toss_value(2, 3)
	toss_value(3, 4, makespace = TRUE)
}

\keyword{ }
