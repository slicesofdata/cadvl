R.utils::sourceDirectory(here::here("src", "functions"))

# install.packages( 'https://raw.github.com/CDC-DNPAO/CDCAnthro/master/cdcanthro_0.1.3.tar.gz', type='source', repos=NULL )
# install.packages('https://raw.github.com/CDC-DNPAO/WHOAnthro/master/whoanthro_0.1.1.tar.gz', type='source', repos=NULL)
pacman::p_load(whoanthro, tidyverse, cdcanthro)

data <-
  whoanthro::Nhanes |>
  mutate(age_yrs = agedays/365,
         age_mos = age_yrs * 12,
         ht_in = lenhei/2.54
         )
data |>
  #filter(between(age_mos, 37, 39)) |>
  ggplot(mapping = aes(x = age_mos, y = ht_in)) +
  stat_summary(fun = mean,
               geom = "point") +
  scale_y_continuous(breaks = seq(20, 50, 2)) +
  scale_x_continuous(breaks = seq(0, 60, 2))

data |>
  filter(between(age_mos, 24, 38.5)) |>
  ggplot(mapping = aes(x = age_mos, y = ht_in)) +
  stat_summary(fun.data = mean_cl_normal, size = .5,
               geom = "pointrange")


whoanthro::whoanthro(data,
                     agedays = age_in_days,
                     wt = weight_kg,
                     lenhei = height,
                     headc=head_circumference,
                     bmi = bmi))

stature <- readxl::read_excel(here::here("data", "cdc", "stature-age.xls"))

stature |> view_html()
