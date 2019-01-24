#' Generate seeds
#'
#' This function creates a vector of random numbers between 1 and 10000 that are used to set the seed. Since every images needs its own seed, the number of images you want to create equals the number of seeds.
#' @param nr_of_img a numeric input vector specifiying the number of images that should be generated.
#' @return numeric vector
#' @seealso \code{\link{generate_filenames}} the file names are created based on the seed
#' @export
#' @examples
#' generate_seeds(3) #creates the seeds for three images

generate_seeds <- function(nr_of_img) {
  seeds <- sample(1:10000, nr_of_img)
}
