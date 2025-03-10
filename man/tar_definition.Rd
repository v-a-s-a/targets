% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tar_definition.R
\name{tar_definition}
\alias{tar_definition}
\title{For developers only: get the definition of the current target.}
\usage{
tar_definition(
  default = targets::tar_target_raw("target_name", quote(identity()))
)
}
\arguments{
\item{default}{Environment, value to return if \code{tar_definition()}
is called on its own outside a \code{targets} pipeline.
Having a default lets users run things without \code{\link[=tar_make]{tar_make()}},
which helps peel back layers of code and troubleshoot bugs.}
}
\value{
If called from a running target, \code{tar_definition()} returns
the target object of the currently running target.
See the "Target objects" section for details.
}
\description{
For developers only: get the full definition of the
target currently running. This target definition is the same kind
of object produced by \code{\link[=tar_target]{tar_target()}}.
}
\details{
Most users should not use \code{tar_definition()}  because accidental
modifications could break the pipeline.
\code{tar_definition()} only exists in order to support third-party interface
packages, and even then the returned target definition is not modified..
}
\section{Target objects}{

Functions like \code{tar_target()} produce target objects,
special objects with specialized sets of S3 classes.
Target objects represent skippable steps of the analysis pipeline
as described at \url{https://books.ropensci.org/targets/}.
Please read the walkthrough at
\url{https://books.ropensci.org/targets/walkthrough.html}
to understand the role of target objects in analysis pipelines.

For developers,
\url{https://wlandau.github.io/targetopia/contributing.html#target-factories}
explains target factories (functions like this one which generate targets)
and the design specification at
\url{https://books.ropensci.org/targets-design/}
details the structure and composition of target objects.
}

\examples{
class(tar_definition())
tar_definition()$settings$name
if (identical(Sys.getenv("TAR_EXAMPLES"), "true")) {
tar_dir({ # tar_dir() runs code from a temporary directory.
tar_script(
  tar_target(x, tar_definition()$settings$memory, memory = "transient")
)
tar_make(x)
tar_read(x)
})
}
}
\seealso{
Other utilities: 
\code{\link{tar_active}()},
\code{\link{tar_call}()},
\code{\link{tar_cancel}()},
\code{\link{tar_envir}()},
\code{\link{tar_group}()},
\code{\link{tar_name}()},
\code{\link{tar_path}()},
\code{\link{tar_seed}()},
\code{\link{tar_store}()}
}
\concept{utilities}
