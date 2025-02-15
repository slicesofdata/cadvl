###################################################################
# should r be restarted?
###################################################################
if (restart_r_session) { .rs.restartR() } # to restart a fresh session


# need to move
do_huber = TRUE

###################################################################
# run common file?
###################################################################
if (run_commonR) { source(here::here("src", "_common.R")) }

# get all functions
R.utils::sourceDirectory(here::here("src", "functions"))

###################################################################
# page under construction warning
###################################################################
# To display, set construction = TRUE for the page
construction_msg <<- cat("::: callout-important\n## Under construction.\n
This page is a work in progress and may contain areas that need more detail or that required syntactical, grammatical, and typographical changes. If you find some part requiring some editing, please let me know so I can fix it for you.\n:::"
)

###################################################################
# written notes that are repeated for each module.
###################################################################
book_link <<- "[Wickham, Navarro, & Pedersen. *ggplot2: Elegant Graphics for Data Analysis (3e)*](https://ggplot2-book.org/)."

book_link_block <<- paste0("For more detailed content on code implementation, see ", book_link)

reading_block <<- "The goal should be to familiarize yourself and bring questions
to class. The online readings are taken from [TFDV](https://clauswilke.com/dataviz)."

video_block <<- "R code implementation of functions from various libraries will
be illustrated through video examples. This video content is designed to familiarize
you with some key functions used to address data visualization issues related to this
module. The video content will not, however, address all details nor will they discuss
many of the  common issues that you might experience while working on associated
with The module content below."

before_class_block <<- "First, read to familiarize yourself with the concepts rather
than master them. Understand why one would want to visualize data in a particular way
and also understand some of the functionality of **{ggplot2}**. I will assume that you
attend class with some level of basic understanding of concepts."

after_class_block <<- "The module text, code, and plots on this page expand upon
the video content associated with this module. Because the video content introduces
you to key functions and functions related to the module, the text is designed to
explain the concepts and step associated with creating a plot in greater detail.
For example, common issues, problems, or pitfalls are addressed and various solutions
are presented to you. Your choice of a solution may depending on your plot goals,
coding experience and/or abiliy, time, or desire to write flexible and reproducible code.

\n\nAfter having some hands-on experience with coding exercises in class, homework problems
will be more complex, will involving problem solving, and may be open ended. In many
instances you will also work with your team-project data for these homework assignments.
In order to complete some homework problems, you wil need to review this text and/or
reference it when writing your code.

\n\nYou should realize that the plots you create for homework problems may or may not be the type you use for your
specific team project nor will they take on a final form acceptable for a final "

###################################################################
# textbook content links
###################################################################

if (do_huber) {
# huber text
huber_pdf <<- "https://www.markhuberdatascience.org/_files/ugd/c2b9b6_543ea42a1ea64e32b4440b34ffd71635.pdf"
front_matter   <<- 10
huber_intro_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 3)
huber_rmarkdown_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 10)
huber_graphing_ch  <<- glue::glue(huber_pdf,"#page=",front_matter + 17)
huber_transformation_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 59) # 5
huber_summaries_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 71)
huber_eda_var_ch   <<- glue::glue(huber_pdf,"#page=",front_matter + 81)
huber_eda_covar_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 93)
huber_import_ch    <<- glue::glue(huber_pdf,"#page=",front_matter + 103)
huber_tidy_data_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 123)
huber_relational_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 141)
huber_filtering_joins_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 150)
huber_strings_ch  <<- glue::glue(huber_pdf,"#page=",front_matter + 155)
huber_regex_ch    <<- glue::glue(huber_pdf,"#page=",front_matter + 162)
huber_using_regex_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 170)
huber_func_patterns_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 182)
huber_factors_ch  <<- glue::glue(huber_pdf,"#page=",front_matter + 186)
huber_sql_ch      <<- glue::glue(huber_pdf,"#page=",front_matter + 199)
huber_writing_functions_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 232)
huber_modeling_ch <<- glue::glue(huber_pdf,"#page=",front_matter + 241)
}
