\name{NHLDraft_df}
\alias{NHLDraft_df}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("NHLDraft_df")}
\format{
  A data frame with 7941 observations on the following 8 variables.
  \describe{
    \item{\code{Year}}{the year taking place}
    \item{\code{Player}}{the name of the player}
    \item{\code{Pos}}{the category of each player including Goalies and Skaters}
    \item{\code{FINAL.RANK}}{the final rank of the player}
    \item{\code{Region}}{the region of the players including European and                             North American}
    \item{\code{cescin}}{the predicted variable value for the NHL outcomes}
    \item{\code{Overall}}{their overall rank individually}
    \item{\code{Position}}{the position that the player plays including defense, left wing, right wing, and center}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
http://myslu.stlawu.edu/~msch/Cescin2020.html
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(NHLDraft_df)
## maybe str(NHLDraft_df) ; plot(NHLDraft_df) ...
}
\keyword{datasets}
