% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pixel.R
\name{dist_edge_min}
\alias{dist_edge_min}
\title{Calculate L-infinity distance to module edge}
\usage{
dist_edge_min(detector)
}
\arguments{
\item{detector}{Detector object}
}
\value{
distance matrix
}
\description{
Calculate L-infinity distance to module edge
}
\examples{
# Create a detector
detector_pilatus <- create_detector("Pilatus")
# Calculate L-infinity distance to module edge
dist_edge_min(detector_pilatus)
}
