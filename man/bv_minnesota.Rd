% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/41_minnesota.R
\name{bv_minnesota}
\alias{bv_minnesota}
\alias{bv_mn}
\alias{bv_lambda}
\alias{bv_alpha}
\alias{bv_psi}
\title{Minnesota prior settings}
\usage{
bv_minnesota(lambda = bv_lambda(mode = 0.2, sd = 0.4, min = 0.0001, max =
  5), alpha = bv_alpha(2, 0.25, 1, 3), psi = bv_psi(0.004, 0.004,
  "auto"), var = 10000000, b = "auto")

bv_mn(lambda = bv_lambda(mode = 0.2, sd = 0.4, min = 0.0001, max = 5),
  alpha = bv_alpha(2, 0.25, 1, 3), psi = bv_psi(0.004, 0.004, "auto"),
  var = 10000000, b = "auto")

bv_lambda(mode = 0.2, sd = 0.4, min = 0.0001, max = 5)

bv_alpha(mode = 2, sd = 0.25, min = 1, max = 3)

bv_psi(scale = 0.004, shape = 0.004, mode = "auto", min = "auto",
  max = "auto")
}
\arguments{
\item{lambda}{List constructed via \code{\link{bv_lambda}}.
Arguments are \emph{mode}, \emph{sd}, \emph{min} and \emph{max}.
May also be provided as a mumeric vector of length 4.
See the Details section for further information.}

\item{alpha}{List constructed via \code{\link{bv_alpha}}.
Arguments are \emph{mode}, \emph{min} and \emph{max}. High values for
\emph{mode} may affect invertibility of the augmented data matrix.
May also be provided as a mumeric vector of length 4.
See the Details section for further information.}

\item{psi}{List with elements \emph{scale}, \emph{shape} of the prior
as well as \emph{mode} and optionally \emph{min} and \emph{max}. The length
of these needs to match the number of variables (i.e. columns) in the data.
By default \emph{mode} is set automatically to the squareroot of the
innovations variance after fitting an \eqn{AR(p)} model to the data. By
default \emph{min} / \emph{max} are set to \emph{mode} divided / multiplied
by \eqn{100}.
See the Details section for further information.}

\item{var}{Numeric scalar with the prior variance on the model's constant.}

\item{b}{Numeric matrix with the prior mean.}

\item{mode}{Numeric scalar (/vector). Mode (or the like) of the parameter.}

\item{sd}{Numeric scalar with the standard deviation.}

\item{min}{Numeric scalar (/vector). Minimum allowed value.}

\item{max}{Numeric scalar (/vector). Maximum allowed value.}

\item{scale, shape}{Numeric scalar. Scale and shape parameters of a Gamma
distribution.}
}
\value{
Returns a list of class \code{bv_minnesota} with options for
\code{\link{bvar}}.
}
\description{
Provide settings for the Minnesota prior to \code{\link{bv_priors}}. See the
Details section for further information.
}
\details{
Essentially this prior imposes the hypothesis, that the individual variables
all follow random walk processes. This parsimonious specification typically
performs well in forecasts of macroeconomic time series and is often used
as a benchmark for evaluating accuracy (Kilian and Lütkepohl, 2017).
The key parameter is \eqn{\lambda} (\emph{lambda}), which controls the
tightness of the prior. The parameter \eqn{\alpha} (\emph{alpha}) governs
variance decay with increasing lag order, while \eqn{\psi} (\emph{psi}
controls the prior's standard deviation on lags of variables other than
the dependent.
The Minnesota prior is often refined with additional priors, trying to
minimise the importance of conditioning on initial observations. See
\code{\link{bv_dummy}} for more information on such priors.
}
\examples{
# Adjust alpha and the Minnesota prior variance.
bv_mn(
  alpha = bv_alpha(mode = 0.5, sd = 1, min = 1e-12, max = 10),
  var = 1e6
)
# Optionally use a vector as shorthand
bv_mn(alpha = c(0.5, 1, 1e-12, 10), var = 1e6)

# Only adjust lambda's standard deviation
bv_mn(lambda = bv_lambda(sd = 2))
}
\references{
Kilian L, Lütkepohl H (2017). Structural Vector Autoregressive Analysis. Cambridge University Press.
}
\seealso{
\code{\link{bv_priors}}; \code{\link{bv_dummy}}
}