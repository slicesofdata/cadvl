##############################################################
# Load libraries
library(here)
library(fs)

#############################################################
# Function to update order in YAML
update_yaml_order <- function(
    filepath,
    order_value  # the position of the file name in the vector
    ) {

  if (file.exists(filepath)) {

    lines <- readLines(filepath)
    yaml_end <- which(lines == "---")[2] # Find the end of the YAML front matter

    # Check if order line exists
    order_line <- grep("^order:", lines)

    # if it exists modify it
    if (length(order_line) > 0 && order_line < yaml_end) {
      # Update existing order line
      lines[order_line] <- paste("order:", order_value)
    } else {
      # otherwise insert new order line before the end of YAML
      lines <- append(lines,
                      paste("order:", order_value),
                      after = yaml_end - 1
                      )
    }

    writeLines(lines, filepath)

    # Move file to _do_not_include if order is 0,
    # the defualt unless in the vector
    if (order_value == 0 && basename(filepath) != "index.qmd") {
    #if (order_value == 0) {
      not_built_dir <- file.path(dirname(filepath), "_do_not_include")
      dir_create(not_built_dir)
      file_move(filepath, file.path(not_built_dir, basename(filepath)))
      message("Moved file to _do_not_include: ", filepath)
      }
    } else {
      message("File does not exist: ", filepath)
    }
}

# Function to list files recursively excluding _do_not_include directories
list_files_recursive <- function(
    directory,
    pattern
    ) {
  all_files <- list.files(directory,
                          pattern = pattern,
                          full.names = TRUE,
                          recursive = TRUE
                          )

  filtered_files <- all_files[!grepl("_do_not_include", all_files)]
  return(filtered_files)
}


add_order_for_files <- function(
    directory,
    file_order = file_order
    ) {

  # Get the list of .qmd files in the directory recursively
  files_in_directory <- list_files_recursive(directory, "\\.qmd$")

  # Process each file in the directory
  for (filepath in files_in_directory) {
    file_name <- basename(filepath)

    # Check if file is in the specified order vector
    if (file_name %in% file_order) {

    # Get the order index from file_order
    order_value <- which(file_order == file_name)
    } else {
      # Set order to 0 if file is not in file_order
      order_value <- 0
    }

    # update the yaml code
    update_yaml_order(filepath, order_value)
 }
}

# end functions
#############################################################


##############################################################
### Order Setup Module files
##############################################################
file_order <- unique(c(
  "installing_r_and_rstudio.qmd",
  "introduction_to_r_rstudio_and_rmarkdown.qmd",
  "functions_and_scripts.qmd",
  "vectors_and_data_frame_basics.qmd",
  "reading_data_files.qmd"#,
  #"reading_excel_files.qmd"
  ))

add_order_for_files(
  directory = here::here("modules_setup"),
  file_order = file_order
  )

##############################################################
### Order Base Module files
##############################################################
file_order <- unique(c(
  #"module_starter_page.qmd"#,
  #"project_management.qmd",
  "installing_and_setting_up_git_and_github.qmd",
  "using_git_and_github.qmd",
  "graphical_perception.qmd",
  #"reading_data_files.qmd",
  "data_frame_manipulation_and_wrangling.qmd",
  "data_subsets_and_summaries.qmd",
  "considerations_in_data_visualization.qmd",
  "designing_perceptually_efficient_visualizations.qmd",
  "ggplot_and_the_grammar_of_graphics.qmd",
  #"visualizing_amounts.qmd",
  "visualizing_associations.qmd",
  "spatial_position_and_adjustment.qmd",
  "color_scales_and_palettes.qmd",
  "histograms_and_density_plots.qmd",
  "coordinates_axes_and_position_scales.qmd",
  "statistical_transformations.qmd",
  "more_data_wrangling.qmd",
  "visualizing_more_distributions.qmd",
  "visualizing_uncertainty.qmd",
  "visualizing_trends.qmd",
  "legends_and_arrangement.qmd",
  "annotation_and_text.qmd",
  "multi_panel_plots_faceting.qmd",
  "attentional_control.qmd",
  #"titles_captions_and_tables.qmd",
  "themes.qmd"
))

add_order_for_files(directory = here::here("modules"),
                    file_order = file_order
                    )

##############################################################
### Order Slide files
##############################################################
file_order <- c(
 "intro_rstudio_rmarkdown_slides.qmd",
 "git.qmd",
 "git_slides.qmd",
 "functions_slides.qmd"
)

#add_order_for_files(
#  directory = here::here("slides"),
#  file_order = file_order
#  )
