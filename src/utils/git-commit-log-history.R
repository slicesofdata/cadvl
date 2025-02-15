# writes out the git-commit history to file

#dir.create("_ignore_this_dir", showWarnings = FALSE, recursive = TRUE)
#dir.create("_ignore_this_dir/git-logs", showWarnings = FALSE, recursive = TRUE)
#system(paste("git log --pretty=format:\"%h - %an, %ad : %s\" > _ignore_this_dir/git-logs/commit-history-", format(Sys.Date(), "%Y-%m-%d"), ".txt"))


#system(paste("git log --pretty=format:\"%h - %an, %ad : %s\" > _ignore_this_dir/git-logs/commit-history-",
#             basename(here::here()), format(Sys.Date(), "%Y-%m-%d"), '.txt'))

#dir.create("_ignore_this_dir/git-logs", showWarnings = FALSE, recursive = TRUE)

#system(paste("git log --pretty=format:\"%h - %an, %ad : %s\" > _ignore_this_dir/git-logs/commit-history-", format(Sys.Date(), "%Y-%m-%d"), ".txt"))

dir.create("_ignore_this_dir/git-logs", showWarnings = FALSE, recursive = TRUE)

filename <- paste0("_ignore_this_dir/git-logs/commit-history-", basename(here::here()), "-",
                   format(Sys.Date(), "%Y-%m-%d"), ".txt")

sink(filename)
system("git log --pretty=format:\"%h - %an, %ad : %s\"")
sink()
