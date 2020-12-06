#' Generate multiple generative images
#'
#' This is the main function of the package generativeimgR. It calls all the other function neccessary to produce multiple generative images at once.
#' @param formula the formula you want to use as a list
#' @param polar logical should the plot have a polar coordinate system ("polar = TRUE") or a cartesian coordinate system ("polar = FALSE")
#' @param nr_of_img the number of images that should be created
#' @param ... further arguments like color and background_color
#' @param filetype filetype of the final image. Default is `png`, for other options see the `devics` argument in `gggplot::gsave()`
#' @return as many png files as you net in "nr_of_img"
#' @seealso \code{\link{generate_seeds}} generate the seeds for the randomness
#' @seealso \code{\link{generate_filename}} generate the file names
#' @seealso \code{\link{check_logfile_existence}} create a log file, if there is none
#' @seealso \code{\link{generate_logfile_entry}} generate the specific entry for the log file
#' @seealso \code{\link{generate_data}} generate the data depending on the formula
#' @seealso \code{\link{generate_plot}} plot the data and save a png file
#' @export
#' @examples
#' generate_img(formula = my_formula, nr_of_img = 3, polar = FALSE)
#' generate_img(formula = my_formula, nr_of_img = 3, polar = FALSE, color = "#101820", background_color = "#F2AA4C")
#' @importFrom purrr map

generate_img <- function(formula, nr_of_img, polar = FALSE, filetype = "png", ...) {
  seeds <- generate_seeds(nr_of_img)
  purrr::map(seeds, function(seed){
    set.seed(seed)
    file_name <- generate_filename(seed, filetype)
    logfile <- check_logfile_existence()
    logfile <- generate_logfile_entry(logfile, formula, seed, file_name)
    df <- generate_data(formula)
    plot <- generate_plot(df, file_name, polar, filetype, ...)
  })
}
