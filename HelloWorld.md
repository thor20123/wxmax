
```
SuperStrict

Framework wx.wxApp
Import wx.wxFrame

New MyApp.run()

Type MyApp Extends wxApp

	Field frame:wxFrame

	Method OnInit:Int()

		frame = wxFrame.CreateFrame(Null, wxID_ANY, "Hello World", 100, 100)
		frame.show()
	
		Return True

	End Method

End Type

```