% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/50_fcast_setup.R
\name{bv_fcast}
\alias{bv_fcast}
\title{Forecast settings}
\usage{
bv_fcast(horizon = 12, cond_path = NULL, cond_vars = NULL)
}
\arguments{
\item{horizon}{Integer scalar. Horizon for which to compute forecasts.}

\item{cond_path}{Optional numeric vector or matrix used for conditional
forecasts. Supply variable path(s) on which forecasts are conditioned on.
Unrestricted future realisations should be filled with \code{NA}. Note that
not all variables can be restricted at the same time.}

\item{cond_vars}{Optional character or numeric vector. Used to subset
\emph{cond_path} to specific variable(s) via name or position. Not
needed when \emph{cond_path} is constructed for all variables.}
}
\value{
Returns a named list of class \code{bv_fcast} with options for
\code{\link{bvar}} or \code{\link{predict.bvar}}.
}
\description{
Provide forecast settings to \code{\link{predict.bvar}}. Allows adjusting
the horizon of forecasts, and for setting up conditional forecasts. See the
Details section for further information.
}
\details{
Conditional forecasts are calculated using the algorithm by Waggoner and Zha
(1999). They are set up by imposing a path on selected variables.
}
\examples{
# Set forecast-horizon to 20 time periods for unconditional forecasts
bv_fcast(horizon = 20)

# Define a path for the second variable (in the initial six periods).
bv_fcast(cond_path = c(1, 1, 1, 1, 1, 1), cond_var = 2)

# Constrain the paths of the first and third variables.
paths <- matrix(NA, nrow = 10, ncol = 2)
paths[1:5, 1] <- 1
paths[1:10, 2] <- 2
bv_fcast(cond_path = paths, cond_var = c(1, 3))
}
\references{
Waggoner, D. F., & Zha, T. (1999). Conditional Forecasts in Dynamic
  Multivariate Models. \emph{Review of Economics and Statistics},
  \bold{81:4}, 639-651, \doi{10.1162/003465399558508}.
}
\seealso{
\code{\link{predict.bvar}}; \code{\link{plot.bvar_fcast}}
}
\keyword{BVAR}
\keyword{forecast}
\keyword{settings}
