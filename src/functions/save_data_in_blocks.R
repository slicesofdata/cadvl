pacman::p_load(purrr, openxlsx)

write_data_in_blocks <- function(
    data,
    block_size = 100000,
    file_prefix = "data",
    save_option = c("csv", "rds", "xlsx"),
    save_dir = "." #default to current directory
    ) {
  # Match save option
  save_option = match.arg(save_option)

  # Ensure the save directory exists
  if (!dir.exists(save_dir)) {
    dir.create(save_dir, recursive = TRUE)
  }

  # Split data into blocks of specified size
  blocks = split(data, (seq_len(nrow(data)) - 1) %/% block_size)

  # Function to write each block
  write_block <- function(block, block_name) {
    start_row = as.numeric(block_name) * block_size + 1
    end_row   = min((as.numeric(block_name) + 1) * block_size, nrow(data))
    #file_name = file.path(save_dir, paste0(file_prefix, "_", start_row, "_", end_row))
    file_name <- file.path(save_dir, sprintf("%s-%d-%d", file_prefix, start_row, end_row))


    # Save the block based on the selected format
    switch(EXPR = save_option, # the expression evaluated
           csv = write.csv(block, paste0(file_name, ".csv"), row.names = FALSE),
           rds = saveRDS(block, paste0(file_name, ".Rds")),
           xlsx = openxlsx::write.xlsx(block, paste0(file_name, ".xlsx"))
    )
  }

  # Apply writing function to each block
  purrr::walk2(blocks, names(blocks), write_block)
}

# Example Usage
#data <- data.frame(x = 1:350000, y = rnorm(350000))

# Save as RDS files to a specific directory
#write_data_in_blocks(data,
#                     block_size = 100000,
#                     file_prefix = "data_block",
#                     save_option = "rds", save_dir = "output/rds_files")

