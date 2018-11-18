#' Get one or several seeds from the logfile
#'
#' @param seed_to_recreate the seed of the original image that either put in as a numeric value or vector from "get_seed_from_logfile()"
#' @return a vector
#' @seealso \code{\link{get_formula_from_logfile}} get the formula for recreation
#' @seealso \code{\link{regenerate_img}} function to recreate an image
#' @export
#' @examples
#' get_seed_from_logfile(0104)
#' @importFrom magrittr %>%
#' @importFrom dplyr filter
#' @importFrom dplyr pull

get_seed_from_logfile <- function(seed_to_recreate) {
  logfile_tmp <- check_logfile_existence()
  seeds <- logfile_tmp %>% dplyr::filter(seed == seed_to_recreate) %>% dplyr::pull(seed) %>% unique(.)
}
