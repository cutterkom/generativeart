#' Recreate an image
#'
#' This is the main function to recreate a previous generated image. It takes all relevant information from the log file to get exactly the same result. By using the same formula and the same seed you get the same randon numbers.
#' @param seed_to_recreate the seed of the original image that either put in as a numeric value or vector from "get_seed_from_logfile()"
#' @param polar logical should the plot have a polar coordinate system ("polar = TRUE") or a cartesian coordinate system ("polar = FALSE")
#' @param filetype set the file type for the image
#' @return an image as png
#' @seealso \code{\link{get_formula_from_logfile}} get the formula for recreation
#' @seealso \code{\link{get_seed_from_logfile}} get the seed, which is used as input
#' @export
#' @examples
#' regenerate_img(0104, polar = FALSE)
#' @importFrom purrr map

regenerate_img <- function(seed_to_recreate, filetype = "png", polar = FALSE) {
  formula <- get_formula_from_logfile(seed_to_recreate, filetype)
  seeds <- get_seed_from_logfile(seed_to_recreate)
  purrr::map(seeds, function(seed){
    set.seed(seed)
    file_name <- generate_filename(seed, filetype)
    logfile <- check_logfile_existence()
    logfile <- generate_logfile_entry(logfile, formula, seed, file_name)
    df <- generate_data(formula)
    plot <- generate_plot(df, file_name, polar, filetype)
  })
}
