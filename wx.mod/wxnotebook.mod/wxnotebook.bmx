' Copyright (c) 2007-2011 Bruce A Henderson
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
bbdoc: wxNotebook
End Rem
Module wx.wxNotebook

ModuleInfo "Version: 1.00"
ModuleInfo "License: MIT"
ModuleInfo "Author: Bruce A Henderson"
ModuleInfo "Copyright: (c) 2007-2011 Bruce A Henderson"


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
ModuleInfo "CC_OPTS: -D__WXOSX_CARBON__"
ModuleInfo "CC_OPTS: -D_FILE_OFFSET_BITS=64"
ModuleInfo "CC_OPTS: -D_LARGE_FILES"
ModuleInfo "CC_OPTS: -DWX_PRECOMP"
?

Import "common.bmx"



Rem
bbdoc: This type represents a notebook control, which manages multiple windows with associated tabs.
aboud: To use the type, create a wxNotebook object and call AddPage or InsertPage, passing a window to be used
as the page. Do not explicitly delete the window for a page that is currently managed by wxNotebook.
End Rem
Type wxNotebook Extends wxBookCtrlBase

	Function _create:wxNotebook(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local this:wxNotebook = New wxNotebook
			this.wxObjectPtr = wxObjectPtr
			Return this
		End If
	End Function
	
	Function _xrcNew:wxNotebook(wxObjectPtr:Byte Ptr)
		Return wxNotebook._create(wxObjectPtr)
	End Function

	Rem
	bbdoc: 
	End Rem
	Function CreateNotebook:wxNotebook(parent:wxWindow, id:Int, x:Int = -1, y:Int = -1, w:Int = -1, h:Int = -1, style:Int = 0)
		Return New wxNotebook.Create(parent, id, x, y, w, h, style)
	End Function
	
	Rem
	bbdoc: 
	End Rem
	Method Create:wxNotebook(parent:wxWindow, id:Int, x:Int = -1, y:Int = -1, w:Int = -1, h:Int = -1, style:Int = 0)
		wxObjectPtr = bmx_wxnotebook_create(Self, parent.wxObjectPtr, id, x, y, w, h, style)
		
		OnInit()
		
		Return Self
	End Method
	
	Rem
	bbdoc: Returns the number of rows in the notebook control.
	End Rem
	Method GetRowCount:Int()
		Return bmx_wxnotebook_getrowcount(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: If running under Windows and themes are enabled for the application, this method returns a suitable colour for painting the background of a notebook page, and can be passed to SetBackgroundColour.
	about: Otherwise, an uninitialised colour will be returned.
	End Rem
	Method GetThemeBackgroundColour:wxColour()
		Return wxColour._create(bmx_wxnotebook_getthemebackgroundcolour(wxObjectPtr))
	End Method
	
	Rem
	bbdoc: Sets the amount of space around each page's icon and label, in pixels.
	about: NB: The vertical padding cannot be changed in wxGTK.
	End Rem
	Method SetPadding(width:Int, height:Int)
		bmx_wxnotebook_setpadding(wxObjectPtr, width, height)
	End Method
	
End Type

Rem
bbdoc: This type represents the events generated by a notebook control: currently, there are two of them.
about: The PAGE_CHANGING event is sent before the current page is changed. It allows the program to
examine the current page (which can be retrieved with GetOldSelection()) and to veto the page change
by calling Veto() if, for example, the current values in the controls of the old page are invalid.
<p>
The second event - PAGE_CHANGED - is sent after the page has been changed and the program cannot veto it
any more, it just informs it about the page change.
</p>
<p>
To summarize, if the program is interested in validating the page values before allowing the user to
change it, it should process the PAGE_CHANGING event, otherwise PAGE_CHANGED is probably enough.
In any case, it is probably unnecessary to process both events at once.
</p>
End Rem
Type wxNotebookEvent Extends wxBookCtrlEvent

	Function Create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxNotebookEvent = New wxNotebookEvent
		
		this.init(wxEventPtr, evt)
		
		Return this
	End Function
	
End Type

Type TNotebookEventFactory Extends TEventFactory

	Method CreateEvent:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
	
		Select evt.eventType
			Case wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED, ..
					wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING
				Return wxNotebookEvent.Create(wxEventPtr, evt)
		End Select
		
		Return Null
	End Method

	Method GetEventType:Int(eventType:Int)
		Select eventType
			Case wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED, ..
					wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING
				Return bmx_wxbookctrlbase_geteventtype(eventType)
		End Select
	End Method

End Type

New TNotebookEventFactory


Type TNotebookResourceFactory Extends TXMLResourceFactory

	Method AddHandler()
		bmx_wxnotebook_addresourcehandler()
	End Method
		
End Type

New TNotebookResourceFactory
