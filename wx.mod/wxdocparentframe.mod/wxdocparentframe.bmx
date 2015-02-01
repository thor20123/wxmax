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

Rem
bbdoc: wxDocParentFrame
End Rem
Module wx.wxDocParentFrame

ModuleInfo "Version: 1.00"
ModuleInfo "License: MIT"
ModuleInfo "Author: Bruce A Henderson"
ModuleInfo "Copyright: (c) 2007-2015 Bruce A Henderson"


?linux
ModuleInfo "CC_OPTS: -D__WXGTK__"
ModuleInfo "CC_OPTS: -D_FILE_OFFSET_BITS=64"
ModuleInfo "CC_OPTS: -D_LARGE_FILES"
ModuleInfo "CC_OPTS: -DWX_PRECOMP"
?win32
ModuleInfo "CC_OPTS: -DHAVE_W32API_H"
ModuleInfo "CC_OPTS: -D__WXMSW__"
ModuleInfo "CC_OPTS: -D_UNICODE"
ModuleInfo "CC_OPTS: -DUNICODE"
?macos
ModuleInfo "CC_OPTS: -D__WXOSX_COCOA__"
ModuleInfo "CC_OPTS: -D_FILE_OFFSET_BITS=64"
ModuleInfo "CC_OPTS: -D_LARGE_FILES"
ModuleInfo "CC_OPTS: -DWX_PRECOMP"
?

Import "common.bmx"

Rem
bbdoc: Provides a default top-level frame for applications using the document/view framework.
about: This type can only be used for SDI (not MDI) parent frames.
End Rem
Type wxDocParentFrame Extends wxFrame

	Function CreateDocParentFrame:wxDocParentFrame(manager:wxDocManager, parent:wxFrame, id:Int, title:String, ..
			x:Int = -1, y:Int = -1, w:Int = -1, h:Int = -1, style:Int = wxDEFAULT_FRAME_STYLE)
		Return New wxDocParentFrame.CreateDP(manager, parent, id, title, x, y, w, h, style)
	End Function
	
	Method CreateDP:wxDocParentFrame(manager:wxDocManager, parent:wxFrame, id:Int, title:String, ..
			x:Int = -1, y:Int = -1, w:Int = -1, h:Int = -1, style:Int = wxDEFAULT_FRAME_STYLE)
		If parent Then
			wxObjectPtr = bmx_wxdocparentframe_create(Self, manager.wxObjectPtr, parent.wxObjectPtr, id, title, x, y, w, h, style)
		Else
			wxObjectPtr = bmx_wxdocparentframe_create(Self, manager.wxObjectPtr, Null, id, title, x, y, w, h, style)
		End If
		OnInit()
		Return Self
	End Method

	Method GetDocumentManager:wxDocManager()
		Return wxDocManager._find(bmx_wxdocparentframe_getdocumentmanager(wxObjectPtr))
	End Method
	
End Type

