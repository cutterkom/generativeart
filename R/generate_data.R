#' Generate data
#'
#' The generative images are based on values in a dataframe. This function creates the data by transforming the base values `seq(-pi, pi)` with a `formula`.
#' @param formula a list that contains formulas for transforming the x- and y-values.
#' @return data frame
#' @seealso \code{\link{generate_plot}} the returned data frame is the input to generate the plot
#' @export
#' @examples
#' \dontrun{
#' generate_data(formula)
#' }
#' # an example for a formula:
#' formula <- list(
#'   x = quote(runif(1, -1, 1) * pi_x^2 -sin(pi_y^2)),
#'   y = quote(runif(1, -1, 1) * pi_y^3-cos(pi_x^2))
#'  )
#' @importFrom dplyr mutate
#' @importFrom magrittr %>%

### create dataframe with starting points and transformed x and y depending on a formula
generate_data <- function(formula) {
  print("generate data")
  df <- seq(from = -pi, to = pi, by = 0.01) %>%
    expand.grid(x_i = ., y_i = .) %>%
    dplyr::mutate(!!!formula)
  return(df)
}
