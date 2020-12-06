#' Get a formula from the logfile
#'
#' Extracts the formula of an image from the log file in order to be able to recreate the image.
#' @param seed_to_recreate the seed of the original image that either put in as a numeric value or vector from "get_seed_from_logfile()"
#' @param filetype set the file type for the image
#' @return a list containing the formula
#' @seealso \code{\link{get_seed_from_logfile}} get the seed, which is used as input
#' @seealso \code{\link{regenerate_img}} function to recreate an image
#' @export
#' @examples
#' get_formula_from_logfile(0104)
#' @importFrom magrittr %>%
#' @importFrom dplyr filter

# recreate images with formula and seed from logfile

get_formula_from_logfile <- function (seed_to_recreate, filetype) {
  file_name <- generate_filename(seed_to_recreate, filetype)
  logfile_tmp <- check_logfile_existence()
  logfile_tmp <- logfile_tmp %>% dplyr::filter(seed == seed_to_recreate)
  formula <- list(
    x = parse(text = dplyr::pull(logfile_tmp, formula_x))[[1]],
    y = parse(text = dplyr::pull(logfile_tmp, formula_y))[[1]])
}
