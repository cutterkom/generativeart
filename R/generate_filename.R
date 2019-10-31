#' Generate filenames
#'
#' This function creates file names dynamically. The file name depends on date, time and specific seed.
#' @param seed a numeric input generated with create_seeds()
#' @param file_name filetype of the final image. Default is `png`, for other options see the `devics` argument in `gggplot::gsave()`
#' @return character vector, example: "2018-10-02-20-22_seed_22.png"
#' @seealso \code{\link{generate_seeds}} where the seed input is randomly generated
#' @keywords cats
#' @export
#' @examples
#' generate_filename(0104)

generate_filename <- function(seed, filetype) {
  file_name <- paste0(format(Sys.time(), "%Y-%m-%d-%H-%M"), "_seed_", seed, ".", filetype)
}
