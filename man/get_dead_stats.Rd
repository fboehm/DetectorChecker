% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis.R
\name{get_dead_stats}
\alias{get_dead_stats}
\title{Generate summary of damaged pixels and add as a dead_stats attribute to the detector object}
\usage{
get_dead_stats(detector)
}
\arguments{
\item{detector}{Detector object}
}
\value{
Detector object with dead_stats attribute
}
\description{
Generate summary of damaged pixels and add as a dead_stats attribute to the detector object
}
\examples{
# Create a detector
detector_pilatus <- create_detector("Pilatus")
# Load a pixel matrix
file_path <-  system.file("extdata", "Pilatus", "badpixel_mask.tif",
                         package ="detectorchecker")
detector_pilatus <- load_pix_matrix(
 detector = detector_pilatus, file_path = file_path)
# Calculate dead_stats
detector_pilatus <- get_dead_stats(detector_pilatus)
# Print dead stats
print(detector_pilatus$dead_stats)
}
