by ArtemisX

1. **Get the latest BlitzMax-Version**

If you don't have 1.28 then get it.

2. **Getting MinGW to build wxMax**

For this please use Marks little tutorial which can be found [here](http://www.blitzbasic.com/Community/posts.php?topic=72892).

3. **Getting Subversion to get wxMax**

Download the Subversion commandline client from [here](http://subversion.tigris.org/servlets/ProjectDocumentList?folderID=91) - it's `svn-1.4.5-setup.exe` - and install it.

4. **Getting wxMax via Subversion**

Open the command line interpreter (cmd.exe) and got to your BlitzMax-Installation folder an then into the folder `mod`. Then type `svn checkout http://wxmax.googlecode.com/svn/trunk/wx.mod/` and wait until Subversion is finished.

5. **Getting the required libs and headers**

Go to http://code.google.com/p/wxmax/downloads/list and download wxwidgets\_2.8.7\_headers.zip and wxwidgets\_2.8.7\_static\_win32b.zip.
Unzip the headers in wx.mod/include/ and the libraries (static\_win32b) in `wx.mod/lib/`.

6. **Building wxMax**

Open the command line interpreter again and switch to your BlitzMax folder and then to bin. Then type `bmk makemods wx`. This will take very long - depending on you machine - maybe a half hour or more.

That's it. Try some sample codes in wx.mod/samples/.

7. **Updating wxMax**

Open the command line interpreter and got to your BlitzMax-Installation folder an then into the folder mod/wx.mod. Then type `svn update` and wait until Subversion is finished.