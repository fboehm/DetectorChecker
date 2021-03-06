context("Testing reading in the dead pixel data and visualizing the detector: Pilatus")
source("utils.R")

test_that("Pilatus", {
  test_dir <- getwd()

  detector_name <- "Pilatus"

  pilatus_detector <- create_detector(detector_name)

  # getting the dead (damaged) pixel data
  dead_path <- system.file("extdata", "Pilatus", "badpixel_mask.tif", package = "detectorchecker")

  # file.path(
  #   test_dir, "dead_pix", "Pilatus",
  #   "badpixel_mask.tif"
  # )

  pilatus_detector <- load_pix_matrix(detector = pilatus_detector, file_path = dead_path)

  # output file
  test_out_path <- "pilatus_damaged.jpg"

  # Visualizing damaged pixels
  plot_pixels(detector = pilatus_detector, file_path = test_out_path)

  expect_file_exists(test_out_path)

})

context("Testing reading in the dead pixel data and visualizing the detector: Perkin Elmer")

test_that("Perkin Elmer", {
  test_dir <- getwd()

  detector_name <- "PerkinElmerFull"

  perkinelmerfull_detector <- create_detector(detector_name)

  # getting the dead (damaged) pixel data
  dead_path <- system.file("extdata", "PerkinElmerFull", "BadPixelMap_t1.bpm.xml", package = "detectorchecker")

  perkinelmerfull_detector <- load_pix_matrix(detector = perkinelmerfull_detector, file_path = dead_path)

  # output file
  test_out_path <- "perkinelmerfull_damaged.pdf"

  # Visualizing damaged pixels
  plot_pixels(detector = perkinelmerfull_detector, file_path = test_out_path)

  # Check whether the file was created
  expect_file_exists(test_out_path)

  # Dead stats
  perkinelmerfull_detector <- get_dead_stats(perkinelmerfull_detector)

  # Plotting counts per module
  test_out_path <- "perkinelmerfull_module_cnt.pdf"
  plot_pixels_count(detector = perkinelmerfull_detector, file_path = test_out_path)

  # Check whether the file was created
  expect_file_exists(test_out_path)

  # Plotting dead pixel density
  test_out_path <- "perkinelmerfull_density.jpg"
  plot_pixels_density(
    detector = perkinelmerfull_detector, file_path = test_out_path,
    adjust = 0.5
  )

  # Check whether the file was created
  expect_file_exists(test_out_path)

  # Arrows
  test_out_path <- "perkinelmerfull_arrows.jpg"

  plot_pixels_arrows(detector = perkinelmerfull_detector, file_path = test_out_path)

  # Check whether the file was created
  expect_file_exists(test_out_path)

})

context("Testing reading in the dead pixel data and visualizing the detector: Excalibur")

test_that("Excalibur - mutiple files", {
  test_dir <- getwd()

  detector_name <- "Excalibur"

  excalibur_detector <- create_detector(detector_name)

  # getting the dead (damaged) pixel data
  dead_paths <- c(
    system.file("extdata", "Excalibur", "pixelmask.fem1.hdf", package = "detectorchecker"),
    system.file("extdata", "Excalibur", "pixelmask.fem2.hdf", package = "detectorchecker"),
    system.file("extdata", "Excalibur", "pixelmask.fem3.hdf", package = "detectorchecker"),
    system.file("extdata", "Excalibur", "pixelmask.fem4.hdf", package = "detectorchecker"),
    system.file("extdata", "Excalibur", "pixelmask.fem5.hdf", package = "detectorchecker"),
    system.file("extdata", "Excalibur", "pixelmask.fem6.hdf", package = "detectorchecker")
  )


  excalibur_detector <- load_pix_matrix(detector = excalibur_detector, file_path = dead_paths)

  # output file
  test_out_path <- "Excalibur_damaged.pdf"

  # Visualizing damaged pixels
  plot_pixels(detector = excalibur_detector, file_path = test_out_path)

  # Check whether the file was created
  expect_file_exists(test_out_path)

})

context("Model fitting")

test_that("Pilatus", {
  test_dir <- getwd()

  detector <- create_detector("Pilatus")

  # getting the dead (damaged) pixel data
  dead_path <- system.file("extdata", "Pilatus", "badpixel_mask.tif", package = "detectorchecker")


  detector <- load_pix_matrix(detector = detector, file_path = dead_path)

  # Euclidean distances from the centre
  # glm_fit <- glm_pixel_ctr_eucl(detector)
  # print(summary(glm_fit))

  # Parallel maxima from the centre
  # glm_fit <- glm_pixel_ctr_linf(detector)
  # print(summary(glm_fit))

  # Distances from the module edges by column
  # glm_fit <- glm_pixel_dist_edge_col(detector)
  # print(summary(glm_fit))

  # Distances from the module edges by row
  glm_fit <- glm_pixel_dist_edge_row(detector)

  # TODO: check the fitted values
  # print(summary(glm_fit))

  expect_true(TRUE)
})

