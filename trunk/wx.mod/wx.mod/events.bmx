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
'
' The core event stuff...
'
'
SuperStrict

Import "base.bmx"


Private
Global event_factories:TEventFactory
Public

Rem
bbdoc: 
End Rem
Type wxEvent

	Field wxEventPtr:Byte Ptr
	
	Field userData:Object
	Field parent:wxEvtHandler

	Rem
	bbdoc: Returns the identifier of the given event type, such as wxEVT_COMMAND_BUTTON_CLICKED.
	End Rem
	Method GetEventType:Int()
		Return bmx_wxevent_geteventtype(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns the identifier associated with this event, such as a button command id.
	End Rem
	Method GetId:Int()
		Return bmx_wxevent_getid(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the event handler should be skipped, false otherwise.
	End Rem
	Method GetSkipped:Int()
	End Method
	
	Rem
	bbdoc: Gets the timestamp for the event.
	about: The timestamp is the time in milliseconds since some fixed moment (not necessarily the 
	standard Unix Epoch, so only differences between the timestamps and not their absolute values
	usually make sense).
	End Rem
	Method GetTimestamp:Int()
	End Method
	
	Rem
	bbdoc: Returns true if the event is or is derived from wxCommandEvent else it returns false.
	about: Exists only for optimization purposes.
	End Rem
	Method IsCommandEvent:Int()
	End Method
	
	Rem
	bbdoc: Sets the propagation level to the given value (for example returned from an earlier call to
	StopPropagation).
	End Rem
	Method ResumePropagation(propagationLevel:Int)
	End Method
	
	Rem
	bbdoc: Test if this event should be propagated or not, i.e. if the propagation level is currently greater than 0.
	End Rem
	Method ShouldPropagate:Int()
	End Method
	
	Rem
	bbdoc: This method can be used inside an event handler to control whether further event handlers bound to this event will be called after the current one returns.
	about: Without Skip() (or equivalently if Skip(false) is used), the event will not be processed any more.
	If Skip(true) is called, the event processing system continues searching for a further handler function
	for this event, even though it has been processed already in the current handler.
	<p>
	In general, it is recommended to skip all non-command events to allow the default handling to take
	place. The command events are, however, normally not skipped as usually a single command such as a
	button click or menu item selection must only be processed by one handler.
	</p>
	End Rem
	Method Skip(_skip:Int = True)
		bmx_wxevent_skip(wxEventPtr, _skip)
	End Method
	
	Rem
	bbdoc: Stop the event from propagating to its parent window.
	about: Returns the old propagation level value which may be later passed to ResumePropagation to
	allow propagating the event again.
	End Rem
	Method StopPropagation:Int()
	End Method
	
	
End Type

Rem
bbdoc: This event type contains information about command events, which originate from a variety of simple controls.
about: More complex controls, such as wxTreeCtrl, have separate command event classes.
End Rem
Type wxCommandEvent Extends wxEvent

	Function create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxCommandEvent = New wxCommandEvent
		
		this.wxEventPtr = wxEventPtr
		this.userData = evt.userData
		this.parent = evt.parent
		
		Return this
	End Function
	
	Rem
	bbdoc: Returns item index for a listbox or choice selection event (not valid for a deselection).
	End Rem
	Method GetSelection:Int()
		Return bmx_wxcommandevent_getselection(wxEventPtr)
	End Method
	
	Rem
	bbdoc: This method can be used with checkbox and menu events.
	about: For the checkboxes, the method returns true for a selection event and false for a deselection one.
	For the menu events, this method indicates if the menu item just has become checked or unchecked
	(and thus only makes sense for checkable menu items).
	End Rem
	Method IsChecked:Int()
		Return bmx_wxcommandevent_ischecked(wxEventPtr)
	End Method
	
	Rem
	bbdoc: For a listbox or similar event, returns True if it is a selection, False if it is a deselection.
	End Rem
	Method IsSelection:Int()
		Return bmx_wxcommandevent_isselection(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns item string for a listbox or choice selection event (not valid for a deselection).
	End Rem
	Method GetString:String()
		Return bmx_wxcommandevent_getstring(wxEventPtr)
	End Method

	Rem
	bbdoc: Returns extra information dependant on the event objects type.
	about: If the event comes from a listbox selection, it is a boolean determining whether the event was a
	selection (true) or a deselection (false). A listbox deselection only occurs for multiple-selection boxes,
	and in this case the index and string values are indeterminate and the listbox must be examined by the
	application.
	End Rem
	Method GetExtra:Int()
		Return bmx_wxcommandevent_getextralong(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns the integer identifier corresponding to a listbox, choice or radiobox selection (only if the event was a selection, not a deselection), or a boolean value representing the value of a checkbox.
	End Rem
	Method GetInt:Int()
		Return bmx_wxcommandevent_getint(wxEventPtr)
	End Method

End Type

Rem
bbdoc: This event type contains information about window and session close events.
about: The handler function for EVT_CLOSE is called when the user has tried to close a a frame or
dialog box using the window manager (X) or system menu (Windows). It can also be invoked by the
application itself programmatically, for example by calling the wxWindow::Close function.
<p>
You should check whether the application is forcing the deletion of the window using wxCloseEvent::CanVeto.
If this is false, you must destroy the window using wxWindow::Destroy. If the return value is true,
it is up to you whether you respond by destroying the window.
</p>
<p>
If you don't destroy the window, you should call wxCloseEvent::Veto to let the calling code know that
you did not destroy the window. This allows the wxWindow::Close function to return true or false depending
on whether the close instruction was honoured or not.
</p>
End Rem
Type wxCloseEvent Extends wxEvent
	
	Function create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxCloseEvent = New wxCloseEvent
		
		this.wxEventPtr = wxEventPtr
		this.userData = evt.userData
		this.parent = evt.parent
		
		Return this
	End Function

	Rem
	bbdoc: Returns true if you can veto a system shutdown or a window close event.
	about: Vetoing a window close event is not possible if the calling code wishes to force the
	application to exit, and so this function must be called to check this.
	End Rem
	Method CanVeto:Int()
	End Method
	
	Rem
	bbdoc: Returns true if the user is just logging off or false if the system is shutting down.
	about: This method can only be called for end session and query end session events, it doesn't make
	sense for close window event.
	End Rem
	Method GetLoggingOff:Int()
	End Method
	
	Rem
	bbdoc: Sets the 'can veto' flag.
	End Rem
	Method SetCanVeto(canVeto:Int)
	End Method
	
	Rem
	bbdoc: Sets the 'force' flag.
	End Rem
	Method SetForce(force:Int)
	End Method
	
	Rem
	bbdoc: Sets the 'logging off' flag.
	End Rem
	Method SetLoggingOff(logginOff:Int)
	End Method
	
	Rem
	bbdoc: Call this from your event handler to veto a system shutdown or to signal to the calling application that a window close did not happen.
	about: You can only veto a shutdown if wxCloseEvent::CanVeto returns true.
	End Rem
	Method Veto(_veto:Int = True)
	End Method
	
End Type

Rem
bbdoc: A move event holds information about move change events.
End Rem
Type wxMoveEvent Extends wxEvent

	Function create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxMoveEvent = New wxMoveEvent
		
		this.wxEventPtr = wxEventPtr
		this.userData = evt.userData
		this.parent = evt.parent
		
		Return this
	End Function

	Rem
	bbdoc: Returns the position of the window generating the move change event.
	End Rem
	Method GetPosition(x:Int Var, y:Int Var)
		bmx_wxmoveevent_getposition(wxEventPtr, Varptr x, Varptr y)
	End Method
	
End Type

Rem
bbdoc: This type is not used by the event handlers by itself, but is a base class for other event classes (such as wxNotebookEvent).
about: It (or an object of a derived type) is sent when the controls state is being changed and allows
the program to Veto() this change if it wants to prevent it from happening.
End Rem
Type wxNotifyEvent Extends wxCommandEvent

	Rem
	bbdoc: This is the opposite of Veto(): it explicitly allows the event to be processed.
	about: For most events it is not necessary to call this method as the events are allowed anyhow
	but some are forbidden by default (this will be mentioned in the corresponding event description).
	End Rem
	Method Allow()
		bmx_wxnotifyevent_allow(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns True if the change is allowed (Veto() hasn't been called) or False otherwise (if it was).
	End Rem
	Method IsAllowed:Int()
		Return bmx_wxnotifyevent_isallowed(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Prevents the change announced by this event from happening.
	about: It is in general a good idea to notify the user about the reasons for vetoing the change
	because otherwise the applications behaviour (which just refuses to do what the user wants) might
	be quite surprising.
	End Rem
	Method Veto()
		bmx_wxnotifyevent_veto(wxEventPtr)
	End Method
	
End Type

Rem
bbdoc: A size event holds information about size change events.
about: You may wish to use this for frames to resize their child windows as appropriate.
<p>
Note that the size passed is of the whole window: call wxWindow::GetClientSize for the area which may be
used by the application.
</p>
<p>
When a window is resized, usually only a small part of the window is damaged and you may only need to repaint
that area. However, if your drawing depends on the size of the window, you may need to clear the DC explicitly
and repaint the whole window. In which case, you may need to call wxWindow::Refresh to invalidate the entire window.
</p>
End Rem
Type wxSizeEvent Extends wxEvent

	Function create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxSizeEvent = New wxSizeEvent
		
		this.wxEventPtr = wxEventPtr
		this.userData = evt.userData
		this.parent = evt.parent
		
		Return this
	End Function

	Rem
	bbdoc: Returns the entire size of the window generating the size change event.
	End Rem
	Method GetSize(width:Int Var, height:Int Var)
		bmx_wxsizeevent_getsize(wxEventPtr, Varptr width, Varptr height)
	End Method
	
End Type

Rem
bbdoc: A paint event is sent when a window's contents needs to be repainted.
about: Please notice that in general it is impossible to change the drawing of a standard control
(such as wxButton) and so you shouldn't attempt to handle paint events for them as even if it might
work on some platforms, this is inherently not portable and won't work everywhere.
End Rem
Type wxPaintEvent Extends wxEvent

	Function create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxPaintEvent = New wxPaintEvent
		
		this.wxEventPtr = wxEventPtr
		this.userData = evt.userData
		this.parent = evt.parent
		
		Return this
	End Function

End Type


Rem
bbdoc: A scroll event holds information about events sent from scrolling windows.
End Rem
Type wxScrollWinEvent Extends wxEvent
	
	Function create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxScrollWinEvent = New wxScrollWinEvent 
		
		this.wxEventPtr = wxEventPtr
		this.userData = evt.userData
		this.parent = evt.parent
		
		Return this
	End Function


End Type

Rem
bbdoc: A scroll event holds information about events sent from stand-alone scrollbars and sliders.
about: Note that unless specifying a scroll control identifier, you will need to test for scrollbar
orientation with wxScrollEvent::GetOrientation, since horizontal and vertical scroll events are
processed using the same event handler.
End Rem
Type wxScrollEvent Extends wxCommandEvent

	Function create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxScrollEvent = New wxScrollEvent 
		
		this.wxEventPtr = wxEventPtr
		this.userData = evt.userData
		this.parent = evt.parent
		
		Return this
	End Function
	
	Rem
	bbdoc: Returns wxHORIZONTAL or wxVERTICAL, depending on the orientation of the scrollbar.
	End Rem
	Method GetOrientation:Int()
		Return bmx_wxscrollevent_getorientation(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns the position of the scrollbar.
	End Rem
	Method GetPosition:Int()
		Return bmx_wxscrollevent_getposition(wxEventPtr)
	End Method

End Type

Rem
bbdoc: This type is used for idle events, which are generated when the system becomes idle.
about: Note that, unless you do something specifically, the idle events are not sent if the system remains idle
once it has become it, e.g. only a single idle event will be generated until something else resulting in more normal
events happens and only then is the next idle event sent again. If you need to ensure a continuous stream of idle
events, you can either use RequestMore method in your handler or call wxWakeUpIdle periodically (for example from
timer event), but note that both of these approaches (and especially the first one) increase the system load and so
should be avoided if possible.
<p>
By default, idle events are sent to all windows (and also wxApp, as usual). If this is causing a significant
overhead in your application, you can call wxIdleEvent::SetMode with the value wxIDLE_PROCESS_SPECIFIED, and set the
wxWS_EX_PROCESS_IDLE extra window style for every window which should receive idle events.
</p>
End Rem
Type wxIdleEvent Extends wxEvent

	Function create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxIdleEvent = New wxIdleEvent 
		
		this.wxEventPtr = wxEventPtr
		this.userData = evt.userData
		this.parent = evt.parent
		
		Return this
	End Function

End Type

Rem
bbdoc: This type is used for context menu events, sent to give the application a chance to show a context (popup) menu.
End Rem
Type wxContextMenuEvent Extends wxCommandEvent

	Function create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxContextMenuEvent = New wxContextMenuEvent 
		
		this.wxEventPtr = wxEventPtr
		this.userData = evt.userData
		this.parent = evt.parent
		
		Return this
	End Function
	
	Rem
	bbdoc: Returns the position at which the menu should be shown.
	End Rem
	Method GetPosition(x:Int Var, y:Int Var)
		bmx_wxcontextmenuevent_getposition(wxEventPtr, Varptr x, Varptr y)
	End Method
	
	Rem
	bbdoc: Sets the position at which the menu should be shown.
	End Rem
	Method SetPosition(x:Int, y:Int)
		bmx_wxcontextmenuevent_setposition(wxEventPtr, x, y)
	End Method

End Type

' internal event handler.
Type TEventHandler

	Field parent:wxEvtHandler
	Field key:String
	Field callback(event:wxEvent)
	Field userData:Object
	Field eventType:Int
	Field id:Int
	Field lastId:Int = -1

	Function eventCallback(evt:Byte Ptr, data:Object)

		Local handler:TEventHandler = TEventHandler(data)
		
		If handler Then
			Local event:wxEvent
			
			Local factory:TEventFactory = event_factories

			While factory
				event = factory.CreateEvent(evt, handler)
				If event Exit
				factory = factory._succ
			Wend
			
			If event Then
				handler.callback(event)
			End If
		End If
		
	End Function
	
End Type


Rem
bbdoc: A type that can handle events from the windowing system.
about: wxWindow (and therefore all window classes) are derived from this class.
End Rem
Type wxEvtHandler Extends wxObject

	Rem
	bbdoc: 
	End Rem
	Method CreateHandler:wxEvtHandler()
		wxObjectPtr = bmx_wxevthandler_create(Self)
		OnInit()
		Return Self
	End Method
	
	Method OnInit()
	End Method

	' TODO: a map/list of event handles for this instance
	Field events:TMap = New TMap

	Rem
	bbdoc: A synonymn for ConnectAny
	End Rem
	Method ConnectNoId(eventType:Int, callback(event:wxEvent), userData:Object = Null)
		ConnectAny(eventType, callback, userData)
	End Method

	Rem
	bbdoc: Connects the given function dynamically with the event handler and event type.
	about: Use this for events that don't require an event id - like wxEVT_PAINT, or wxEVT_CLOSE.
	<p>Example,
	<pre>
	ConnectAny(wxEVT_CLOSE, func)
	</pre>
	can be used in place of the macro
	<pre>
	EVT_CLOSE(func)
	</pre>
	</p>
	End Rem
	Method ConnectAny(eventType:Int, callback(event:wxEvent), userData:Object = Null)
	
		' ********** SPECIAL CASES *************
		If eventType = wxEVT_SCROLLWIN Then
			ConnectAny(wxEVT_SCROLLWIN_TOP, callback, userData)
			ConnectAny(wxEVT_SCROLLWIN_BOTTOM, callback, userData)
			ConnectAny(wxEVT_SCROLLWIN_LINEUP, callback, userData)
			ConnectAny(wxEVT_SCROLLWIN_LINEDOWN, callback, userData)
			ConnectAny(wxEVT_SCROLLWIN_PAGEUP, callback, userData)
			ConnectAny(wxEVT_SCROLLWIN_PAGEDOWN, callback, userData)
			ConnectAny(wxEVT_SCROLLWIN_THUMBTRACK, callback, userData)
			ConnectAny(wxEVT_SCROLLWIN_THUMBRELEASE, callback, userData)
			Return
		End If
		
		If eventType = wxEVT_SCROLL Then
			ConnectAny(wxEVT_SCROLL_TOP, callback, userData)
			ConnectAny(wxEVT_SCROLL_BOTTOM, callback, userData)
			ConnectAny(wxEVT_SCROLL_LINEUP, callback, userData)
			ConnectAny(wxEVT_SCROLL_LINEDOWN, callback, userData)
			ConnectAny(wxEVT_SCROLL_PAGEUP, callback, userData)
			ConnectAny(wxEVT_SCROLL_PAGEDOWN, callback, userData)
			ConnectAny(wxEVT_SCROLL_THUMBTRACK, callback, userData)
			ConnectAny(wxEVT_SCROLL_THUMBRELEASE, callback, userData)
			ConnectAny(wxEVT_SCROLL_CHANGED, callback, userData)
			Return
		End If
	
		Local handler:TEventHandler = New TEventHandler
		' TODO: we may need parent if we are to get back to the original object that the event was generated from?
		handler.parent = Self
		handler.key = "xx.-1." + eventType
		handler.id = 0
		'handler.lastId = lastId
		handler.eventType = eventType
		handler.callback = callback
		handler.userData = userData
		
		events.insert(handler.key, handler)

		Local factory:TEventFactory = event_factories
		Local evt:Int

		While factory
			evt = factory.GetEventType(eventType)
			If evt Exit
			factory = factory._succ
		Wend
		
		If evt Then
			eventType = evt
		End If
		
		bmx_wxevthandler_connectnoid(wxObjectPtr, eventType, handler)
	End Method

	Rem
	bbdoc: Connects the given function dynamically with the event handler, id and event type.
	about: Example :
	<pre>
	ConnectAny(wxID_ABOUT, wxEVT_COMMAND_MENU_SELECTED, func)
	</pre>
	can be used in place of the macro
	<pre>
	EVT_MENU(wxID_ABOUT, func)
	</pre>
	End Rem
	Method Connect(id:Int = -1, eventType:Int, callback(event:wxEvent), userData:Object = Null)
	
		' ********** SPECIAL CASES *************
		If eventType = wxEVT_SCROLL Then
			Connect(id, wxEVT_SCROLL_TOP, callback, userData)
			Connect(id, wxEVT_SCROLL_BOTTOM, callback, userData)
			Connect(id, wxEVT_SCROLL_LINEUP, callback, userData)
			Connect(id, wxEVT_SCROLL_LINEDOWN, callback, userData)
			Connect(id, wxEVT_SCROLL_PAGEUP, callback, userData)
			Connect(id, wxEVT_SCROLL_PAGEDOWN, callback, userData)
			Connect(id, wxEVT_SCROLL_THUMBTRACK, callback, userData)
			Connect(id, wxEVT_SCROLL_THUMBRELEASE, callback, userData)
			Connect(id, wxEVT_SCROLL_CHANGED, callback, userData)
			Return
		End If

	
		Local handler:TEventHandler = New TEventHandler
		' TODO: we may need parent if we are to get back to the original object that the event was generated from?
		handler.parent = Self
		handler.key = id + ".-1." + eventType
		handler.id = id
		'handler.lastId = lastId
		handler.eventType = eventType
		handler.callback = callback
		handler.userData = userData
		
		events.insert(handler.key, handler)

		Local factory:TEventFactory = event_factories
		Local evt:Int

		While factory
			evt = factory.GetEventType(eventType)
			If evt Exit
			factory = factory._succ
		Wend
		
		If evt Then
			eventType = evt
		End If
		
		bmx_wxevthandler_connect(wxObjectPtr, id, eventType, handler)
	End Method
	
	Rem
	bbdoc: Connects the given function dynamically with the event handler, an id range and event type.
	about: Example :
	<pre>
	ConnectRange(startId, lastId, wxEVT_COMMAND_MENU_SELECTED, func)
	</pre>
	can be used in place of the macro
	<pre>
	EVT_MENU_RANGE(startId, lastId, func)
	</pre>
	End Rem
	Method ConnectRange(id:Int, lastId:Int, eventType:Int, callback(event:wxEvent), userData:Object = Null)
		Local handler:TEventHandler = New TEventHandler

		handler.parent = Self
		handler.key = id + "." + lastId + "." + eventType
		handler.id = id
		handler.lastId = lastId
		handler.eventType = eventType
		handler.callback = callback
		handler.userData = userData
		
		events.insert(handler.key, handler)

		Local factory:TEventFactory = event_factories
		Local evt:Int

		While factory
			evt = factory.GetEventType(eventType)
			If evt Exit
			factory = factory._succ
		Wend
		
		If evt Then
			eventType = evt
		End If
		
		bmx_wxevthandler_connectrange(wxObjectPtr, id, lastId, eventType, handler)
	End Method
	
	Method Delete()
		' cleanup time!
		events.Clear()
	End Method
	
End Type



Type TEventFactory
	Field _succ:TEventFactory
	
	Method New()
		_succ=event_factories
		event_factories=Self
	End Method
	
	Method CreateEvent:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler) Abstract
	
	Method GetEventType:Int(eventType:Int) Abstract
	
End Type
