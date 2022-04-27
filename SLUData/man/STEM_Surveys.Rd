\name{STEM_Surveys}
\alias{STEM_Surveys}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("STEM_Surveys")}
\format{
  A data frame with 24 observations on the following 8 variables.
  \describe{
    \item{\code{Group}}{the category the student fits in}
    \item{\code{Cohort}}{the year of the research}
    \item{\code{Item}}{the statement the student is responding to}
    \item{\samp{Strongly Disagree}}{the number of students responding "Strongly Disagree"}
    \item{\code{Disagree}}{the number of students responding "Disagree"}
    \item{\code{Neutral}}{the number of students responding "Neutral"}
    \item{\code{Agree}}{the number of students responding "Agree"}
    \item{\samp{Strongly Agree}}{the number of students responding "Strongly Agree"}
  }
}
\details{
}
\source{
Chapman, J. L., Hill, A. D., Nagel-Myers, J., & Ramler, I. P. (2019). "The liberal arts science scholars program: A multidisciplinary model for supporting science and mathematics students through the first year". Journal of STEM Education, 20(1), 17-23. Retrieved from https://www.jstem.org/jstem/index.php/JSTEM/article/view/2322/2120
}
\references{
}
\examples{
library(tidyverse)
library(readxl)
library(scales)
library(RColorBrewer)
library(knitr)
STEM_Surveys <- read_excel("data/STEM_Surveys.rda")
kable(data(STEM_Surveys))
STEM_Surveys_New <-
  STEM_Surveys \%>\%
  mutate(.,
        Group = fct_relevel(as.factor(Group), c("Other FY STEM", "Other S-STEM Eligible", "LAS Scholar"))) \%>\%
  group_by(Group, Item) \%>\%
  pivot_longer(.,
               cols = 4:8,
               names_to = "Response",
               values_to = "Count") \%>\%
  mutate(.,
         ntotal = sum(Count),
         percentage = (Count/ntotal)) \%>\%
         #Group = fct_relevel(factor(Group), c("LAS Scholars", "Other S-STEM Eligible", "Other FY STEM"))) \%>\%
  ungroup()


ggplot(data = STEM_Surveys_New, aes(x = Group, y = percentage, fill = factor(Response, levels = c("Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree")))) +
  geom_col(position = "stack") +
  coord_flip() +
  facet_wrap(vars(Item)) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  theme_bw() +
  theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5),
        strip.text.x = element_text(size = 7)) +
  scale_fill_brewer(palette = "Blues", direction = -1) +
  labs(title = "Combined Cohorts", x = "", y = "", fill = "Response")

}
\keyword{datasets}
