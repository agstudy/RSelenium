\name{remoteDriver}
\alias{remoteDriver}
\title{CLASS remoteDriver}
\usage{
  remoteDriver(...)
}
\description{
  remoteDriver Class uses the JsonWireProtocol to
  communicate with the Selenium Server. If an error occurs
  while executing the command then the server sends back an
  HTTP error code with a JSON encoded reponse that
  indicates the precise Response Error Code. The module
  will then croak with the error message associated with
  this code. If no error occurred, then the subroutine
  called will return the value sent back from the server
  (if a return value was sent). So a rule of thumb while
  invoking methods on the driver is if the method did not
  croak when called, then you can safely assume the command
  was successful even if nothing was returned by the
  method.
}
\details{
  remoteDriver is a generator object. To define a new
  remoteDriver class method `new` is called. The slots
  (default value) that are user defined are:
  remoteServerAddr(localhost), port(4444),
  browserName(firefox), version(""), platform(ANY),
  javascript(TRUE). See examples for more information on
  use.
}
\section{Slots}{
  \describe{ \item{\code{remoteServerAddr}:}{Object of
  class \code{"character"}, giving the ip of the remote
  server. Defaults to localhost} \item{\code{port}:}{Object
  of class \code{"numeric"}, the port of the remote server
  on which to connect.} \item{\code{browserName}:}{Object
  of class \code{"character"}. The name of the browser
  being used; should be one of
  {chrome|firefox|htmlunit|internet explorer|iphone}.}
  \item{\code{version}:}{Object of class
  \code{"character"}. The browser version, or the empty
  string if unknown.} \item{\code{platform}:}{Object of
  class \code{"character"}. A key specifying which platform
  the browser is running on. This value should be one of
  {WINDOWS|XP|VISTA|MAC|LINUX|UNIX}. When requesting a new
  session, the client may specify ANY to indicate any
  available platform may be used.}
  \item{\code{javascript}:}{Object of class
  \code{"character"}. Whether the session supports
  executing user supplied JavaScript in the context of the
  current page. } \item{\code{serverURL}:}{Object of class
  \code{"character"}. Url of the remote server which JSON
  requests are sent to. } \item{\code{sessionInfo}:}{Object
  of class \code{"list"}. A list containing information on
  sessions. } }
}

