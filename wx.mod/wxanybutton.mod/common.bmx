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
Import wx.wxControl
Import BRL.Blitz


' headers :-)
?linuxx86
Import "../lib/linux/wx/include/gtk2-unicode-release-static/*.h"
?linuxx64
Import "../lib/linuxx64/wx/include/gtk2-unicode-release-static/*.h"
?win32x86
Import "../lib/win32/mswu/*.h"
?win32x64
Import "../lib/win32x64/mswu/*.h"
?macosppc
Import "../lib/macosppc/wx/include/mac-unicode-release-static/*.h"
?macosx86
Import "../lib/macosx86/wx/include/mac-unicode-release-static/*.h"
?macosx64
Import "../lib/macosx64/wx/include/mac-unicode-release-static/*.h"
?raspberrypi
Import "../lib/raspberrypi/wx/include/gtk2-unicode-release-static/*.h"
?
Import "../include/*.h"

Import "glue.cpp"

Extern

	Function bmx_wxanybutton_getbitmap:Byte Ptr(handle:Byte Ptr)
	Function bmx_wxanybutton_getbitmapcurrent:Byte Ptr(handle:Byte Ptr)
	Function bmx_wxanybutton_getbitmapdisabled:Byte Ptr(handle:Byte Ptr)
	Function bmx_wxanybutton_getbitmapfocus:Byte Ptr(handle:Byte Ptr)
	Function bmx_wxanybutton_getbitmaplabel:Byte Ptr(handle:Byte Ptr)
	Function bmx_wxanybutton_getbitmappressed:Byte Ptr(handle:Byte Ptr)
	Function bmx_wxanybutton_setbitmap(handle:Byte Ptr, bitmap:Byte Ptr, dir:Int)
	Function bmx_wxanybutton_setbitmapcurrent(handle:Byte Ptr, bitmap:Byte Ptr)
	Function bmx_wxanybutton_setbitmapdisabled(handle:Byte Ptr, bitmap:Byte Ptr)
	Function bmx_wxanybutton_setbitmapfocus(handle:Byte Ptr, bitmap:Byte Ptr)
	Function bmx_wxanybutton_setbitmaplabel(handle:Byte Ptr, bitmap:Byte Ptr)
	Function bmx_wxanybutton_setbitmappressed(handle:Byte Ptr, bitmap:Byte Ptr)
	Function bmx_wxanybutton_getbitmapmargins(handle:Byte Ptr, x:Int Ptr, y:Int Ptr)
	Function bmx_wxanybutton_setbitmapposition(handle:Byte Ptr, dir:Int)
	Function bmx_wxanybutton_setbitmapmargins(handle:Byte Ptr, x:Int, y:Int)
	
End Extern