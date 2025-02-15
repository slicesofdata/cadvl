
################################################################################
# install libraries
################################################################################

install_if_not_installed <- function(list) {
   new_pkg <- list[!(list %in% installed.packages()[,"Package"])]

   if(length(new_pkg)) install.packages(new_pkg)
  }

install_if_not_installed("usethis")

################################################################################

################################################################################
# function to configure git
################################################################################
set_my_git_config <- function(
    username  = NULL,
    email     = NULL,
    get_token = TRUE,
    set_creds = TRUE
) {

  if (!is.null(username) && !is.null(email)) {
    message("Configuring GitHub username and e-mail for:\n    ", paste0(username, " - ", email), "\n")
    usethis::use_git_config(user.name = username, user.email = email)
  } else { message("must set a username and email")
  }

  if (get_token) {
    message("Creating a token on GitHub (log into browser if not logged in).\n")
    Sys.sleep(3)  # wait 3 s
    usethis::create_github_token()
  }

  if (set_creds) {
    Sys.sleep(2)
    message("Copy token from GitHub and paste to set your credentials.")
    gitcreds::gitcreds_set()
    }
}



