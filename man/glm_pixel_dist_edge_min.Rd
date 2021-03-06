% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis.R
\name{glm_pixel_dist_edge_min}
\alias{glm_pixel_dist_edge_min}
\title{Predict dead pixels from pixel distances to the nearest sub-panel edge}
\usage{
glm_pixel_dist_edge_min(detector)
}
\arguments{
\item{detector}{Detector object}
}
\value{
Fitted model
}
\description{
Fit a logistic regression model using \code{glm}.
Predict dead pixels from pixel distances to the nearest sub-panel edge
}
\examples{
# Create a detector
detector_pilatus <- create_detector("Pilatus")
# Load a pixel matrix
file_path <-  system.file("extdata", "Pilatus", "badpixel_mask.tif",
                         package ="detectorchecker")
detector_pilatus <- load_pix_matrix(
 detector = detector_pilatus, file_path = file_path)
# Fit logistic regression model
glm_pixel_dist_edge_min(detector_pilatus)
}
