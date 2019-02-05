\name{negbinirr}
\alias{negbinirr}
\alias{print.negbinirr}
\title{Incidence rate ratios for a negative binomial regression.}
\description{This function estimates a negative binomial regression model and calculates 
the corresponding incidence rate ratios.}
\usage{
negbinirr(formula, data, robust = FALSE, clustervar1 = NULL, 
          clustervar2 = NULL, start = NULL, control = glm.control())
}
\arguments{
  \item{formula}{an object of class ``formula'' (or one that can be coerced to that class).}
  \item{data}{the data frame containing these data. This argument must be used.}
  \item{robust}{if \code{TRUE} the function reports White/robust standard errors.}
  \item{clustervar1}{a character value naming the first cluster on which to adjust the standard errors.}
  \item{clustervar2}{a character value naming the second cluster on which to 
  adjust the standard errors for two-way clustering.}
  \item{start}{starting values for the parameters in the \code{\link[MASS]{glm.nb}} model.}
  \item{control}{see \code{\link[stats]{glm.control}}.}
}
\details{If both \code{robust=TRUE} and \code{!is.null(clustervar1)} the function overrides the \code{robust} 
command and computes clustered standard errors.}
\value{
\item{irr}{a coefficient matrix with columns containing the estimates, 
associated standard errors, test statistics and p-values.}
\item{fit}{the fitted \code{\link[MASS]{glm.nb}} object.}
\item{call}{the matched call.}
}

\seealso{\code{\link{negbinmfx}}, \code{\link[MASS]{glm.nb}}}

\examples{
# simulate some data
set.seed(12345)
n = 1000
x = rnorm(n)
y = rnegbin(n, mu = exp(1 + 0.5 * x), theta = 0.5)

data = data.frame(y,x)

negbinirr(formula=y~x,data=data)
}

