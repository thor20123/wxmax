# Overview #
wxMax is a [BlitzMax](http://blitzmax.com/) language binding for [wxWidgets](http://www.wxwidgets.org/), an easy-to-use API for writing GUI applications on multiple platforms.

There are still some things ToDo.

# Getting wxMax #

wxMax is **available** from the [Downloads](http://code.google.com/p/wxmax/downloads/list?can=2&q=rar&colspec=Filename+Summary+Uploaded+Size+DownloadCount) area. You have a choice of either an already pre-compiled **bin** release, or one you can build yourself.

We also provide a set of wxWidgets pre-compiled static libraries, headers and localization files in the [Downloads](http://code.google.com/p/wxmax/downloads/list?can=2&q=wxwidgets&colspec=Filename+Summary+Uploaded+Size+DownloadCount) area for use with wxMax. _These are included in the **bin** release._

&lt;wiki:gadget url="http://www.ohloh.net/projects/16579/widgets/project\_users.xml?style=blue" height="100"  border="0" /&gt;

# Using wxMax #

My first app - HelloWorld

A minimal app - MinimalApp

A GuideToPorting explains some of the differences between a C++ based app and its BlitzMax equivalent.

## Tutorials ##

Some tutorials are included with the distributions, and also available online [here](http://brucey.net/programming/blitz/tutorials/index.html).

# Help #

See the SetupAndInstallation guide for getting yourself up and running with the module.

The FrequentlyAskedQuestions page might help if you get stuck.

And don't forget, you can also use the [BlitzMax forum](http://blitzmax.com/Community/topics.php?forum=124) or the [wxMax Group](http://groups.google.com/group/wxmax) to ask questions, and chat about the module.

# Did You Know? #
wxMax includes several third-party modules on top of the standard wxWidgets distribution. They are :
  * **wxCTB** - Standardized serial I/O
  * **wxFlatNotebook** - Customizable notebook widget
  * **wxJSON** - JSON parser/writer
  * **wxMidi** - PortMidi wrapper
  * **wxPdfDocument** - PDF document generator
  * **wxPropGrid** - Property grid widget
  * **wxRarInputStream** - Rar file input stream
  * **wxScintilla** - Scintilla editor widget
  * **wxSheet** - Spreadsheet style grid widget
  * **wxSpinCtrlDbl** - Spin widget with double support

The wxCTB module included with wxMax also works on OS X. That's right! You can use a standard Serial API on all three platforms :-) <sub>As far as we know, this is the only version of wxCTB that supports OS X !</sub>