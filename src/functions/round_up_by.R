# take a value and round it up by some value

# for multiple element numeric vectors, calculates the specified statistic
# for 1 element vectors, round that value up to the nearest specified multiple (e.g., 200)
round_up_by <- function(x,
                        stat = max,
                        round_up_by_stat = NULL,
                        round_up_by_value = 1) {
  # Handle the case where x has only one value
  if (length(x) == 1) {
    stat_value <- x
  } else {
    # Calculate the specified statistic (mean, max, min, sd, etc.)
    stat_value <- stat(x)
  }

  # Round up the value to the nearest upper multiple of round_by_value
  ceiling_value <- ceiling(stat_value / round_up_by_value) * round_up_by_value

  # If round_up_stat is provided, round the value based on that statistic
  if (!is.null(round_up_by_stat)) {
    # Try to calculate the rounding statistic and handle errors
    round_up_value <- tryCatch(
      round_up_by_stat(x),  # Attempt to compute the rounding statistic
      error = function(e) {
        warning(paste("Could not compute", deparse(substitute(round_up_by_stat)), ":", e$message))
        return(NA)  # Return NA if there is an error
      }
    )

    # Only apply rounding if the round_up_value is not NA
    if (!is.na(round_up_value)) {
      ceiling_value <- ceiling(stat_value / round_up_value) * round_up_value
    }
  }

  return(ceiling_value)
}


# examples
#c(100, 200, 300) |> round_up_by(stat = mean)

#c(100, 200, 300) |> round_up_by(stat = max, round_up_by_stat = sd)

#c(1, 2) |> round_up_by(stat = max, round_up_by_stat = sd)
#
#
#
#
#
#
round_up_by2 <- function(x,
                        stat = max,
                        round_up_by_stat = NULL,
                        round_up_by_value = 1) {
  # Handle the case where x has only one value
  if (length(x) == 1) {
    stat_value <- x
  } else {
    # Calculate the specified statistic (mean, max, min, sd, etc.)
    stat_value <- stat(x)
  }

  # Round up the value to the nearest upper multiple of round_by_value
  ceiling_value <- ceiling(stat_value / round_up_by_value) * round_up_by_value

  # Adjust logic to go to the next upper multiple if already a multiple
  if (stat_value %% round_up_by_value == 0) {
    ceiling_value <- ceiling_value + round_up_by_value
  }

  # If round_up_stat is provided, round the value based on that statistic
  if (!is.null(round_up_by_stat)) {
    # Try to calculate the rounding statistic and handle errors
    round_up_value <- tryCatch(
      round_up_by_stat(x),  # Attempt to compute the rounding statistic
      error = function(e) {
        warning(paste("Could not compute", deparse(substitute(round_up_by_stat)), ":", e$message))
        return(NA)  # Return NA if there is an error
      }
    )

    # Only apply rounding if the round_up_value is not NA
    if (!is.na(round_up_value)) {
      ceiling_value <- ceiling(stat_value / round_up_value) * round_up_value
    }
  }

  return(ceiling_value)
}

# examples
#c(100, 200, 300) |> round_up_by(stat = mean)

#c(100, 200, 300) |> round_up_by(stat = max, round_up_by_stat = sd)

#c(1, 2) |> round_up_by(stat = max, round_up_by_stat = sd)


