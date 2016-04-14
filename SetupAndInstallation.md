# Installing the bin release #

Download the appropriate **bin** release .rar and extract it somewhere. You should see a wx.mod folder which contains the entirety of wxMax.
This needs to be moved into your BlitzMax/mod folder.

That's it. You can now start using wxMax !

_Please note that Mac users will require some additional MacAppStubTweaks to get the full benefit out of wxMax._


# Installing the source release #

Download the source release .rar and extract it somewhere. You should see a wx.mod folder which contains all the source of wxMax.
This needs to be moved into your BlitzMax/mod folder.

There is one more thing you will need before you can start building your own BlitzMax GUI apps with wxMax.

  * A set of wxWidgets static library files

These can be downloaded from the [Downloads](http://code.google.com/p/wxmax/downloads/list?can=2&q=wxwidgets&colspec=Filename+Summary+Uploaded+Size+DownloadCount) area.


The library files should be unzipped into the `wx.mod/lib/` folder. It will create a folder based on the libraries you install (e.g. `linux`, for the Linux libraries).

With the headers and libraries in their correct locations, it should be a simple matter of building the modules in your IDE.
It may take a while the first time, since there is a **lot** to compile.


# Installing from Subversion (SVN) #

Installation from Subversion is similar to  working with a source release, except that you need to retrieve the module from the subversion repository instead.

See the [Source](http://code.google.com/p/wxmax/source) section for details of how to get it.

You will also need to download and install the wxWidgets headers.

The headers should be unzipped in the `wx.mod/include/` folder. It will create a new folder called `wx`.


Windows users might also be interested in reading SubversionExampleSetupForWindows, which has a step-by-step for using the Subversion command-line client.