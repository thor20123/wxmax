# Overview #

The GUI Mac build of a BlitzMax app runs as a Cocoa App, as well as defining its own App / Apple Menu. Both of these facts cause issues when using wxWidgets for the following reasons :
  * wxWidgets is Carbon-based, and therefore won't work properly when launch from a Cocoa base.
  * It defines **its** own App Menu, which results in the App Menu not working properly at all.

# The Workaround #

We've got a special [AppStubModule](http://code.google.com/p/maxmods/wiki/AppStubModule)  available to download from [here](http://code.google.com/p/maxmods/downloads/list?can=2&q=appstub&colspec=Filename+Summary+Uploaded+Size+DownloadCount), which is designed to overcome the above issues.

## Usage ##

There are several different methods available for compiling your applications using the custom appstub :

### From the command-line ###
You might compile your application on the command-line with something like :
```
bmk makeapp -t gui -r -b bah.appstub mywxapp.bmx
```

### Via Applescript ###
You can either compile/run this from the script editor, or run the compiled script by double-clicking from the Finder :

```
(*      Brucey''s new bmk will by default use brl.appstub, but can be coerced into using another as part of its command-line params via the "-b" switch.
        e.g. bmk makeapp -t gui -d -b bah.appstub splash.bmx
        where -b expects a valid module name, which will be compiled into the application.
        
        BaH.appstub is a hacked down version of BRL.appstub for Mac/Carbon builds (ie. wxMax friendly) to be placed in mod/bah/
*)

set myApp to "Applications/Blitzmax/mod/wx.mod/samples/treetest" -- replace with your app path and filename

set myBuildMode to "d" -- replace with "r" for release mode

set myBlitzMaxPath to "Applications/Blitzmax/"

set myBuild to myBlitzMaxPath & "bin/bmk makeapp -t gui -" & myBuildMode & " -b bah.appstub " & myApp

do shell script myBuild

if myBuildMode = "d" then
        set myExe to ".debug.app"
else
        set myExe to ".app"
end if

do shell script "open " & myApp & myExe
```

### Customized IDE ###
We have a customized version of the IDE source available in the [Downloads](http://code.google.com/p/wxmax/downloads/list) section, which includes the extra options for building using the custom appstub.