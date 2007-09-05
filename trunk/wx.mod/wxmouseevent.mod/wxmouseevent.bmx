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
bbdoc: wxMouseEvent
End Rem
Module wx.wxMouseEvent

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
bbdoc: This event type contains information about the events generated by the mouse: they include mouse buttons press and release events and mouse move events.
about: All mouse events involving the buttons use wxMOUSE_BTN_LEFT for the left mouse button,
wxMOUSE_BTN_MIDDLE for the middle one and wxMOUSE_BTN_RIGHT for the right one. Note that not all mice
have a middle button so a portable application should avoid relying on the events from it.
<p>
NB: Note the difference between methods like LeftDown and LeftIsDown: the former returns true when
the event corresponds to the left mouse button click while the latter returns true if the left mouse
button is currently being pressed. For example, when the user is dragging the mouse you can use
LeftIsDown to test whether the left mouse button is (still) depressed. Also, by convention, if LeftDown
returns true, LeftIsDown will also return true in wxWidgets whatever the underlying GUI behaviour is
(which is platform-dependent). The same applies, of course, to other mouse buttons as well.
</p>
End Rem
Type wxMouseEvent Extends wxEvent

	Function create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxMouseEvent = New wxMouseEvent
		
		this.wxEventPtr = wxEventPtr
		this.userData = evt.userData
		this.parent = evt.parent
		
		Return this
	End Function

	Rem
	bbdoc: Returns true if the Alt key was down at the time of the event.
	End Rem
	Method AltDown:Int()
		Return bmx_wxmouseevent_altdown(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the identified mouse button is changing state.
	about: Valid values of @but are:
	<table width="90%" align="center">
	<tr><th>Constant</th><th>Description</th></tr>
	<tr><td>wxMOUSE_BTN_LEFT</td><td>check if left button was pressed</td></tr>
	<tr><td>wxMOUSE_BTN_MIDDLE</td><td>check if middle button was pressed</td></tr>
	<tr><td>wxMOUSE_BTN_RIGHT</td><td>check if right button was pressed</td></tr>
	<tr><td>wxMOUSE_BTN_ANY</td><td>check if any button was pressed</td></tr>
	</table>
	End Rem
	Method Button:Int(but:Int)
		Return bmx_wxmouseevent_button(wxEventPtr, but)
	End Method
	
	Rem
	bbdoc: If the argument is omitted, this returns true if the event was a mouse double click event.
	about: Otherwise the argument specifies which double click event was generated (see #Button for the
	possible values).
	End Rem
	Method ButtonDClick:Int(but:Int = wxMOUSE_BTN_ANY)
		Return bmx_wxmouseevent_buttondclick(wxEventPtr, but)
	End Method
	
	Rem
	bbdoc: If the argument is omitted, this returns true if the event was a mouse button down event.
	about: Otherwise the argument specifies which button-down event was generated (see #Button for the
	possible values).
	End Rem
	Method ButtonDown:Int(but:Int = -1)
		Return bmx_wxmouseevent_buttondown(wxEventPtr, but)
	End Method
	
	Rem
	bbdoc: If the argument is omitted, this returns true if the event was a mouse button up event.
	about: Otherwise the argument specifies which button-up event was generated (see #Button for the
	possible values).
	End Rem
	Method ButtonUp:Int(but:Int = -1)
		Return bmx_wxmouseevent_buttonup(wxEventPtr, but)
	End Method
	
	Rem
	bbdoc: Same as #MetaDown under Mac, same as #ControlDown elsewhere.
	End Rem
	Method CmdDown:Int()
		Return bmx_wxmouseevent_cmddown(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the control key was down at the time of the event.
	End Rem
	Method ControlDown:Int()
		Return bmx_wxmouseevent_controldown(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if this was a dragging event (motion while a button is depressed).
	End Rem
	Method Dragging:Int()
		Return bmx_wxmouseevent_dragging(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the mouse was entering the window.
	End Rem
	Method Entering:Int()
		Return bmx_wxmouseevent_entering(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns the mouse button which generated this event or wxMOUSE_BTN_NONE if no button is involved (for mouse move, enter or leave event, for example).
	about: Otherwise wxMOUSE_BTN_LEFT is returned for the left button down, up and double click events,
	wxMOUSE_BTN_MIDDLE and wxMOUSE_BTN_RIGHT for the same events for the middle and the right buttons
	respectively.
	End Rem
	Method GetButton:Int()
		Return bmx_wxmouseevent_getbutton(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Sets @x and @y to the position at which the event occurred.
	about: Note that if the mouse event has been artificially generated from a special keyboard
	combination (e.g. under Windows when the "menu'' key is pressed), the returned position is
	wxDefaultPosition.
	End Rem
	Method GetPosition(x:Int Var, y:Int Var)
		bmx_wxmouseevent_getposition(wxEventPtr, Varptr x, Varptr y)
	End Method
	
	Rem
	bbdoc: Not *yet* implemented
	End Rem
	Method GetLogicalPosition()
	End Method
	
	Rem
	bbdoc: Returns the configured number of lines (or whatever) to be scrolled per wheel action.
	about: Defaults to three.
	End Rem
	Method GetLinesPerAction:Int()
		Return bmx_wxmouseevent_getlinesperaction(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Get wheel rotation, positive or negative indicates direction of rotation.
	about: Current devices all send an event when rotation is at least +/-WheelDelta, but finer
	resolution devices can be created in the future. Because of this you shouldn't assume that one
	event is equal to 1 line, but you should be able to either do partial line scrolling or wait until
	several events accumulate before scrolling.
	End Rem
	Method GetWheelRotation:Int()
		Return bmx_wxmouseevent_getwheelrotation(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Get wheel delta, normally 120.
	about: This is the threshold for action to be taken, and one such action (for example, scrolling
	one increment) should occur for each delta.
	End Rem
	Method GetWheelDelta:Int()
		Return bmx_wxmouseevent_getwheeldelta(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns X coordinate of the physical mouse event position.
	End Rem
	Method GetX:Int()
		Return bmx_wxmouseevent_getx(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns Y coordinate of the physical mouse event position.
	End Rem
	Method GetY:Int()
		Return bmx_wxmouseevent_gety(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the event was a mouse button event (not necessarily a button down event - that may be tested using ButtonDown).
	End Rem
	Method IsButton:Int()
		Return bmx_wxmouseevent_isbutton(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the system has been setup to do page scrolling with the mouse wheel instead of line scrolling.
	End Rem
	Method IsPageScroll:Int()
		Return bmx_wxmouseevent_ispagescroll(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the mouse was leaving the window.
	End Rem
	Method Leaving:Int()
		Return bmx_wxmouseevent_leaving(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the event was a left double click.
	End Rem
	Method LeftDClick:Int()
		Return bmx_wxmouseevent_leftdclick(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the left mouse button changed to down.
	End Rem
	Method LeftDown:Int()
		Return bmx_wxmouseevent_leftdown(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the left mouse button is currently down, independent of the current event type.
	about: Please notice that it is not the same as LeftDown which returns true if the event was
	generated by the left mouse button being pressed. Rather, it simply describes the state of the
	left mouse button at the time when the event was generated (so while it will be true for a left
	click event, it can also be true for a right click if it happened while the left mouse button
	was pressed).
	<p>
	This event is usually used in the mouse event handlers which process "move mouse" messages to
	determine whether the user is (still) dragging the mouse.
	</p>
	End Rem
	Method LeftIsDown:Int()
		Return bmx_wxmouseevent_leftisdown(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the left mouse button changed to up.
	End Rem
	Method LeftUp:Int()
		Return bmx_wxmouseevent_leftup(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the Meta key was down at the time of the event.
	End Rem
	Method MetaDown:Int()
		Return bmx_wxmouseevent_metadown(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the event was a middle double click.
	End Rem
	Method MiddleDClick:Int()
		Return bmx_wxmouseevent_middledclick(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the middle mouse button changed to down.
	End Rem
	Method MiddleDown:Int()
		Return bmx_wxmouseevent_middledown(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the middle mouse button is currently down, independent of the current event type.
	End Rem
	Method MiddleIsDown:Int()
		Return bmx_wxmouseevent_middleisdown(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the middle mouse button changed to up.
	End Rem
	Method MiddleUp:Int()
		Return bmx_wxmouseevent_middleup(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if this was a motion event and no mouse buttons were pressed.
	about: If any mouse button is held pressed, then this method returns false and Dragging returns true.
	End Rem
	Method Moving:Int()
		Return bmx_wxmouseevent_moving(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the event was a right double click.
	End Rem
	Method RightDClick:Int()
		Return bmx_wxmouseevent_rightdclick(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the right mouse button changed to down.
	End Rem
	Method RightDown:Int()
		Return bmx_wxmouseevent_rightdown(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the right mouse button is currently down, independent of the current event type.
	End Rem
	Method RightIsDown:Int()
		Return bmx_wxmouseevent_rightisdown(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the right mouse button changed to up.
	End Rem
	Method RightUp:Int()
		Return bmx_wxmouseevent_rightup(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the shift key was down at the time of the event.
	End Rem
	Method ShiftDown:Int()
		Return bmx_wxmouseevent_shiftdown(wxEventPtr)
	End Method
	
End Type



Type TMouseEventFactory Extends TEventFactory

	Method CreateEvent:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
	
		Select evt.eventType
			Case wxEVT_ENTER_WINDOW, ..
					wxEVT_LEAVE_WINDOW, ..
					wxEVT_LEFT_DOWN, ..
					wxEVT_LEFT_UP, ..
					wxEVT_LEFT_DCLICK, ..
					wxEVT_MIDDLE_DOWN, ..
					wxEVT_MIDDLE_UP, ..
					wxEVT_MIDDLE_DCLICK, ..
					wxEVT_RIGHT_DOWN, ..
					wxEVT_RIGHT_UP, ..
					wxEVT_RIGHT_DCLICK, ..
					wxEVT_MOTION, ..
					wxEVT_MOUSEWHEEL
				Return wxMouseEvent.create(wxEventPtr, evt)
		End Select
		
		Return Null
	End Method

	Method GetEventType:Int(eventType:Int)
		Select eventType
			Case wxEVT_ENTER_WINDOW, ..
					wxEVT_LEAVE_WINDOW, ..
					wxEVT_LEFT_DOWN, ..
					wxEVT_LEFT_UP, ..
					wxEVT_LEFT_DCLICK, ..
					wxEVT_MIDDLE_DOWN, ..
					wxEVT_MIDDLE_UP, ..
					wxEVT_MIDDLE_DCLICK, ..
					wxEVT_RIGHT_DOWN, ..
					wxEVT_RIGHT_UP, ..
					wxEVT_RIGHT_DCLICK, ..
					wxEVT_MOTION, ..
					wxEVT_MOUSEWHEEL
				Return bmx_eventtype_value(eventType)
		End Select
	End Method

End Type

New TMouseEventFactory
