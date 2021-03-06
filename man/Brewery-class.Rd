\name{Brewery-class}
\Rdversion{1.1}
\docType{class}
\alias{Brewery-class}
\alias{Brewery}

\title{Class \code{Brewery}}
\description{
A \code{\link{Middleware}} class for mapping URLs to a directory of files that are subsequently passed to \code{\link[brew]{brew}}. When a file is brewed, the two variables \code{req} (an object of class \code{\link{Request}}) and \code{res} (an object of class \code{\link{Response}}) are available for use.

}
\section{Methods}{
\describe{
    \item{\code{new(url,root,...):}}{
	\code{url} is a character string or \code{\link{regexp}} on which to match, \code{root} is the name of the directory where brew files reside. Named arguments can be passed in via \code{...} and will be available within the scope of each brewed file.
    }
}}

\examples{

#
# This application runs any file found in tempdir() through brew.
#
s <- Rhttpd$new()
\dontrun{
s$start(quiet=TRUE)
}
cat("<h1>Random Number: <\%=rnorm(1)\%></h1>",
    file=file.path(tempdir(),"index.html"))
s$add(name="random",
    app=Builder$new(
        Brewery$new(url="/",root=tempdir()),
        Redirect$new("/index.html")
    )
)
\dontrun{
s$browse('random') # Opens a browser window to the app.
}
file.remove(file.path(tempdir(),"index.html"))
s$remove(all=TRUE)
rm(s)
}

\seealso{
\code{\link{Rhttpd}}, \code{\link{Builder}}, \code{\link{Redirect}}, and \code{\link[brew]{brew}}.
}
\keyword{classes}
