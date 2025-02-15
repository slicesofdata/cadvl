################################################################################
# github.com/slicesofdata
################################################################################

################################################################################
# function to quote column names
################################################################################

quoted_cols <- function(...) {
    vars = as.character(substitute(list(...)))[-1L]
    return(vars)
}
#df |> dplyr::select(dplyr::any_of(quoted_cols(x, z)))


################################################################################
# a function to take unquoted column names and ready them for all_of()
# does not require quoting the variables for the vector
################################################################################

all_of_as_quote <- function(...) {
  # get arguments
  vars = substitute(list(...))[-1L]

  # if the first argument is a vector of unquoted col names
  if (length(vars) == 1 && is.call(vars[[1]]) && deparse(vars[[1]][[1]]) == "c") {
    # then extract the names
    vars = as.character(vars[[1]][-1])
  } else {
    # if column names are passed, convert them to character strings
    vars = sapply(vars, deparse)
  }

  return(tidyr::all_of(vars))
}

#df |> dplyr::select(all_of_as_quote(x, z))

#df |> dplyr::select(all_of_as_quote(c(x, z)))


################################################################################
# a function to take unquoted column names and ready for any_of()
################################################################################

any_of_as_quote <- function(...) {
  # Capture the arguments
  vars = substitute(list(...))[-1L]

  # Check if the first argument is a vector (like c(x, z))
  if (length(vars) == 1 && is.call(vars[[1]]) && deparse(vars[[1]][[1]]) == "c") {
    # If a vector like c(x, z) is passed, extract the names from it
    vars = as.character(vars[[1]][-1])
  } else {
    # If individual column names are passed, convert them to character strings
    vars = sapply(vars, deparse)
  }

  return(tidyr::any_of(vars))
}

#df |> dplyr::select(any_of_as_quote(x, z, m))

#df |> dplyr::select(any_of_as_quote(x, z))

#df |> dplyr::select(any_of_as_quote(c(x, z)))
