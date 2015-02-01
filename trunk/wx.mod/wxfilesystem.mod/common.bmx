' Copyright (c) 2007-2015 Bruce A Henderson
' 
' Permission is hereby granted, free of charge, to any person obtaining a copy
' of this software and associated documentation files (the "Software"), to deal
' in the Software without restriction, including without limitation the rights
' to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
' copies of the Software, and to permit persons to whom the Software is
' furnished to do so, subject to the following conditions:
' 
' The above copyright notice and this permission notice shall be included in
' all copies or substantial portions of the Software.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
' IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
' FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
' AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
' LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
' OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
' THE SOFTWARE.
' 
SuperStrict

Import wx.wx
Import wx.wxFileSystemHandler
Import wx.wxFileName
Import wx.wxFSFile
Import BRL.Blitz


' headers :-)
?linux
Import "../lib/linux/wx/include/gtk2-unicode-release-static/*.h"
Import "../include/*.h"
?win32
Import "../lib/win32/mswu/*.h"
Import "../include/*.h"
?macosppc
Import "../lib/macosppc/wx/include/mac-unicode-release-static/*.h"
Import "../include/*.h"
?macosx86
Import "../lib/macosx86/wx/include/mac-unicode-release-static/*.h"
Import "../include/*.h"
?

Import "glue.cpp"

Extern

	Function bmx_wxfilesystem_create:Byte Ptr()
	Function bmx_wxfilesystem_delete(handle:Byte Ptr)
	Function bmx_wxfilesystem_addhandler(handler:Byte Ptr)
	Function bmx_wxfilesystem_hashandlerforpath:Int(location:String)
	Function bmx_wxfilesystem_changepathto(handle:Byte Ptr, location:String, isDir:Int)
	Function bmx_wxfilesystem_getpath:String(handle:Byte Ptr)
	Function bmx_wxfilesystem_filenametourl:String(filename:Byte Ptr)
	Function bmx_wxfilesystem_findfileinpath:String(handle:Byte Ptr, path:String, file:String)
	Function bmx_wxfilesystem_findfirst:String(handle:Byte Ptr, wildcard:String, flags:Int)
	Function bmx_wxfilesystem_findnext:String(handle:Byte Ptr)
	Function bmx_wxfilesystem_urltofilename:Byte Ptr(url:String)
	Function bmx_wxfilesystem_openfile:Byte Ptr(handle:Byte Ptr, location:String, flags:Int)
	
End Extern

Const wxFS_READ:Int = 1       ' Open For reading
Const wxFS_SEEKABLE:Int = 4   ' Returned stream will be seekable 

