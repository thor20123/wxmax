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
Import wx.wxHelpControllerBase
Import wx.wxHtmlHelpWindow
Import wx.wxConfig
Import wx.wxFileName
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

	Function bmx_wxhtmlhelpcontroller_create:Byte Ptr(handle:Object, style:Int, parentWindow:Byte Ptr)
	Function bmx_wxhtmlhelpcontroller_addbook:Int(handle:Byte Ptr, bookUrl:String, showWaitMsg:Int)
	Function bmx_wxhtmlhelpcontroller_addbookfile:Int(handle:Byte Ptr, file:Byte Ptr, showWaitMsg:Int)
	Function bmx_wxhtmlhelpcontroller_display(handle:Byte Ptr, x:String)
	Function bmx_wxhtmlhelpcontroller_displayid(handle:Byte Ptr, id:Int)
	Function bmx_wxhtmlhelpcontroller_displaycontents(handle:Byte Ptr)
	Function bmx_wxhtmlhelpcontroller_displayindex(handle:Byte Ptr)
	Function bmx_wxhtmlhelpcontroller_keywordsearch:Int(handle:Byte Ptr, keyword:String, mode:Int)
	Function bmx_wxhtmlhelpcontroller_readcustomization(handle:Byte Ptr, config:Byte Ptr, path:String)
	Function bmx_wxhtmlhelpcontroller_settempdir(handle:Byte Ptr, path:String)
	Function bmx_wxhtmlhelpcontroller_settitleformat(handle:Byte Ptr, format:String)
	Function bmx_wxhtmlhelpcontroller_useconfig(handle:Byte Ptr, config:Byte Ptr, rootpath:String)
	Function bmx_wxhtmlhelpcontroller_writecustomization(handle:Byte Ptr, config:Byte Ptr, path:String)
	Function bmx_wxhtmlhelpcontroller_sethelpwindow(handle:Byte Ptr, helpWindow:Byte Ptr)

End Extern
