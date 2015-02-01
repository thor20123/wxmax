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
Import wx.wxFrame
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

	Function bmx_wxmdiparentframe_create:Byte Ptr(handle:Object, parent:Byte Ptr, id:Int, title:String, x:Int, y:Int, w:Int, h:Int, style:Int)
	Function bmx_wxmdiparentframe_activatenext(handle:Byte Ptr)
	Function bmx_wxmdiparentframe_activateprevious(handle:Byte Ptr)
	Function bmx_wxmdiparentframe_arrangeicons(handle:Byte Ptr)
	Function bmx_wxmdiparentframe_cascade(handle:Byte Ptr)
	Function bmx_wxmdiparentframe_getclientsize(handle:Byte Ptr, width:Int Ptr, height:Int Ptr)
	Function bmx_wxmdiparentframe_getactivechild:Byte Ptr(handle:Byte Ptr)
	Function bmx_wxmdiparentframe_getclientwindow:Byte Ptr(handle:Byte Ptr)
?win32
	Function bmx_wxmdiparentframe_getwindowmenu:Byte Ptr(handle:Byte Ptr)
	Function bmx_wxmdiparentframe_setwindowmenu(handle:Byte Ptr, menu:Byte Ptr)
?
	Function bmx_wxmdiparentframe_tile(handle:Byte Ptr, orient:Int)

	Function bmx_wxmdichildframe_create:Byte Ptr(handle:Object, parent:Byte Ptr, id:Int, title:String, x:Int, y:Int, w:Int, h:Int, style:Int)
	Function bmx_wxmdichildframe_activate(handle:Byte Ptr)
	Function bmx_wxmdichildframe_maximize(handle:Byte Ptr, value:Int)
	Function bmx_wxmdichildframe_restore(handle:Byte Ptr)

	Function bmx_wxmdi_addresourcehandler()
	
End Extern
