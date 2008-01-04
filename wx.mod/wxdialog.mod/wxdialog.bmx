' Copyright (c) 2007,2008 Bruce A Henderson
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
bbdoc: wxDialog
End Rem
Module wx.wxDialog

ModuleInfo "Version: 1.00"
ModuleInfo "License: MIT"
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
bbdoc: A dialog box is a window with a title bar and sometimes a system menu, which can be moved around the screen.
about: It can contain controls and other windows and is often used to allow the user to make some
choice or to answer a question.
End Rem
Type wxDialog Extends wxTopLevelWindow

	Rem
	bbdoc: Creates a new wxDialog.
	End Rem
	Function CreateDialog:wxDialog(parent:wxWindow, id:Int, title:String, x:Int = -1, y:Int = -1, ..
			w:Int = -1, h:Int = -1, style:Int = wxDEFAULT_DIALOG_STYLE)
		Return New wxDialog.Create_(parent, id, title, x, y, w, h, style)
	End Function
	
	Rem
	bbdoc: Creates a new wxDialog.
	End Rem
	Method Create_:wxDialog(parent:wxWindow, id:Int, title:String, x:Int = -1, y:Int = -1, ..
			w:Int = -1, h:Int = -1, style:Int = wxDEFAULT_DIALOG_STYLE)
		wxObjectPtr = bmx_wxdialog_create(Self, parent.wxObjectPtr, id, title, x, y, w, h, style)
		OnInit()
		Return Self
	End Method
	
	Rem
	bbdoc: Centres the dialog box on the display.
	End Rem
	Method Centre(direction:Int = wxBOTH)
		bmx_wxdialog_centre(wxObjectPtr, direction)
	End Method
	
	Rem
	bbdoc: Creates a sizer with standard buttons.
	about: @flags is a bit list of the following flags: wxOK, wxCANCEL, wxYES, wxNO, wxHELP,
	wxNO_DEFAULT.
	<p>
	The sizer lays out the buttons in a manner appropriate to the platform.
	</p>
	<p>
	This method uses CreateStdDialogButtonSizer internally for most platforms but doesn't create
	the sizer at all for the platforms with hardware buttons (such as smartphones) for which
	it sets up the hardware buttons appropriately and returns NULL, so don't forget to test that
	the return value is valid before using it.
	</p>
	End Rem
	Method CreateButtonSizer:wxSizer(flags:Int)
		Return wxSizer._find(bmx_wxdialog_createbuttonsizer(wxObjectPtr, flags))
	End Method
	
	Rem
	bbdoc: Creates a sizer with standard buttons using CreateButtonSizer separated from the rest of the dialog contents by a horizontal wxStaticLine.
	about: Please notice that just like CreateButtonSizer() this function may return NULL if
	no buttons were created.
	End Rem
	Method CreateSeparatedButtonSizer:wxSizer(flags:Int)
		Return wxSizer._find(bmx_wxdialog_createseparatedbuttonsizer(wxObjectPtr, flags))
	End Method
	
	Rem
	bbdoc: Creates a wxStdDialogButtonSizer with standard buttons.
	about: @flags is a bit list of the following flags: wxOK, wxCANCEL, wxYES, wxNO, wxHELP,
	wxNO_DEFAULT.
	<p>
	The sizer lays out the buttons in a manner appropriate to the platform.
	</p>
	End Rem
	Method CreateStdDialogButtonSizer:wxStdDialogButtonSizer(flags:Int)
		Return wxStdDialogButtonSizer._create(bmx_wxdialog_createstddialogbuttonsizer(wxObjectPtr, flags))
	End Method
	
	Rem
	bbdoc: Ends a modal dialog, passing a value to be returned from the wxDialog::ShowModal invocation.
	End Rem
	Method EndModal(retCode:Int)
		bmx_wxdialog_endmodal(wxObjectPtr, retCode)
	End Method
	
	Rem
	bbdoc: Gets the identifier of the button which works like standard OK button in this dialog.
	End Rem
	Method GetAffirmativeId:Int()
		Return bmx_wxdialog_getaffirmativeid(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Gets the identifier of the button to map presses of ESC button to.
	End Rem
	Method GetEscapeId:Int()
		Return bmx_wxdialog_getescapeid(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Gets the return code for this window.
	about: A return code is normally associated with a modal dialog, where wxDialog::ShowModal
	returns a code to the application.
	End Rem
	Method GetReturnCode:Int()
		Return bmx_wxdialog_getreturncode(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Iconizes or restores the dialog. Windows only.
	about: Note that in Windows, iconization has no effect since dialog boxes cannot be iconized.
	However, calling Iconize(false) will bring the window to the front, as does Show(true).
	End Rem
	Method Iconize(value:Int)
		bmx_wxdialog_iconize(wxObjectPtr, value)
	End Method
	
	Rem
	bbdoc: Returns true if the dialog box is iconized. Windows only.
	about: Always returns false under Windows since dialogs cannot be iconized.
	End Rem
	Method IsIconized:Int()
		Return bmx_wxdialog_isiconized(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the dialog box is modal, false otherwise.
	End Rem
	Method IsModal:Int()
		Return bmx_wxdialog_ismodal(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Sets the identifier to be used as OK button.
	about: When the button with this identifier is pressed, the dialog calls Validate and wxWindow::TransferDataFromWindow
	and, if they both return true, closes the dialog with wxID_OK return code.
	<p>
	By default, the affirmative id is wxID_OK.
	</p>
	End Rem
	Method SetAffirmativeId(id:Int)
		bmx_wxdialog_setaffirmativeid(wxObjectPtr, id)
	End Method
	
	Rem
	bbdoc: Sets the identifier of the button which should work like the standard CANCEL button in this dialog.
	about: When the button with this id is clicked, the dialog is closed. Also, when the user
	presses ESC key in the dialog or closes the dialog using the close button in the title bar,
	this is mapped to the click of the button with the specified id.
	<p>
	By default, the escape id is the special value wxID_ANY meaning that wxID_CANCEL button is
	used if it's present in the dialog and otherwise the button with GetAffirmativeId() is used.
	Another special value for id is wxID_NONE meaning that ESC presses should be ignored. If
	any other value is given, it is interpreted as the id of the button to map the escape key
	to.
	</p>
	End Rem
	Method SetEscapeId(id:Int)
		bmx_wxdialog_setescapeid(wxObjectPtr, id)
	End Method
	
	Rem
	bbdoc: Sets the icon for this dialog.
	End Rem
	Method SetIcon(icon:wxIcon)
		bmx_wxdialog_seticon(wxObjectPtr, icon.wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetIcons()
	End Method
	
	Rem
	bbdoc: NB: This function is deprecated and doesn't work for all ports, just use ShowModal to show a modal dialog instead.
	End Rem
	Method SetModal(flag:Int)
		'bmx_wxdialog_setmodal(wxObjectPtr, flag)
	End Method
	
	Rem
	bbdoc: Sets the return code for this window.
	about: A return code is normally associated with a modal dialog, where wxDialog::ShowModal
	returns a code to the application. The function wxDialog::EndModal calls SetReturnCode.
	End Rem
	Method SetReturnCode(retCode:Int)
		bmx_wxdialog_setreturncode(wxObjectPtr, retCode)
	End Method
	
	Rem
	bbdoc: Hides or shows the dialog.
	about: The preferred way of dismissing a modal dialog is to use wxDialog::EndModal.
	End Rem
	Method Show:Int(value:Int)
		Return bmx_wxdialog_show(wxObjectPtr, value)
	End Method
	
	Rem
	bbdoc: Shows a modal dialog.
	about: Program flow does not return until the dialog has been dismissed with wxDialog::EndModal.
	End Rem
	Method ShowModal:Int()
		Return bmx_wxdialog_showmodal(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Frees the Dialog object from memory.
	End Rem
	Method Free()
		If wxObjectPtr Then
			bmx_wxdialog_free(wxObjectPtr)
			wxObjectPtr = Null
		End If
	End Method
	
	Method Delete()
		Free()
	End Method
	
End Type