context("Dead Stats Summary")

test_that("PerkinElmerFull", {
  test_dir <- getwd()

  detector <- create_detector("PerkinElmerFull")

  # getting the dead (damaged) pixel data
  test_path <- system.file("extdata", "PerkinElmerFull", "BadPixelMap_t1.bpm.xml", package = "detectorchecker")

  detector <- load_pix_matrix(detector = detector, file_path = test_path)

  dead_stats_summary <- dead_stats_summary(detector)

  summary <- paste("\n", "\n", summary(detector), "\n", "")
  summary <- paste(summary, dead_stats_summary, "\n", "")

  expect_true(TRUE)
})

context("Testing analysis: Perkin Elmer")

test_that("Perkin Elmer", {
  test_dir <- getwd()

  detector_name <- "PerkinElmerFull"

  perkinelmerfull_detector <- create_detector(detector_name)

  # getting the dead (damaged) pixel data
  dead_path <- system.file("extdata", "PerkinElmerFull", "BadPixelMap_t1.bpm.xml", package = "detectorchecker")


  perkinelmerfull_detector <- load_pix_matrix(detector = perkinelmerfull_detector, file_path = dead_path)

  # output file
  test_out_path <- "perkinelmerfull_damaged.pdf"

  # Visualizing damaged pixels
  plot_pixels(detector = perkinelmerfull_detector, file_path = test_out_path)

  # Check whether the file was created
  expect_file_exists(test_out_path)

  # Dead stats
  perkinelmerfull_detector <- get_dead_stats(perkinelmerfull_detector)

  # Plotting counts per module
  test_out_path <- "perkinelmerfull_module_cnt.pdf"
  plot_pixels_count(detector = perkinelmerfull_detector, file_path = test_out_path)

  # Check whether the file was created
  expect_file_exists(test_out_path)

  # Plotting dead pixel density
  test_out_path <- "perkinelmerfull_density.jpg"
  plot_pixels_density(
    detector = perkinelmerfull_detector, file_path = test_out_path,
    adjust = 0.5
  )

  # Check whether the file was created
  expect_file_exists(test_out_path)

  # Arrows
  test_out_path <- "perkinelmerfull_arrows.jpg"
  plot_pixels_arrows(detector = perkinelmerfull_detector, file_path = test_out_path)

  # Check whether the file was created
  expect_file_exists(test_out_path)

  # Full detector angle plot
  test_out_path <- "perkinelmerfull_angles.jpg"
  plot_pixels_angles(detector = perkinelmerfull_detector, file_path = test_out_path)

  # Check whether the file was created
  expect_file_exists(test_out_path)

  # test_analysis
  # test_analysis_functions(perkinelmerfull_detector)
})

context("Testing KFG: ")

test_that("Perkin Elmer", {
  test_dir <- getwd()

  detector_name <- "PerkinElmerFull"

  detector <- create_detector(detector_name)

  # getting the dead (damaged) pixel data
  dead_path <- system.file("extdata", "PerkinElmerFull", "BadPixelMap_t1.bpm.xml", package = "detectorchecker")

  detector <- load_pix_matrix(detector = detector, file_path = dead_path)

  # K
  test_out_path <- "K-Function.jpg"
  plot_pixels_kfg(detector = detector, func = "K", file_path = test_out_path)
  # Check whether the file was created
  expect_file_exists(test_out_path)

  # F
  test_out_path <- "F-Function.jpg"
  plot_pixels_kfg(detector = detector, func = "F", file_path = test_out_path)
  # Check whether the file was created
  expect_file_exists(test_out_path)

  # G
  test_out_path <- "G-Function.jpg"
  plot_pixels_kfg(detector = detector, func = "G", file_path = test_out_path)
  # Check whether the file was created
  expect_file_exists(test_out_path)

  # Kinhom
  test_out_path <- "Kinhom.jpg"
  plot_pixels_kfg(detector = detector, func = "Kinhom", file_path = test_out_path)
  # Check whether the file was created
  expect_file_exists(test_out_path)

  # Finhom
  test_out_path <- "Finhom.jpg"
  plot_pixels_kfg(detector = detector, func = "Finhom", file_path = test_out_path)
  # Check whether the file was created
  expect_file_exists(test_out_path)

  # Ginhom
  test_out_path <- "Ginhom.jpg"
  plot_pixels_kfg(detector = detector, func = "Ginhom", file_path = test_out_path)
  # Check whether the file was created
  expect_file_exists(test_out_path)
})
