% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis.R
\name{get_ppp_dead}
\alias{get_ppp_dead}
\title{Generates point pattern dataset (ppp) for the dead pixels}
\usage{
get_ppp_dead(detector)
}
\arguments{
\item{detector}{Detector object}
}
\value{
ppp of dead pixels
}
\description{
Uses \code{spatstat::ppp} internally.
Creates an object of class "ppp" representing a point pattern dataset in the two-dimensional plane.
See \href{https://www.rdocumentation.org/packages/spatstat/versions/1.63-3/topics/ppp}{spatstat} docs for details.
}
\examples{
# Create a detector
detector_pilatus <- create_detector("Pilatus")
# Load a pixel matrix
file_path <-  system.file("extdata", "Pilatus", "badpixel_mask.tif",
                         package ="detectorchecker")
detector_pilatus <- load_pix_matrix(
 detector = detector_pilatus, file_path = file_path)
# Create a point pattern dataset from the detector
dead_ppp <- get_ppp_dead(detector_pilatus)
}
