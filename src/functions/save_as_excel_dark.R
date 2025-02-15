install_if_not_installed <- function(list) {
   new_pkg <- list[!(list %in% installed.packages()[,"Package"])]

   if(length(new_pkg)) install.packages(new_pkg)
}

install_if_not_installed("openxlsx")

###############################################################
# function to save data in dark mode excel
###############################################################
save_as_excel_dark <- function(
    x,
    file_name,
    mode = "dark"
  ) {
  #library(openxlsx)

  # Create a new workbook
  wb <- openxlsx::createWorkbook()

  # Add a worksheet
  openxlsx::addWorksheet(wb, "Sheet1")

  # Write the data frame to the worksheet
  openxlsx::writeData(wb, "Sheet1", x)

  # Create a style with a black background, white font, and grey borders on all sides
  the_style <- openxlsx::createStyle(
    fgFill = "grey",          # Black background
    fontColour = "black",      # White font
    #textDecoration = "bold",   # Bold text
    border = c("top", "bottom", "left", "right"),  # Borders on all sides
    borderColour = "black",     # Grey border color
    halign = "center",         # Center alignment
    valign = "center"          # Vertical alignment
  )

  if (mode == "dark") {
  the_style <- openxlsx::createStyle(
    fgFill = "black",          # Black background
    fontColour = "white",      # White font
    #textDecoration = "bold",   # Bold text
    border = c("top", "bottom", "left", "right"),  # Borders on all sides
    borderColour = "grey",     # Grey border color
    halign = "center",         # Center alignment
    valign = "center"          # Vertical alignment
  )
  }
  if (mode == "light") {
    the_style <- openxlsx::createStyle(
      fgFill = "grey",          # Black background
      fontColour = "black",      # White font
      #textDecoration = "bold",   # Bold text
      border = c("top", "bottom", "left", "right"),  # Borders on all sides
      borderColour = "black",     # Grey border color
      halign = "center",         # Center alignment
      valign = "center"          # Vertical alignment
    )
  }

  # Apply the style to the entire data frame (including the header)
  openxlsx::addStyle(wb, "Sheet1",
           style = the_style,
           rows = 1:(nrow(df) + 1), cols = 1:ncol(df), gridExpand = TRUE)

  # Save the workbook
  openxlsx::saveWorkbook(wb, file_name, overwrite = TRUE)

  message("File saved as ", file_name)
}

# Example usage:
# df <- data.frame(Name = c("Alice", "Bob", "Charlie"), Age = c(25, 30, 35), City = c("New York", "Los Angeles", "Chicago"))
# save_as_styled_excel(df, "styled_output.xlsx")

