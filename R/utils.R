#' @title Utils module

#' Calculates the trace value of a square matrix
#'
#' @param m A square matrix
#' @return tr The trace value
#' @keywords internal
.tr <- function(m) {
  tr <- NA

  # is the object matrix?
  if (is.matrix(m)) {
    row_count <- nrow(m)
    col_count <- ncol(m)

    # is it a square matrix?
    if (row_count == col_count) {
      tr <- 0.0
      tr <- sum(diag(m))
    }
  }

  return(tr)
}

#' Returns the mode of a set of data
#'
#' @param v set of data
#' @return uniqv the value of the mode
#' @keywords internal
.getmode <- function(v) {
  uniqv <- unique(v)
  mode <- uniqv[which.max(tabulate(match(v, uniqv)))]

  return(mode)
}

#' Checks whether a detector parameter is in the file string
#'
#' @param file_string String of a file context
#' @param parameter Detector parameter
#' @return parameter value
#' @keywords internal
.extract_detector_parameter <- function(file_string, parameter) {
  param_idx <- regexpr(parameter, file_string)

  string_len <- nchar(file_string)

  if (param_idx > 0) {
    sub_file_string <- substr(file_string, param_idx, string_len)
    end_line_idx <- regexpr("\n", sub_file_string)

    if (end_line_idx == -1) end_line_idx <- nchar(sub_file_string)
    # sub string the parameter line
    sub_file_string <- substr(sub_file_string, 1, end_line_idx)

    # look for =
    eq_idx <- regexpr("=", sub_file_string)

    if (eq_idx > 0) {
      sub_file_string <- substr(sub_file_string, eq_idx + 1, nchar(sub_file_string))

      tryCatch({
        return(eval(parse(text = trimws(sub_file_string))))
      }, error = function(err) {
        return(NA)
      })
    } else {
      return(NA)
    }
  } else {
    return(NA)
  }
}
