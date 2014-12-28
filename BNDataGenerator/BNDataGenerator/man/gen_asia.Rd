\name{gen_asia}
\alias{gen_asia}

\title{
	Asia (synthetic) data based on a model set by Lauritzen and Spiegelhalter
}

\description{
	Small synthetic data set from Lauritzen and Spiegelhalter (1988) about lung diseases (tuberculosis, lung cancer or bronchitis) and visits to Asia.
}

\usage{
	gen_asia()
}

\value{
	\item{D (dyspnoea)}{A two-level factor with levels yes and no.}
	\item{T (tuberculosis)}{A two-level factor with levels yes and no.}
	\item{L (lung cancer)}{A two-level factor with levels yes and no.}
	\item{B (bronchitis)}{A two-level factor with levels yes and no.}
	\item{A (visit to Asia)}{A two-level factor with levels yes and no.}
	\item{S (smoking)}{A two-level factor with levels yes and no.}
	\item{X (chest X-ray)}{A two-level factor with levels yes and no.}
	\item{E (tuberculosis versus lung cancer/bronchitis)}{A two-level factor with levels yes and no.}
}

\references{
	Lauritzen S, Spiegelhalter D (1988). "Local Computation with Probabilities on Graphical Structures and their Application to Expert Systems (with discussion)". Journal of the Royal Statistical Society: Series B (Statistical Methodology), 50(2), 157-224.
}

\author{ Jae-seong Yoo <praster1@gmail.com> }

\note{
	Lauritzen and Spiegelhalter (1988) motivate this example as follows:
	Shortness-of-breath (dyspnoea) may be due to tuberculosis, lung cancer or bronchitis, or none of them, or more than one of them. A recent visit to Asia increases the chances of tuberculosis, while smoking is known to be a risk factor for both lung cancer and bronchitis. The results of a single chest X-ray do not discriminate between lung cancer and tuberculosis, as neither does the presence or absence of dyspnoea.
	Standard learning algorithms are not able to recover the true structure of the network because of the presence of a node (E) with conditional probabilities equal to both 0 and 1. Monte Carlo tests seems to behave better than their parametric counterparts.
}

\seealso{
	See demo(gen_asia).
}