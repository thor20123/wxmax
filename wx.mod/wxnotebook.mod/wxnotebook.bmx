' Copyright (c) 2007 Bruce A Henderson
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
ModuleInfo "License:"
ModuleInfo "Author: Bruce A Henderson"
ModuleInfo "Copyright: (c) 2007 Bruce A Henderson"
ModuleInfo "Modserver: BRL"

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
ModuleInfo "CC_OPTS: -D__WXMAC__"
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

	Function CreateNotebook:wxNotebook(parent:wxWindow, id:Int, x:Int = -1, y:Int = -1, w:Int = -1, h:Int = -1, style:Int = 0)
		Local this:wxNotebook = New wxNotebook
		
		'If parent Then
		this.wxObjectPtr = bmx_wxnotebook_create(this, parent.wxObjectPtr, id, x, y, w, h, style)
		'Else
		'	this.wxObjectPtr = bmx_wxnotebook_create(this, Null, id, x, y, w, h, style)
		'End If
		
		Return this
	End Function
	
	Rem
	bbdoc: Adds a new page.
	returns: True if successful, False otherwise.
	about: The call to this method may generate the page changing events.
	<p>
	Do not delete the page, it will be deleted by the notebook.
	</p>
	End Rem
	Method AddPage:Int(page:wxWindow, text:String, selected:Int = False, imageId:Int = -1)
		Return bmx_wxnotebook_addpage(wxObjectPtr, page.wxObjectPtr, text, selected, imageId)
	End Method

	Rem
	bbdoc: Inserts a new page at the specified position.
	returns: True if successful, False otherwise.
	End Rem
	Method InsertPage:Int(index:Int, page:wxWindow, text:String, selected:Int = False, imageId:Int = -1)
		Return bmx_wxnotebook_insertpage(wxObjectPtr, index, page.wxObjectPtr, text, selected, imageId)
	End Method

	Rem
	bbdoc: Cycles through the tabs.
	about: The call to this function generates the page changing events.
	End Rem
	Method AdvanceSelection(forward:Int = True)
		bmx_wxnotebook_advanceselection(wxObjectPtr, forward)
	End Method
	
	Rem
	bbdoc: Sets the image list for the page control and takes ownership of the list.
	End Rem
	Method AssignImageList(imageList:wxImageList)
		bmx_wxnotebook_assignimagelist(wxObjectPtr, imageList.wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method DeleteAllPages:Int()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method DeletePage:Int(page:Int)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetCurrentPage:wxWindow()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetPage:wxWindow(page:Int)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetPageCount:Int()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetPageImage:Int(page:Int)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetPageText:String(page:Int)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetRowCount:Int()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetSelection:Int()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetThemeBackgroundColour:wxColour()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method HitTest:Int(x:Int, y:Int, flags:Int Var)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method RemovePage:Int(page:Int)
	End Method
	
	Rem
	bbdoc: Sets the image list for the page control.
	about: It does not take ownership of the image list, you must delete it yourself.
	End Rem
	Method SetImageList(imageList:wxImageList)
		bmx_wxnotebook_setimagelist(wxObjectPtr, imageList.wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Sets the amount of space around each page's icon and label, in pixels.
	about: NB: The vertical padding cannot be changed in wxGTK.
	End Rem
	Method SetPadding(width:Int, height:Int)
	End Method
	
	Rem
	bbdoc: Sets the width and height of the pages.
	about: NB: This method is currently not implemented for wxGTK.
	End Rem
	Method SetPageSize(width:Int, height:Int)
	End Method
	
	Rem
	bbdoc: Sets the image index for the given page.
	about: @image is an index into the image list which was set with wxNotebook::SetImageList.
	End Rem
	Method SetPageImage:Int(page:Int, image:Int)
	End Method
	
	Rem
	bbdoc: Sets the text for the given page.
	End Rem
	Method SetPageText:Int(page:Int, text:String)
	End Method
	
	Rem
	bbdoc: Sets the selection for the given page, returning the previous selection.
	about: The call to this method generates the page changing events.
	<p>
	This method is deprecated and should not be used in new code. Please use the ChangeSelection
	method instead.
	</p>
	End Rem
	Method SetSelection:Int(page:Int)
	End Method
	
	Rem
	bbdoc: Changes the selection for the given page, returning the previous selection.
	about: The call to this method does not generate the page changing events. This is the only
	difference with SetSelection. See this topic for more info.
	End Rem
	Method ChangeSelection:Int(page:Int)
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
Type wxNotebookEvent Extends wxNotifyEvent

	Function create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxMoveEvent = New wxMoveEvent
		
		this.wxEventPtr = wxEventPtr
		this.userData = evt.userData
		this.parent = evt.parent
		
		Return this
	End Function

	Rem
	bbdoc: Returns the page that was selected before the change, -1 if none was selected.
	End Rem
	Method GetOldSelection:Int()
		Return bmx_wxnotebookevent_getoldselection(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns the currently selected page, or -1 if none was selected.
	about: Under Windows, GetSelection() will return the same value as GetOldSelection() when
	called from EVT_NOTEBOOK_PAGE_CHANGING handler and not the page which is going to be selected.
	Also note that the values of selection and old selection returned for an event generated in
	response to a call to wxNotebook::SetSelection shouldn't be trusted as they are currently
	inconsistent under different platforms (but in this case you presumably don't need them anyhow
	as you already have the corresponding information).
	End Rem
	Method GetSelection:Int()
		Return bmx_wxnotebookevent_getselection(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Sets the id of the page selected before the change.
	End Rem
	Method SetOldSelection(page:Int)
		bmx_wxnotebookevent_setoldselection(wxEventPtr, page)
	End Method
	
	Rem
	bbdoc: Sets the selection member variable.
	End Rem
	Method SetSelection(page:Int)
		bmx_wxnotebookevent_setselection(wxEventPtr, page)
	End Method
	
End Type

Type TNoteBookEventFactory Extends TEventFactory

	Method CreateEvent:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
	
		Select evt.eventType
			Case wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED, ..
					wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING
				Return wxNotebookEvent.create(wxEventPtr, evt)
		End Select
		
		Return Null
	End Method

	Method GetEventType:Int(eventType:Int)
		Select eventType
			Case wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED, ..
					wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING
				Return bmx_wxnotebook_geteventtype(eventType)
		End Select
	End Method

End Type

New TNoteBookEventFactory
