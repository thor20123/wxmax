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
bbdoc: wxFontPickerCtrl
End Rem
Module wx.wxFontPickerCtrl

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
bbdoc: This control allows the user to select a font.
about: The generic implementation is a button which brings up a wxFontDialog when clicked. Native
implementation may differ but this is usually a (small) widget which give access to the font-chooser dialog.
End Rem
Type wxFontPickerCtrl Extends wxPickerBase

	Function _create:wxFontPickerCtrl(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local this:wxFontPickerCtrl = New wxFontPickerCtrl
			this.wxObjectPtr = wxObjectPtr
			Return this
		End If
	End Function
	
	Function _xrcNew:wxFontPickerCtrl(wxObjectPtr:Byte Ptr)
		Return wxFontPickerCtrl._create(wxObjectPtr)
	End Function

	Function CreateFontPicker:wxFontPickerCtrl(parent:wxWindow, id:Int, font:wxFont = Null, ..
			x:Int = -1, y:Int = -1, w:Int = -1, h:Int = -1, style:Int = wxFNTP_DEFAULT_STYLE)
		Return New wxFontPickerCtrl.Create(parent, id, font, x, y, w, h, style)
	End Function
	
	Rem
	bbdoc: Creates a new wxFilePickerCtrl.
	End Rem
	Method Create:wxFontPickerCtrl(parent:wxWindow, id:Int, font:wxFont = Null, ..
			x:Int = -1, y:Int = -1, w:Int = -1, h:Int = -1, style:Int = wxFNTP_DEFAULT_STYLE)
		If font Then
			wxObjectPtr = bmx_wxfontpickerctrl_create(Self, parent.wxObjectPtr, id, font.wxObjectPtr, x, y, w, h, style)
		Else
			wxObjectPtr = bmx_wxfontpickerctrl_create(Self, parent.wxObjectPtr, id, Null, x, y, w, h, style)
		End If
		
		OnInit()
		
		Return Self
	End Method

	Rem
	bbdoc: Returns the currently selected font.
	about: Note that this method is completely different from wxWindow::GetFont.
	End Rem
	Method GetSelectedFont:wxFont()
		Return wxFont._create(bmx_wxfontpickerctrl_getselectedfont(wxObjectPtr))
	End Method
	
	Rem
	bbdoc: Sets the currently selected font.
	about: Note that this method is completely different from wxWindow::SetFont.
	End Rem
	Method SetSelectedFont(font:wxFont)
		bmx_wxfontpickerctrl_setselectedfont(wxObjectPtr, font.wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Returns the maximum point size value allowed for the user-chosen font.
	End Rem
	Method GetMaxPointSize:Int()
		Return bmx_wxfontpickerctrl_getmaxpointsize(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Sets the maximum point size value allowed for the user-chosen font.
	about: The default value is 100. Note that big fonts can require a lot of memory and CPU time both
	for creation and for rendering; thus, specially because the user has the option to specify the fontsize
	through a text control (see wxFNTP_USE_TEXTCTRL), it's a good idea to put a limit to the maximum font
	size when huge fonts do not make much sense.
	End Rem
	Method SetMaxPointSize(value:Int)
		bmx_wxfontpickerctrl_setmaxpointsize(wxObjectPtr, value)
	End Method

End Type

Rem
bbdoc: This event type is used for the events generated by wxFontPickerCtrl.
End Rem
Type wxFontPickerEvent Extends wxCommandEvent

	Function Create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxFontPickerEvent = New wxFontPickerEvent
		
		this.init(wxEventPtr, evt)
		
		Return this
	End Function

	Rem
	bbdoc: Retrieve the font the user has just selected.
	End Rem
	Method GetFont:wxFont()
		Return wxFont._create(bmx_wxfontpickerevent_getfont(wxEventPtr))
	End Method
	
	Rem
	bbdoc: Set the font associated with the event.
	End Rem
	Method SetFont(font:wxFont)
		bmx_wxfontpickerevent_setfont(wxEventPtr, font.wxObjectPtr)
	End Method
	
End Type

Type TFontPickerEventFactory Extends TEventFactory

	Method CreateEvent:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
	
		If evt.eventType = wxEVT_COMMAND_FONTPICKER_CHANGED Then
			Return wxFontPickerEvent.Create(wxEventPtr, evt)
		End If
		
		Return Null
	End Method

	Method GetEventType:Int(eventType:Int)
		If eventType = wxEVT_COMMAND_FONTPICKER_CHANGED Then
			Return bmx_wxfontpickerctrl_geteventtype(eventType)
		End If
	End Method
		
End Type

New TFontPickerEventFactory

Type TFontPickerCtrlResourceFactory Extends TXMLResourceFactory

	Method AddHandler()
		bmx_wxfontpickerctrl_addresourcehandler()
	End Method
		
End Type

New TFontPickerCtrlResourceFactory
