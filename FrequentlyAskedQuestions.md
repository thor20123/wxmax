## Controls ##

### Sizing ###
**Q**: I have added a single control to a wxFrame at a certain position. When I resize the frame, the control within it is resized to fill the entire frame. What's up?

**A**: If you add a single control to a frame, it automatically fits inside that frame. If you want to add a control at a fixed size/location, add a wxPanel first whose parent is the frame, and then add your control which has the panel as its parent :
```
Local panel:wxPanel = New wxPanel.Create(myFrame)
Local button:wxButton = New wxButton.Create(panel, wxID_ANY, "My Button", 50, 50)
```


---


**Q**: I'm porting my Windows application to OS X, but the fonts look **much** larger than they do on Windows. Is there anything I can do?

**A**: You can try adding the following code-snippet to your app initialization section. It scales fonts down by a small percentage, making similar in size to those on Windows -
```
?MacOS
	' make the default Mac font for controls not so big '
	wxSystemOptions.SetOption(wxWINDOW_DEFAULT_VARIANT, wxWINDOW_VARIANT_SMALL)
?
```
And don't forget to `Import wx.wxSystemOptions`.

### wxListCtrl Items ###
**Q**: Hey! After I use `GetItem()` in a wxListCtrl, methods like `item.GetText()` don't return anything. What's going on?

**A**: List control items are interesting, in that they will only retrieve the information from the list that you actually ask for. You do this by creating a list item, setting the mask, and the calling `GetItem()` on the list. For example:
```
Local info:wxListItem = New wxListItem.Create()
info.SetId(0)
info.SetMask(wxLIST_MASK_TEXT)
If list.GetItem(info) Then
	DebugLog "The item text is " + info.GetText()
End If
```
The mask defines what information the item will have populated after the call to `GetItem()`. See the `SetItem()` documentation for a list of valid masks.

### wxTreeCtrl Nodes (wxTreeItemId) ###
**Q**: How do I compare two tree items? Using `item1 = item2` doesn't seem to work.

**A**: You can use the Equals() method of wxTreeItemId :
```
If oneTreeItem.Equals(anotherTreeItem) Then
	DebugLog "They are the same node of the tree!"
End If
```

## Compilation Issues ##
**Q**: When I try to compile an application using wxMax the build fails with a long list of strange errors, like this -
```
C:/Programme/BlitzMax/mod/wx.mod/wx.mod/../lib/win32/libwxmsw28u_core.a(corelib_frame.o)(.rdata$_ZTV7wxFrame+0x0):frame.cpp: multiple definition of `vtable for wxFrame'
C:/Programme/BlitzMax/mod/wx.mod/wxframe.mod/wxframe.release.win32.x86.a(glue.cpp.release.win32.x86.o)(.data$_ZTV7wxFrame+0x0):glue.cpp: first defined here
```
What's it mean?

**A**: Chances are you have a different version of the compiler/linker than was used to build the wxWidget static libraries.

On Win32, MinGW is used for compiling and linking the code. Sometimes, if you upgrade your MinGW from a previous version you can have these problems. A clean install of MinGW is always recommended. (Usually, you can simply rename the current folder and install the new version in its place). MinGW 5.1.3 is the version currently used to build the static libraries.

On Linux, the libraries have been built with GCC 4.1.x. Usually GCC versions of the same major-version number are compatible, whereas if you were to use GCC 3.x, you are likely to run into the errors above.

On Mac, the static libraries are generally compiled using the latest XCode, unless otherwise stated.