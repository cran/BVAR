#' BVAR: Hierarchical Bayesian vector autoregression
#'
#' Estimation of hierarchical Bayesian vector autoregressive models following
#' Kuschnig & Vashold (2021).
#' Implements hierarchical prior selection for conjugate priors in the fashion
#' of Giannone, Lenza & Primiceri (2015) <doi:10.1162/REST_a_00483>. Functions
#' to compute and identify impulse responses, calculate forecasts,
#' forecast error variance decompositions and scenarios are available.
#' Several methods to print, plot and summarise results facilitate analysis.
#'
#' @docType package
#'
#' @name BVAR-package
#'
#' @references
#'   Giannone, D. and Lenza, M. and Primiceri, G. E. (2015) Prior Selection for
#'   Vector Autoregressions. \emph{The Review of Economics and Statistics},
#'   \bold{97:2}, 436-451, \doi{10.1162/REST_a_00483}.
#'
#'   Kuschnig, N. and Vashold, L. (2021) BVAR: Bayesian Vector Autoregressions
#'   with Hierarchical Prior Selection in R.
#'   \emph{Journal of Statistical Software}, \bold{14}, 1-27,
#'   \doi{10.18637/jss.v100.i14}.
#'
"_PACKAGE"
