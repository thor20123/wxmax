# Custom Events #

So you need to make your own events?

Hopefully this short introduction will set you off in the right direction!

## Getting an Event Id ##

Every kind of event is unique. Your own custom events are no exception.
Therefore, you will need to get yourself a unique identifier which you can then refer to later. For this, you call `wxNewEventType()` which returns a new unique id.

General convention has events named similiarly to this : `wxMY_CUSTOM_EVENT`

Which makes it stand out in the code, and may be easier to remember... but of course that's entirely up to you. For the purpose of our guide, we'll use the one mentioned above :
```
Global wxMY_CUSTOM_EVENT:Int = wxNewEventType()
```
The important thing to remember about `wxNewEventType()` is that it creates a new id **every** time it is called, so you should only call it **once** for each kind of event - which usually means, once at the beginning of your application, using that id until your application finishes.

## Generating an Event ##

It's all very well having an event id, but you need to be able to generate an event that you can catch somewhere else.
You can do this via the `NewEvent()` method of a wxEvent sub-type. (eg. a wxCommandEvent).

`NewEvent()` takes two parameters. The first is your event id, and the second is an optional WindowId, like one you have given to a control that you created.

With this new event object, you must set the Event Object that owns the specific event, by calling the event method `SetEventObject()`. This links your event to a wxWidget event handler. (controls extend from wxEventHandler, making them valid event objects).

Finally you attach the event into the pending events queue, from where it will be processed until picked up by the application elsewhere.

The following snippet should help you see things a bit more clearly :
```
Type MyFrame Extends wxFrame

	Method makeEvent()

		Local event:wxCommandEvent = New wxCommandEvent.NewEvent( wxMY_CUSTOM_EVENT, GetId() )
		event.SetEventObject( Self )
		GetEventHandler().AddPendingEvent( event )

	End Method

End Type
```
Notice that we get the WindowId from the frame instance, and attach the event to the frame's event handler.

## Connecting to the Event ##

You connect to your new event in exactly the same way as you do with all the other events :
```
	Connect(SOME_ID, wxMY_CUSTOM_EVENT, OnMyNewEvent)
```
, or via `ConnectRange()` or `ConnectAny()`, depending of course on the type of event that you are generating.

## The Custom Event Factory ##

Last but not least, we need to create an Event Factory. This is what ties the wxWidgets event framework with wxMax on the BlitzMax level.

There's a standard template you can use here, making it relatively easy to add this to your application. The important part is the creation of the correct kind of event for your unique event id.

Here's a small example:
```
Type MyEventFactory Extends TCustomEventFactory

	Method CreateEvent:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Select evt.eventType
			Case wxMY_CUSTOM_EVENT
				Return wxCommandEvent.Create(wxEventPtr, evt)
		End Select
		Return Null
	End Method
	
End Type
```
Specifically, this is the bit you need to change on an event-by-event basis :
```
			Case wxMY_CUSTOM_EVENT
				Return wxCommandEvent.Create(wxEventPtr, evt)
```
If your events are all wxCommandEvents, you can "comma separate" them together in a single `Case` block if you like. But events of different event-types should be made to create the correct event.

You may be wondering...  "But I already created an event!"... indeed you did, but that was just to make the event for wxWidgets, which then transforms your event data internally into something else. When the event is received by you later, you need to convert that internal representation of the event back into something wxMax understands.

Finally, you need to enable your Event Factory. You do this by creating an instance of the factory **somewhere** in your application, before you intend generating events that need the factory - somewhere near the start is usually a good place.
```
New MyEventFactory
```
That's it. The factory will sort out everything else for you, and as long as you process the event properly in the factory, it'll all simply "just work" ;-)