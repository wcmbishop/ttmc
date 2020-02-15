library(ggplot2)
library(patchwork)
library(jpeg)

plot_poster <- function(img_file, theme_size = 6) {
  img <- jpeg::readJPEG(img_file)
  ggplot() + theme_minimal(theme_size) +
    annotation_custom(grid::rasterGrob(img, interpolate = TRUE),
                      xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf)
}

#' Plot a row of movie posters
#' @param img_files
#' @param theme_size
#'
#' @return ggplot2 image
#' @import ggplot2
#' @export
plot_posters <- function(img_files, theme_size = 6) {
  posters <- purrr::map(img_files, plot_poster, theme_size = theme_size)
  patchwork::wrap_plots(posters, nrow = 1)
}