\section{Methods}{
  \describe{ \item{\code{new(...)}:}{ Create a new
  \code{remoteDriver} object. ... is used to define the
  appropriate slots.} \item{\code{open()}:}{ Send a request
  to the remote server to instantiate the browser. }
  \item{\code{getSessions()}:}{ Returns a list of the
  currently active sessions. Each session will be returned
  as a list containing amongst other items: \describe{
  \item{\code{id}:}{The session ID}
  \item{\code{capabilities}:}{An object describing
  session's capabilities} } } \item{\code{status()}:}{
  Query the server's current status. All server
  implementations should return two basic objects
  describing the server's current platform and when the
  server was built.} \item{\code{getAlertText()}:}{ Gets
  the text of the currently displayed JavaScript alert(),
  confirm() or prompt() dialog. }
  \item{\code{sendKeysToActiveElement(sendKeys)}:}{ Send a
  sequence of key strokes to the active element. This
  command is similar to the send keys command in every
  aspect except the implicit termination: The modifiers are
  not released at the end of the call. Rather, the state of
  the modifier keys is kept between calls, so mouse
  interactions can be performed while modifier keys are
  depressed.  The key strokes are sent as a list. Plain
  text is enter as an unnamed element of the list. Keyboard
  entries are defined in `selKeys` and should be listed
  with name `key`. See the examples. }
  \item{\code{sendKeysToAlert(sendKeys)}:}{ Sends
  keystrokes to a JavaScript prompt() or alert () dialog.
  The key strokes are sent as a list. Plain text is enter
  as an unnamed element of the list. Keyboard entries are
  defined in `selKeys` and should be listed with name
  `key`. See the examples.} \item{\code{acceptAlert()}:}{
  Accepts the currently displayed alert dialog.  Usually,
  this is equivalent to clicking the 'OK' button in the
  dialog. } \item{\code{dismissAlert()}:}{ Dismisses the
  currently displayed alert dialog. For comfirm() and
  prompt() dialogs, this is equivalent to clicking the
  'Cancel' button. For alert() dialogs, this is equivalent
  to clicking the 'OK' button. }
  \item{\code{mouseMoveToLocation(x, y, elementId)}:}{ Move
  the mouse by an offset of the specificed element. If no
  element is specified, the move is relative to the current
  mouse cursor. If an element is provided but no offset,
  the mouse will be moved to the center of the element. If
  the element is not visible, it will be scrolled into
  view. }
  \item{\code{setAsyncScriptTimeout(milliseconds)}:}{ Set
  the amount of time, in milliseconds, that asynchronous
  scripts executed by execute_async_script() are permitted
  to run before they are aborted and a |Timeout| error is
  returned to the client. }
  \item{\code{setImplicitWaitTimeout(milliseconds)}:}{ Set
  the amount of time the driver should wait when searching
  for elements. When searching for a single element, the
  driver will poll the page until an element is found or
  the timeout expires, whichever occurs first. When
  searching for multiple elements, the driver should poll
  the page until at least one element is found or the
  timeout expires, at which point it will return an empty
  list. If this method is never called, the driver will
  default to an implicit wait of 0ms. }
  \item{\code{close()}:}{ Close the current window. }
  \item{\code{quit()}:}{ Delete the session & close open
  browsers. } \item{\code{getCurrentWindowHandle()}:}{
  Retrieve the current window handle. }
  \item{\code{getWindowHandles()}:}{ Retrieve the list of
  window handles used in the session. }
  \item{\code{getWindowSize(windowId)}:}{ Retrieve the
  window size. `windowid` is optional (default is 'current'
  window). Can pass an appropriate `handle` }
  \item{\code{getWindowPosition(windowId = "current")}:}{
  Retrieve the window position. `windowid` is optional
  (default is 'current' window). Can pass an appropriate
  `handle` } \item{\code{getCurrentUrl()}:}{ Retrieve the
  url of the current page. } \item{\code{navigate()}:}{
  Navigate to a given url. } \item{\code{getTitle()}:}{ Get
  the current page title. } \item{\code{goForward()}:}{
  Equivalent to hitting the forward button on the browser.
  } \item{\code{goBack()}:}{ Equivalent to hitting the back
  button on the browser. } \item{\code{refresh()}:}{ Reload
  the current page. }
  \item{\code{executeAsyncScript(script,args)}:}{ Inject a
  snippet of JavaScript into the page for execution in the
  context of the currently selected frame. The executed
  script is assumed to be asynchronous and must signal that
  is done by invoking the provided callback, which is
  always provided as the final argument to the function.
  The value to this callback will be returned to the
  client.  Asynchronous script commands may not span page
  loads. If an unload event is fired while waiting for a
  script result, an error should be returned to the client.
  } \item{\code{executeScript(script,args)}:}{ Inject a
  snippet of JavaScript into the page for execution in the
  context of the currently selected frame. The executed
  script is assumed to be synchronous and the result of
  evaluating the script is returned to the client.

  The script argument defines the script to execute in the
  form of a function body. The value returned by that
  function will be returned to the client. The function
  will be invoked with the provided args array and the
  values may be accessed via the arguments object in the
  order specified.

  Arguments may be any JSON-primitive, array, or JSON
  object. JSON objects that define a WebElement reference
  will be converted to the corresponding DOM element.
  Likewise, any WebElements in the script result will be
  returned to the client as WebElement JSON objects. }
  \item{\code{screenshot()}:}{ Take a screenshot of the
  current page. The screenshot is returned as a base64
  encoded PNG.} \item{\code{switchToFrame(frameId)}:}{
  Change focus to another frame on the page. If the frame
  ID is null, the server will switch to the page's default
  content. } \item{\code{switchToWindow(windowId}:}{ Change
  focus to another window. The window to change focus to
  may be specified by its server assigned window handle, or
  by the value of its name attribute. }
  \item{\code{setWindowPosition(x,y,winHand)}:}{ Set the
  position (on screen) where you want your browser to be
  displayed. The windows handle is optional. If not
  specified the current window in focus is used. }
  \item{\code{setWindowSize(width,height,winHand)}:}{ Set
  the size of the browser window. The windows handle is
  optional. If not specified the current window in focus is
  used.} \item{\code{getAllCookies()}:}{ Retrieve all
  cookies visible to the current page. Each cookie will be
  returned as a list with the following name and value
  types: \describe{ \item{\code{name}:}{character}
  \item{\code{value}:}{character}
  \item{\code{path}:}{character}
  \item{\code{domain}:}{character}
  \item{\code{secure}:}{logical} } }
  \item{\code{addCookie(name,value,path,domain,secure)}:}{
  Set a cookie on the domain. The inputs are required apart
  from `secure` which defaults to FALSE. }
  \item{\code{deleteAllCookies()}:}{ Delete all cookies
  visible to the current page. }
  \item{\code{deleteCookieNamed(name)}:}{ Delete the cookie
  with the given name. This command will be a no-op if ther
  is no such cookie visible to the current page.}
  \item{\code{getPageSource()}:}{ Get the current page
  source. } \item{\code{findElement(using ,value)}:}{
  Search for an element on the page, starting from the
  document root. The located element will be returned as an
  object of webElement class.  The inputs are: \describe{
  \item{\code{using}:}{Locator scheme to use to search the
  element, available schemes: {class, class_name, css, id,
  link, link_text, partial_link_text, tag_name, name,
  xpath}. Defaults to 'xpath'. } \item{\code{value}:}{The
  search target. See examples.} } }
  \item{\code{findElements(using ,value)}:}{ Search for
  multiple elements on the page, starting from the document
  root. The located elements will be returned as an list of
  objects of class WebElement.  The inputs are: \describe{
  \item{\code{using}:}{Locator scheme to use to search the
  element, available schemes: {class, class_name, css, id,
  link, link_text, partial_link_text, tag_name, name,
  xpath}. Defaults to 'xpath'. } \item{\code{value}:}{The
  search target. See examples.} } }
  \item{\code{getActiveElement()}:}{ Get the element on the
  page that currently has focus. The located element will
  be returned as a WebElement id. }
  \item{\code{click(buttonId)}:}{ Click any mouse button
  (at the coordinates set by the last mouseMoveToLocation()
  command). buttonId - any one of 'LEFT'/0 'MIDDLE'/1
  'RIGHT'/2. Defaults to 'LEFT'}
  \item{\code{doubleclick(buttonId)}:}{ Double-Click any
  mouse button (at the coordinates set by the last
  mouseMoveToLocation() command). buttonId - any one of
  'LEFT'/0 'MIDDLE'/1 'RIGHT'/2. Defaults to 'LEFT' }
  \item{\code{buttondown(buttonId)}:}{ Click and hold the
  given mouse button (at the coordinates set by the last
  moveto command). Note that the next mouse-related command
  that should follow is buttondown . Any other mouse
  command (such as click or another call to buttondown)
  will yield undefined behaviour.  buttonId - any one of
  'LEFT'/0 'MIDDLE'/1 'RIGHT'/2. Defaults to 'LEFT'}
  \item{\code{buttonup(buttonId)}:}{ Releases the mouse
  button previously held (where the mouse is currently at).
  Must be called once for every buttondown command issued.
  See the note in click and buttondown about implications
  of out-of-order commands.  buttonId - any one of 'LEFT'/0
  'MIDDLE'/1 'RIGHT'/2. Defaults to 'LEFT' }
  \item{\code{closeServer()}:}{ Closes the server in
  practice terminating the process. This is useful for
  linux systems. On windows the java binary operates as a
  seperate shell which the user can terminate. } }
}
\examples{
\dontrun{
# start the server if one isnt running
startServer()

# use default server initialisation values
remDr <- remoteDriver$new()

# send request to server to initialise session
remDr$open()

# navigate to R home page
remDr$navigate("http://www.r-project.org")

# navigate to www.bbc.co.uk notice the need for http://
remDr$navigate("http://www.bbc.co.uk")

# go backwards and forwards
remDr$goBack()

remDr$goForward()

remDr$goBack()

# Examine the page source
frontPage <- remDr$getPageSource()

# The R homepage contains frames
webElem <- remDr$findElements(value = "//frame")
sapply(webElem, function(x){x$getElementAttribute('name')})

# The homepage contains 3 frames: logo, contents and banner
# switch to the `contents` frame
webElem <- remDr$findElement(using = 'name', value = 'contents')
remDr$switchToFrame(webElem$elementId)

# re-examine the page source

contentPage <- remDr$getPageSource()
identical(contentPage, frontPage) # false we hope!!

# Find the link for the search page on R homepage. Use xpath as default.
webElem <- remDr$findElement(value = '//a[@href = "search.html"]')
webElem$getElementAttribute('href') # "http://www.r-project.org/search.html"

# click the search link
webElem$clickElement()

# FILL OUT A GOOGLE SEARCH FORM
remDr$navigate("http://www.google.com")

# show different methods of accessing DOM components

webElem1 <- remDr$findElement(using = 'name', value = 'q')
webElem2 <- remDr$findElement(using = 'id', value = webElem1$getElementAttribute('id'))
webElem3 <- remDr$findElement(using = 'xpath', value = '//input[@name = "q"]')

# Enter some text in the search box

webElem1$sendKeysToElement(list('RSelenium was here'))

# clear the text previously entered

webElem1$clearElement()

# show an example of sending a key press
webElem1$sendKeysToElement(list('R', key = 'enter'))

# Collate the results for the `R` search
googLinkText <- remDr$findElements(value = "//h3[@class = 'r']")
linkHeading <- sapply(googLinkText, function(x) x$getElementText())
googLinkDesc <- remDr$findElements(value = "//div[@class = 's']")
linkDescription <- sapply(googLinkDesc, function(x) x$getElementText())
googLinkHref <- remDr$findElements(value = "//h3[@class = 'r']/a")
linkHref <- sapply(googLinkHref, function(x) x$getElementAttribute('href'))

data.frame(heading = linkHeading, description = linkDescription, href = linkHref)

# Example of javascript call
remDr$executeScript("return arguments[0] + arguments[1];", args = 1:2)
# Example of javascript async call
remDr$executeAsyncScript("arguments[arguments.length - 1](arguments[0] + arguments[1]);", args = 1:2)
}
}

