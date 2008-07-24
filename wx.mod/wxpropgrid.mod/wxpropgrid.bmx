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
bbdoc: wxPropGrid
End Rem
Module wx.wxPropGrid

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


' Important notes !
' propgrid.cpp
'
' set wxPG_REFRESH_CONTROLS_AFTER_REPAINT to 1 for wxMAC !!
' otherwise, it doesn't refresh properly...
'
' in wxPGProperty::Init(), must include the check for "_LABEL_AS_NAME"
'

Rem
bbdoc: 
End Rem
Type wxPropertyContainerMethods Extends wxPanel

	Method AddPropertyChoice(prop:wxPGProperty, label:String, value:Int = INT_MAX) Abstract

	Method AddPropertyChoiceByName(name:String, label:String, value:Int = INT_MAX) Abstract
	
	Rem
	bbdoc: Appends property to the list.
	about: wxPropertyGrid assumes ownership of the object. Becomes child of most recently added category.
	End Rem
	Method Append:wxPGProperty(property:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method AppendIn:wxPGProperty(prop:wxPGProperty, newProperty:wxPGProperty) Abstract
		
	Rem
	bbdoc: Inorder to add new items into a property with fixed children (for instance, wxFlagsProperty), you need to call this method.
	about: After populating has been finished, you need to call EndAddChildren/Name.	
	End Rem
	Method BeginAddChildren(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: Inorder to add new items into a property with fixed children (for instance, wxFlagsProperty), you need to call this method.
	about: After populating has been finished, you need to call EndAddChildren/Name.	
	End Rem
	Method BeginAddChildrenByName(name:String) Abstract

	Method ChangePropertyValueIntArray:Int(prop:wxPGProperty, value:Int[]) Abstract
	
	Method ChangePropertyValueULong:Int(prop:wxPGProperty, value:Long) Abstract
	
	Method ChangePropertyValueLong:Int(prop:wxPGProperty, value:Long) Abstract
	
	Method ChangePropertyValueSize:Int(prop:wxPGProperty, w:Int, h:Int) Abstract
	
	Method ChangePropertyValuePoint:Int(prop:wxPGProperty, x:Int, y:Int) Abstract
	
	Method ChangePropertyValueBytePtr:Int(prop:wxPGProperty, value:Byte Ptr) Abstract
	
	Method ChangePropertyValueString:Int(prop:wxPGProperty, value:String) Abstract
	
	Method ChangePropertyValueDateTime:Int(prop:wxPGProperty, time:wxDateTime) Abstract
	
	Method ChangePropertyValueStringArray:Int(prop:wxPGProperty, value:String[]) Abstract
	
	Method ChangePropertyValueBool:Int(prop:wxPGProperty, value:Int) Abstract
	
	Method ChangePropertyValueDouble:Int(prop:wxPGProperty, value:Double) Abstract
	
	Method ChangePropertyValueInt:Int(prop:wxPGProperty, value:Int) Abstract

	Rem
	bbdoc: Resets value of a property to its default.
	End Rem
	Method ClearPropertyValue:Int(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: Resets value of a property to its default.
	End Rem
	Method ClearPropertyValueByName:Int(name:String) Abstract

	Rem
	bbdoc: Deselect current selection, if any.
	returns: True if success (ie. validator did not intercept).
	End Rem
	Method ClearSelection:Int() Abstract

	Rem
	bbdoc: Collapses given category or property with children.
	returns: True if actually collapses.
	End Rem
	Method Collapse:Int(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: Collapses given category or property with children.
	returns: True if actually collapses.
	End Rem
	Method CollapseByName:Int(name:String) Abstract

	Rem
	bbdoc: Deletes a property.
	about: If category is deleted, all children are automatically deleted as well.
	End Rem
	Method DeleteProperty(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: Deletes a property by name.
	about: If category is deleted, all children are automatically deleted as well.
	End Rem
	Method DeletePropertyByName(name:String) Abstract

	Rem
	bbdoc: Deletes choice from a property.
	about: If selected item is deleted, then the value is set to unspecified.
	<p>
	See AddPropertyChoice for more details.
	</p>
	End Rem
	Method DeletePropertyChoice(prop:wxPGProperty, index:Int) Abstract
	
	Rem
	bbdoc: Deletes choice from a property.
	about: If selected item is deleted, then the value is set to unspecified.
	<p>
	See AddPropertyChoice for more details.
	</p>
	End Rem
	Method DeletePropertyChoiceByName(name:String, index:Int) Abstract

	Rem
	bbdoc: Disables property.
	End Rem
	Method DisableProperty:Int(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: Disables property.
	End Rem
	Method DisablePropertyByName:Int(name:String) Abstract

	Rem
	bbdoc: Enables or disables property, depending on whether enable is true or false.
	End Rem
	Method EnableProperty:Int(prop:wxPGProperty, enable:Int = True) Abstract
	
	Rem
	bbdoc: Enables or disables property, depending on whether enable is true or false.
	End Rem
	Method EnablePropertyByName:Int(name:String, enable:Int = True) Abstract

	Rem
	bbdoc: Called after population of property with fixed children has finished.
	End Rem
	Method EndAddChildren(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: Called after population of property with fixed children has finished.
	End Rem
	Method EndAddChildrenByName(name:String) Abstract
	
	Rem
	bbdoc: Expands given category or property with children.
	returns: True if actually expands.
	End Rem
	Method Expand:Int(prop:wxPGProperty) Abstract

	Rem
	bbdoc: Expands given category or property with children.
	returns: True if actually expands.
	End Rem
	Method ExpandByName:Int(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetFirst:wxPGProperty(flags:Int) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetIterator:wxPropertyGridIterator(flags:Int, firstProp:wxPGProperty = Null) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetPropertiesWithFlag:wxPGProperty[](flags:Int, inverse:Int = False, iterFlags:Int = wxPG_ITERATE_PROPERTIES | wxPG_ITERATE_HIDDEN | wxPG_ITERATE_CATEGORIES) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetPropertyBySubName:wxPGProperty(name:String, subName:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetPropertyByName:wxPGProperty(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetPropertyCategory:wxPropertyCategory(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetPropertyChoices:wxPGChoices(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetPropertyClassName:String(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetPropertyClientData:Object(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyEditor:wxPGEditor(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyHelpString:String(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyImage:wxBitmap(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyIndex:Int(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyLabel:String(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyName:String(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyParent:wxPGProperty(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyPtr:wxPGProperty(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyShortClassName:String(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsArrayInt:Int[](prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsArrayString:String[](prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsBool:Int(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsDateTime:wxDateTime(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsDouble:Double(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsInt:Int(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsLong:Long(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsPoint(prop:wxPGProperty, x:Int Var, y:Int Var) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsSize(prop:wxPGProperty, w:Int Var, h:Int Var) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsString:String(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsULong:Int(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsColour:wxColour(prop:wxPGProperty) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueType:String(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetSelection:wxPGProperty() Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetState:wxPropertyGridState() Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method HideProperty:Int(prop:wxPGProperty, hide:Int = True) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method Insert:wxPGProperty(parent:wxPGProperty, index:Int, newproperty:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method InsertCategory:wxPGProperty(prop:wxPGProperty, index:Int, label:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method InsertPropertyChoice(prop:wxPGProperty, label:String, index:Int, value:Int = INT_MAX) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyCategory:Int(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyEnabled:Int(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyExpanded:Int(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyModified:Int(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyShown:Int(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyUnspecified:Int(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method LimitPropertyEditing(prop:wxPGProperty, limit:Int = True) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method NamesToProperties:wxPGProperty[](names:String[]) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method PropertiesToNames:String[](properties:wxPGProperty[]) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method RefreshGrid(state:wxPropertyGridState = Null) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method ReplaceProperty:wxPGProperty(prop:wxPGProperty, property:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyCell(prop:wxPGProperty, column:Int, text:String = "", bitmap:wxBitmap = Null, fgCol:wxColour = Null, bgCol:wxColour = Null) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyChoices(prop:wxPGProperty, choices:wxPGChoices) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyChoicesExclusive(prop:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyClientData(prop:wxPGProperty, clientData:Object) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyEditorbyName(prop:wxPGProperty, editorName:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyEditor(prop:wxPGProperty, editor:wxPGEditor) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyAttribute(prop:wxPGProperty, attrName:String, value:Int, argFlags:Int = 0) Abstract
	

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyCategoryName:wxPropertyCategory(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetPropertyChoicesByName:wxPGChoices(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetPropertyClassNameByName:String(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method GetPropertyClientDataByName:Object(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyEditorByName:wxPGEditor(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyHelpStringByName:String(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyImageByName:wxBitmap(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyIndexByName:Int(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyLabelByName:String(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyNameByName:String(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyParentByName:wxPGProperty(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyPtrByName:wxPGProperty(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyShortClassNameByName:String(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsArrayIntByName:Int[](name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsArrayStringByName:String[](name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsBoolByName:Int(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsDateTimeByName:wxDateTime(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsDoubleByName:Double(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsIntByName:Int(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsLongByName:Long(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsPointByName(name:String, x:Int Var, y:Int Var) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsSizeByName(name:String, w:Int Var, h:Int Var) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsStringByName:String(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsColourByName:wxColour(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueAsULongByName:Int(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method GetPropertyValueTypeByName:String(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method HidePropertyByName:Int(name:String, hide:Int = True) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method InsertByName:wxPGProperty(parent:String, index:Int, newproperty:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method InsertCategoryByName:wxPGProperty(name:String, index:Int, label:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method InsertPropertyChoiceByName(name:String, label:String, index:Int, value:Int = INT_MAX) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyCategoryByName:Int(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyEnabledByName:Int(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyExpandedByName:Int(name:String) Abstract

	Rem
	bbdoc: 
	End Rem
	Method IsPropertyModifiedByName:Int(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyShownByName:Int(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyUnspecifiedByName:Int(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method LimitPropertyEditingByName(name:String, limit:Int = True) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method ReplacePropertyByName:wxPGProperty(name:String, property:wxPGProperty) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyCellByName(name:String, column:Int, text:String = "", bitmap:wxBitmap = Null, fgCol:wxColour = Null, bgCol:wxColour = Null) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyChoicesByName(name:String, choices:wxPGChoices) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyChoicesExclusiveByName(name:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyClientDataByName(name:String, clientData:Object) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyEditorbyPropNameAndName(name:String, editorName:String) Abstract
	
	Rem
	bbdoc: 
	End Rem
	Method SetPropertyEditorByPropName(name:String, editor:wxPGEditor) Abstract

	Rem
	bbdoc: 
	End Rem
	Method SetPropertyAttributeByName(name:String, attrName:String, value:Int, argFlags:Int = 0) Abstract
	

	Rem
	bbdoc: Associates the help string with property.
	about: By default, text is shown either in the manager's "description" text box or in the
	status bar. If extra window style wxPG_EX_HELP_AS_TOOLTIPS is used, then the text will appear
	as a tooltip.
	End Rem
	Method SetPropertyHelpString(prop:wxPGProperty, helpString:String) Abstract

	Method SetPropertyHelpStringByName(name:String, helpString:String) Abstract

	Method SetPropertyImage(prop:wxPGProperty, bmp:wxBitmap) Abstract
	
	Method SetPropertyLabel(prop:wxPGProperty, newproplabel:String) Abstract
	
	Method SetPropertyMaxLength:Int(prop:wxPGProperty, maxLen:Int) Abstract
	
	Method SetPropertyReadOnly(prop:wxPGProperty, set:Int = True) Abstract
	
	Method SetPropertyUnspecified(prop:wxPGProperty) Abstract
	
	Method SetPropertyValueIntArray(prop:wxPGProperty, value:Int[]) Abstract
	
	Method SetPropertyValueULong(prop:wxPGProperty, value:Long) Abstract
	
	Method SetPropertyValueLong(prop:wxPGProperty, value:Long) Abstract
	
	Method SetPropertyValueSize(prop:wxPGProperty, w:Int, h:Int) Abstract
	
	Method SetPropertyValuePoint(prop:wxPGProperty, x:Int, y:Int) Abstract
	
	Method SetPropertyValueBytePtr(prop:wxPGProperty, value:Byte Ptr) Abstract
	
	Method SetPropertyValueString(prop:wxPGProperty, value:String) Abstract
	
	Method SetPropertyValueDateTime(prop:wxPGProperty, time:wxDateTime) Abstract
	
	Method SetPropertyValueStringArray(prop:wxPGProperty, value:String[]) Abstract
	
	Method SetPropertyValueBool(prop:wxPGProperty, value:Int) Abstract
	
	Method SetPropertyValueDouble(prop:wxPGProperty, value:Double) Abstract
	
	Method SetPropertyValueInt(prop:wxPGProperty, value:Int) Abstract



	Method SetPropertyImageByName(name:String, bmp:wxBitmap) Abstract
	
	Method SetPropertyLabelByName(name:String, newproplabel:String) Abstract
	
	Method SetPropertyMaxLengthByName:Int(name:String, maxLen:Int) Abstract
	
	Method SetPropertyReadOnlyByName(name:String, set:Int = True) Abstract
	
	Method SetPropertyUnspecifiedByName(name:String) Abstract
	
	Method SetPropertyValueIntArrayByName(name:String, value:Int[]) Abstract
	
	Method SetPropertyValueULongByName(name:String, value:Long) Abstract
	
	Method SetPropertyValueLongByName(name:String, value:Long) Abstract
	
	Method SetPropertyValueSizeByName(name:String, w:Int, h:Int) Abstract
	
	Method SetPropertyValuePointByName(name:String, x:Int, y:Int) Abstract
	
	Method SetPropertyValueBytePtrByName(name:String, value:Byte Ptr) Abstract
	
	Method SetPropertyValueStringByName(name:String, value:String) Abstract
	
	Method SetPropertyValueDateTimeByName(name:String, time:wxDateTime) Abstract
	
	Method SetPropertyValueStringArrayByName(name:String, value:String[]) Abstract
	
	Method SetPropertyValueBoolByName(name:String, value:Int) Abstract
	
	Method SetPropertyValueDoubleByName(name:String, value:Double) Abstract
	
	Method SetPropertyValueIntByName(name:String, value:Int) Abstract
	
	Function InitAllTypeHandlers()
	End Function
	
	Function RegisterAdditionalEditors()
	End Function

End Type

Rem
bbdoc: 
End Rem
Type wxPropertyGridState Extends wxPropertyContainerMethods
End Type

Rem
bbdoc: 
End Rem
Type wxPropertyGridPage Extends wxPropertyGridState
End Type


Rem
bbdoc: 
End Rem
Type wxPropertyGridManager Extends wxPropertyContainerMethods
End Type

Rem
bbdoc: A specialized two-column grid for editing properties such as strings, numbers, flagsets, fonts, and colours. 
about: wxPropertyGrid is modeled after .NET propertygrid (hence the name), and thus features are similar.
However, inorder to keep the widget lightweight, it does not (and will not) have toolbar for mode and page
selection, nor the help text box. wxAdvancedPropertyGrid (or something similarly named) is planned to have
these features in some distant future.
End Rem
Type wxPropertyGrid Extends wxPropertyContainerMethods

	' soft linking
	Function _create:wxPropertyGrid(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local this:wxPropertyGrid = New wxPropertyGrid
			this.wxObjectPtr = wxObjectPtr
			Return this
		End If
	End Function

	Function _find:wxPropertyGrid(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local grid:wxPropertyGrid = wxPropertyGrid(wxfind(wxObjectPtr))
			If Not grid Then
				Return wxPropertyGrid._create(wxObjectPtr)
			End If
			Return grid
		End If
	End Function

	Rem
	bbdoc: 
	End Rem
	Function CreatePropertyGrid:wxPropertyGrid(parent:wxWindow, id:Int = wxID_ANY, x:Int = -1, y:Int = -1, ..
			w:Int = -1, h:Int = -1, style:Int = 0)
		Return New wxPropertyGrid.Create(parent, id, x, y, w, h, style)
	End Function
	
	Rem
	bbdoc: 
	End Rem
	Method Create:wxPropertyGrid(parent:wxWindow, id:Int = wxID_ANY, x:Int = -1, y:Int = -1, ..
			w:Int = -1, h:Int = -1, style:Int = 0)
		wxObjectPtr = bmx_wxpropertygrid_create(Self, parent.wxObjectPtr, id, x, y, w, h, style)
		
		OnInit()
		
		Return Self
	End Method

	Method AddPropertyChoice(prop:wxPGProperty, label:String, value:Int = INT_MAX)
		bmx_wxpropertygrid_addpropertychoice(wxObjectPtr, prop.wxObjectPtr, label, value)
	End Method

	Method AddPropertyChoiceByName(name:String, label:String, value:Int = INT_MAX)
		bmx_wxpropertygrid_addpropertychoicebyname(wxObjectPtr, name, label, value)
	End Method

	Method Append:wxPGProperty(property:wxPGProperty)
		Return wxPGProperty._create(bmx_wxpropertygrid_append(wxObjectPtr, property.wxObjectPtr))
	End Method

	Method AppendIn:wxPGProperty(prop:wxPGProperty, newProperty:wxPGProperty)
		Return wxPGProperty._create(bmx_wxpropertygrid_appendin(wxObjectPtr, prop.wxObjectPtr, newProperty.wxObjectPtr))
	End Method

	Method ChangePropertyValueIntArray:Int(prop:wxPGProperty, value:Int[])
		' TODO
	End Method
	
	Method ChangePropertyValueULong:Int(prop:wxPGProperty, value:Long) 
		' TODO
	End Method
	
	Method ChangePropertyValueLong:Int(prop:wxPGProperty, value:Long) 
		' TODO
	End Method
	
	Method ChangePropertyValueSize:Int(prop:wxPGProperty, w:Int, h:Int) 
		' TODO
	End Method
	
	Method ChangePropertyValuePoint:Int(prop:wxPGProperty, x:Int, y:Int) 
		' TODO
	End Method
	
	Method ChangePropertyValueBytePtr:Int(prop:wxPGProperty, value:Byte Ptr) 
		' TODO
	End Method
	
	Method ChangePropertyValueString:Int(prop:wxPGProperty, value:String) 
		' TODO
	End Method
	
	Method ChangePropertyValueDateTime:Int(prop:wxPGProperty, time:wxDateTime) 
		' TODO
	End Method
	
	Method ChangePropertyValueStringArray:Int(prop:wxPGProperty, value:String[]) 
		' TODO
	End Method
	
	Method ChangePropertyValueBool:Int(prop:wxPGProperty, value:Int) 
		' TODO
	End Method
	
	Method ChangePropertyValueDouble:Int(prop:wxPGProperty, value:Double) 
		' TODO
	End Method
	
	Method ChangePropertyValueInt:Int(prop:wxPGProperty, value:Int) 
		' TODO
	End Method

	Rem
	bbdoc: Deletes all properties.
	about: Does Not free memory allocated For arrays etc. This should *Not* be called in wxPropertyGridManager.
	End Rem
	Method Clear()
		bmx_wxpropertygrid_clear(wxObjectPtr)
	End Method
	
	Method ClearModifiedStatus()
		bmx_wxpropertygrid_clearmodifiedstatus(wxObjectPtr)
	End Method
	
'	Method ClearModifiedStatusId(id:wxPGPropArg)
'	End Method

	Method SetPropertyHelpString(prop:wxPGProperty, helpString:String)
		bmx_wxpropertygrid_setpropertyhelpstring(wxObjectPtr, prop.wxObjectPtr, helpString)
	End Method

	Method SetPropertyHelpStringByName(name:String, helpString:String)
		bmx_wxpropertygrid_setpropertyhelpstringbyname(wxObjectPtr, name, helpString)
	End Method
	
'	Method ClearPropertyValue(name:String)
'	End Method
	
'	Method ClearPropertyValueId(id:wxPGPropArg)
'	End Method
	
'	Method Collapse(name:String)
'	End Method
	
'	Method CollapseId(id:wxPGPropArg)
'	End Method
'	
	Method GetCaptionBackgroundColour:wxColour()
		Return wxColour._create(bmx_wxpropertygrid_getcaptionbackgroundcolour(wxObjectPtr))
	End Method
	
	Method GetCaptionForegroundColour:wxColour()
		Return wxColour._create(bmx_wxpropertygrid_getcaptionforegroundcolour(wxObjectPtr))
	End Method
	
	Method GetCellBackgroundColour:wxColour()
		Return wxColour._create(bmx_wxpropertygrid_getcellbackgroundcolour(wxObjectPtr))
	End Method
	
	Method GetCellDisabledTextColour:wxColour()
		Return wxColour._create(bmx_wxpropertygrid_getcelldisabledtextcolour(wxObjectPtr))
	End Method
	
	Method GetCellTextColour:wxColour()
		Return wxColour._create(bmx_wxpropertygrid_getcelltextcolour(wxObjectPtr))
	End Method
	
	
'	Rem
'	bbdoc: Returns itself.
'	about: Dummy Method that enables same kind of code To use wxPropertyGrid And wxPropertyGridManager.
'	End Rem
	Method GetGrid:wxPropertyGrid()
		Return _find(bmx_wxpropertygrid_getgrid(wxObjectptr))
	End Method
	
	Method GetLineColour:wxColour()
		Return wxColour._create(bmx_wxpropertygrid_getlinecolour(wxObjectPtr))
	End Method
	
	Method GetMarginColour:wxColour()
		Return wxColour._create(bmx_wxpropertygrid_getmargincolour(wxObjectPtr))
	End Method
	
	Method GetPropertyBackgroundColour:wxColour(prop:wxPGProperty)
		Return wxColour._create(bmx_wxpropertygrid_getpropertybackgroundcolour(wxObjectPtr, prop.wxObjectPtr))
	End Method
	
	Method GetPropertyColour:wxColour(prop:wxPGProperty)
		Return wxColour._create(bmx_wxpropertygrid_getpropertycolour(wxObjectPtr, prop.wxObjectPtr))
	End Method
	
	Method GetPropertyTextColour:wxColour(prop:wxPGProperty)
		Return wxColour._create(bmx_wxpropertygrid_getpropertytextcolour(wxObjectPtr, prop.wxObjectPtr))
	End Method

	Method GetPropertyBackgroundColourByName:wxColour(name:String)
		Return wxColour._create(bmx_wxpropertygrid_getpropertybackgroundcolourbyname(wxObjectPtr, name))
	End Method
	
	Method GetPropertyColourByName:wxColour(name:String)
		Return wxColour._create(bmx_wxpropertygrid_getpropertycolourbyname(wxObjectPtr, name))
	End Method
	
	Method GetPropertyTextColourByName:wxColour(name:String)
		Return wxColour._create(bmx_wxpropertygrid_getpropertytextcolourbyname(wxObjectPtr, name))
	End Method

	Method BeginAddChildren(prop:wxPGProperty)
		bmx_wxpropertygrid_beginaddchildren(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method BeginAddChildrenByName(name:String)
		bmx_wxpropertygrid_beginaddchildrenbyname(wxObjectPtr, name)
	End Method

	Method ClearPropertyValue:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_clearpropertyvalue(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method ClearPropertyValueByName:Int(name:String)
		Return bmx_wxpropertygrid_clearpropertyvaluebyname(wxObjectPtr, name)
	End Method

	Method ClearSelection:Int()
		Return bmx_wxpropertygrid_clearselection(wxObjectPtr)
	End Method

	Method Collapse:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_collapse(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method CollapseByName:Int(name:String)
		Return bmx_wxpropertygrid_collapsebyname(wxObjectPtr, name)
	End Method

	Method DeleteProperty(prop:wxPGProperty)
		bmx_wxpropertygrid_deleteproperty(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method DeletePropertyByName(name:String)
		bmx_wxpropertygrid_deletepropertybyname(wxObjectPtr, name)
	End Method

	Method DeletePropertyChoice(prop:wxPGProperty, index:Int)
		bmx_wxpropertygrid_deletepropertychoice(wxObjectPtr, prop.wxObjectPtr, index)
	End Method
	
	Method DeletePropertyChoiceByName(name:String, index:Int)
		bmx_wxpropertygrid_deletepropertychoicebyname(wxObjectPtr, name, index)
	End Method

	Method DisableProperty:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_disableproperty(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method DisablePropertyByName:Int(name:String)
		Return bmx_wxpropertygrid_disablepropertybyname(wxObjectPtr, name)
	End Method

	Method EnableProperty:Int(prop:wxPGProperty, enable:Int = True)
		Return bmx_wxpropertygrid_enableproperty(wxObjectPtr, prop.wxObjectPtr, enable)
	End Method
	
	Method EnablePropertyByName:Int(name:String, enable:Int = True)
		Return bmx_wxpropertygrid_enablepropertybyname(wxObjectPtr, name, enable)
	End Method

	Method EndAddChildren(prop:wxPGProperty)
		bmx_wxpropertygrid_endaddchildren(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method EndAddChildrenByName(name:String)
		bmx_wxpropertygrid_endaddchildrenbyname(wxObjectPtr, name)
	End Method
	
	Method Expand:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_expand(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method ExpandByName:Int(name:String)
		Return bmx_wxpropertygrid_expandbyname(wxObjectPtr, name)
	End Method
	
	
	Method GetFirst:wxPGProperty(flags:Int)
		Return wxPGProperty._find(bmx_wxpropertygrid_getfirst(wxObjectPtr, flags))
	End Method
	
	Method GetIterator:wxPropertyGridIterator(flags:Int, firstProp:wxPGProperty = Null)
	End Method
	
	Method GetPropertiesWithFlag:wxPGProperty[](flags:Int, inverse:Int = False, iterFlags:Int = wxPG_ITERATE_PROPERTIES | wxPG_ITERATE_HIDDEN | wxPG_ITERATE_CATEGORIES)
		Return bmx_wxpropertygrid_getpropertieswithflag(wxObjectPtr, flags, inverse, iterFlags)
	End Method
	
	Function _newPropertiesArray:wxPGProperty[](size:Int)
		Return New wxPGProperty[size]
	End Function
	
	Function _addProperty(arr:wxPGProperty[], index:Int, prop:Byte Ptr)
		arr[index] = wxPGProperty._find(prop)
	End Function

	Function _getProperty:Byte Ptr(arr:wxPGProperty[], index:Int)
		Return arr[index].wxObjectPtr
	End Function
	
	Method GetPropertyBySubName:wxPGProperty(name:String, subName:String)
		Return wxPGProperty._find(bmx_wxpropertygrid_getpropertybysubname(wxObjectPtr, name, subName))
	End Method
	
	Method GetPropertyByName:wxPGProperty(name:String)
		Return wxPGProperty._find(bmx_wxpropertygrid_getpropertybyname(wxObjectPtr, name))
	End Method
	
	Method GetPropertyCategory:wxPropertyCategory(prop:wxPGProperty)
		Return wxPropertyCategory._find(bmx_wxpropertygrid_getpropertycategory(wxObjectPtr, prop.wxObjectPtr))
	End Method
	
	Method GetPropertyChoices:wxPGChoices(prop:wxPGProperty)
		Return wxPGChoices._create(bmx_wxpropertygrid_getpropertychoices(wxObjectPtr, prop.wxObjectPtr))
	End Method
	
	Method GetPropertyClassName:String(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyclassname(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method GetPropertyClientData:Object(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyclientdata(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyEditor:wxPGEditor(prop:wxPGProperty)
		Return wxPGEditor._find(bmx_wxpropertygrid_getpropertyeditor(wxObjectPtr, prop.wxObjectPtr))
	End Method

	Method GetPropertyHelpString:String(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyhelpstring(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyImage:wxBitmap(prop:wxPGProperty)
		Return wxBitmap._create(bmx_wxpropertygrid_getpropertyimage(wxObjectPtr, prop.wxObjectPtr))
	End Method

	Method GetPropertyIndex:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyindex(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyLabel:String(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertylabel(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyName:String(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyname(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyParent:wxPGProperty(prop:wxPGProperty)
		Return wxPGProperty._find(bmx_wxpropertygrid_getpropertyparent(wxObjectPtr, prop.wxObjectPtr))
	End Method

	Method GetPropertyPtr:wxPGProperty(prop:wxPGProperty)
		Return wxPGProperty._find(bmx_wxpropertygrid_getpropertyptr(wxObjectPtr, prop.wxObjectPtr))
	End Method

	Method GetPropertyShortClassName:String(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyshortclassname(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyValueAsArrayInt:Int[](prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyvalueasarrayint(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyValueAsArrayString:String[](prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyvalueasarraystring(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyValueAsBool:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyvalueasbool(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyValueAsDateTime:wxDateTime(prop:wxPGProperty)
		Return wxDateTime._create(bmx_wxpropertygrid_getpropertyvalueasdatetime(wxObjectPtr, prop.wxObjectPtr))
	End Method

	Method GetPropertyValueAsDouble:Double(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyvalueasdouble(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyValueAsInt:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyvalueasint(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyValueAsLong:Long(prop:wxPGProperty)
		Local value:Long
		bmx_wxpropertygrid_getpropertyvalueaslong(wxObjectPtr, prop.wxObjectPtr, Varptr value)
	End Method

	Method GetPropertyValueAsPoint(prop:wxPGProperty, x:Int Var, y:Int Var)
		bmx_wxpropertygrid_getpropertyvalueaspoint(wxObjectPtr, prop.wxObjectPtr, Varptr x, Varptr y)
	End Method

	Method GetPropertyValueAsSize(prop:wxPGProperty, w:Int Var, h:Int Var)
		bmx_wxpropertygrid_getpropertyvalueassize(wxObjectPtr, prop.wxObjectPtr, Varptr w, Varptr h)
	End Method

	Method GetPropertyValueAsString:String(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyvalueasstring(wxObjectPtr, prop.wxObjectPtr)
	End Method

	Method GetPropertyValueAsULong:Int(prop:wxPGProperty)
	End Method

	Method GetPropertyValueType:String(prop:wxPGProperty)
		Return bmx_wxpropertygrid_getpropertyvaluetype(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method GetSelection:wxPGProperty()
		Return wxPGProperty._find(bmx_wxpropertygrid_getselection(wxObjectPtr))
	End Method
	
	Method GetState:wxPropertyGridState()
	End Method
	
	Method HideProperty:Int(prop:wxPGProperty, hide:Int = True)
		Return bmx_wxpropertygrid_hideproperty(wxObjectPtr, prop.wxObjectPtr, hide)
	End Method
	
	Method Insert:wxPGProperty(parent:wxPGProperty, index:Int, newproperty:wxPGProperty)
		Return wxPGProperty._find(bmx_wxpropertygrid_insert(wxObjectPtr, parent.wxObjectPtr, index, newproperty.wxObjectPtr))
	End Method
	
	Method InsertCategory:wxPGProperty(prop:wxPGProperty, index:Int, label:String)
		Return wxPGProperty._find(bmx_wxpropertygrid_insertcategory(wxObjectPtr, prop.wxObjectPtr, index, label))
	End Method
	
	Method InsertPropertyChoice(prop:wxPGProperty, label:String, index:Int, value:Int = INT_MAX)
		bmx_wxpropertygrid_insertpropertychoice(wxObjectPtr, prop.wxObjectPtr, label, index, value)
	End Method
	
	Method IsPropertyCategory:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_ispropertcategory(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method IsPropertyEnabled:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_ispropertyenabled(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method IsPropertyExpanded:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_ispropertyexpanded(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method IsPropertyModified:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_ispropertymodified(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method IsPropertyShown:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_ispropertyshown(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method IsPropertyUnspecified:Int(prop:wxPGProperty)
		Return bmx_wxpropertygrid_ispropertyunspecified(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method LimitPropertyEditing(prop:wxPGProperty, limit:Int = True)
		bmx_wxpropertygrid_limitpropertyediting(wxObjectPtr, prop.wxObjectPtr, limit)
	End Method
	
	Method NamesToProperties:wxPGProperty[](names:String[])
		Return bmx_wxpropertygrid_namestoproperties(wxObjectPtr, names)
	End Method
	
	Method PropertiesToNames:String[](properties:wxPGProperty[])
		Return bmx_wxpropertygrid_propertiestonames(wxObjectPtr, properties)
	End Method
	
	Method RefreshGrid(state:wxPropertyGridState = Null)
	End Method
	
	Method ReplaceProperty:wxPGProperty(prop:wxPGProperty, property:wxPGProperty)
		Return wxPGProperty._find(bmx_wxpropertygrid_replaceproperty(wxObjectPtr, prop.wxObjectPtr, property.wxObjectPtr))
	End Method
	
	Method SetPropertyCell(prop:wxPGProperty, column:Int, text:String = "", bitmap:wxBitmap = Null, fgCol:wxColour = Null, bgCol:wxColour = Null)
		If bitmap Then
			If fgCol Then
				If bgCol Then
					bmx_wxpropertygrid_setpropertycell(wxObjectPtr, prop.wxObjectPtr, column, text, bitmap.wxObjectPtr, fgCol.wxObjectPtr, bgCol.wxObjectPtr)
				Else
					bmx_wxpropertygrid_setpropertycell(wxObjectPtr, prop.wxObjectPtr, column, text, bitmap.wxObjectPtr, fgCol.wxObjectPtr, Null)
				End If
			Else
				If bgCol Then
					bmx_wxpropertygrid_setpropertycell(wxObjectPtr, prop.wxObjectPtr, column, text, bitmap.wxObjectPtr, Null, bgCol.wxObjectPtr)
				Else
					bmx_wxpropertygrid_setpropertycell(wxObjectPtr, prop.wxObjectPtr, column, text, bitmap.wxObjectPtr, Null, Null)
				End If
			End If
		Else
			If fgCol Then
				If bgCol Then
					bmx_wxpropertygrid_setpropertycell(wxObjectPtr, prop.wxObjectPtr, column, text, Null, fgCol.wxObjectPtr, bgCol.wxObjectPtr)
				Else
					bmx_wxpropertygrid_setpropertycell(wxObjectPtr, prop.wxObjectPtr, column, text, Null, fgCol.wxObjectPtr, Null)
				End If
			Else
				If bgCol Then
					bmx_wxpropertygrid_setpropertycell(wxObjectPtr, prop.wxObjectPtr, column, text, Null, Null, bgCol.wxObjectPtr)
				Else
					bmx_wxpropertygrid_setpropertycell(wxObjectPtr, prop.wxObjectPtr, column, text, Null, Null, Null)
				End If
			End If
		End If
	End Method
	
	Method SetPropertyChoices(prop:wxPGProperty, choices:wxPGChoices)
		bmx_wxpropertygrid_setpropertychoices(wxObjectPtr, prop.wxObjectPtr, choices.wxObjectPtr)
	End Method
	
	Method SetPropertyChoicesExclusive(prop:wxPGProperty)
		bmx_wxpropertygrid_setpropertychoicesexclusive(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method SetPropertyClientData(prop:wxPGProperty, clientData:Object)
	End Method
	
	Method SetPropertyEditorbyName(prop:wxPGProperty, editorName:String)
	End Method
	
	Method SetPropertyEditor(prop:wxPGProperty, editor:wxPGEditor)
	End Method
	


	Method GetPropertyCategoryName:wxPropertyCategory(name:String)
		Return wxPropertyCategory._find(bmx_wxpropertygrid_getpropertycategorybyname(wxObjectPtr, name))
	End Method
	
	Method GetPropertyChoicesByName:wxPGChoices(name:String)
		Return wxPGChoices._create(bmx_wxpropertygrid_getpropertychoicesbyname(wxObjectPtr, name))
	End Method
	
	Method GetPropertyClassNameByName:String(name:String)
		Return bmx_wxpropertygrid_getpropertyclassnamebyname(wxObjectPtr, name)
	End Method
	
	Method GetPropertyClientDataByName:Object(name:String)
	End Method

	Method GetPropertyEditorByName:wxPGEditor(name:String)
	End Method

	Method GetPropertyHelpStringByName:String(name:String)
		Return bmx_wxpropertygrid_getpropertyhelpstringbyname(wxObjectPtr, name)
	End Method

	Method GetPropertyImageByName:wxBitmap(name:String)
		Return wxBitmap._create(bmx_wxpropertygrid_getpropertyimagebyname(wxObjectPtr, name))
	End Method

	Method GetPropertyIndexByName:Int(name:String)
		Return bmx_wxpropertygrid_getpropertyindexbyname(wxObjectPtr, name)
	End Method

	Method GetPropertyLabelByName:String(name:String)
		Return bmx_wxpropertygrid_getpropertylabelbyname(wxObjectPtr, name)
	End Method

	Method GetPropertyNameByName:String(name:String)
		Return bmx_wxpropertygrid_getpropertynamebyname(wxObjectPtr, name)
	End Method

	Method GetPropertyParentByName:wxPGProperty(name:String)
	End Method

	Method GetPropertyPtrByName:wxPGProperty(name:String)
	End Method

	Method GetPropertyShortClassNameByName:String(name:String)
		Return bmx_wxpropertygrid_getpropertyshortclassnamebyname(wxObjectPtr, name)
	End Method

	Method GetPropertyValueAsArrayIntByName:Int[](name:String)
		Return bmx_wxpropertygrid_getpropertyvalueasarrayintbyname(wxObjectPtr, name)
	End Method

	Method GetPropertyValueAsArrayStringByName:String[](name:String)
		Return bmx_wxpropertygrid_getpropertyvalueasarraystringbyname(wxObjectPtr, name)
	End Method

	Method GetPropertyValueAsBoolByName:Int(name:String)
		Return bmx_wxpropertygrid_getpropertyvalueasboolbyname(wxObjectPtr, name)
	End Method

	Method GetPropertyValueAsDateTimeByName:wxDateTime(name:String)
		Return wxDateTime._create(bmx_wxpropertygrid_getpropertyvalueasdatetimebyname(wxObjectPtr, name))
	End Method

	Method GetPropertyValueAsDoubleByName:Double(name:String)
		Return bmx_wxpropertygrid_getpropertyvalueasdoublebyname(wxObjectPtr, name)
	End Method

	Method GetPropertyValueAsIntByName:Int(name:String)
		Return bmx_wxpropertygrid_getpropertyvalueasintbyname(wxObjectPtr, name)
	End Method

	Method GetPropertyValueAsLongByName:Long(name:String)
		Local value:Long
		bmx_wxpropertygrid_getpropertyvalueaslongbyname(wxObjectPtr, name, Varptr value)
		Return value
	End Method

	Method GetPropertyValueAsPointByName(name:String, x:Int Var, y:Int Var)
		bmx_wxpropertygrid_getpropertyvalueaspointbyname(wxObjectPtr, name, Varptr x, Varptr y)
	End Method

	Method GetPropertyValueAsSizeByName(name:String, w:Int Var, h:Int Var)
		bmx_wxpropertygrid_getpropertyvalueassizebyname(wxObjectPtr, name, Varptr w, Varptr h)
	End Method

	Method GetPropertyValueAsStringByName:String(name:String)
		Return bmx_wxpropertygrid_getpropertyvalueasstringbyname(wxObjectPtr, name)
	End Method

	Method GetPropertyValueAsULongByName:Int(name:String)
	End Method

	Method GetPropertyValueTypeByName:String(name:String)
		Return bmx_wxpropertygrid_getpropertyvaluetypebyname(wxObjectPtr, name)
	End Method

	Method HidePropertyByName:Int(name:String, hide:Int = True)
		Return bmx_wxpropertygrid_hidepropertybyname(wxObjectPtr, name, hide)
	End Method
	
	Method InsertByName:wxPGProperty(parent:String, index:Int, newproperty:wxPGProperty)
		Return wxPGProperty._find(bmx_wxpropertygrid_insertbyname(wxObjectPtr, parent, index, newproperty.wxObjectPtr))
	End Method
	
	Method InsertCategoryByName:wxPGProperty(name:String, index:Int, label:String)
		Return wxPGProperty._find(bmx_wxpropertygrid_insertcategorybyname(wxObjectPtr, name, index, label))
	End Method
	
	Method InsertPropertyChoiceByName(name:String, label:String, index:Int, value:Int = INT_MAX)
		bmx_wxpropertygrid_insertpropertychoicebyname(wxObjectPtr, name, label, index, value)
	End Method
	
	Method IsPropertyCategoryByName:Int(name:String)
		Return bmx_wxpropertygrid_ispropertycategorybyname(wxObjectPtr, name)
	End Method
	
	Method IsPropertyEnabledByName:Int(name:String)
		Return bmx_wxpropertygrid_ispropertyenabledbyname(wxObjectPtr, name)
	End Method
	
	Method IsPropertyExpandedByName:Int(name:String)
		Return bmx_wxpropertygrid_ispropertyexpandedbyname(wxObjectPtr, name)
	End Method
	
	Method IsPropertyModifiedByName:Int(name:String)
		Return bmx_wxpropertygrid_ispropertymodifiedbyname(wxObjectPtr, name)
	End Method
	
	Method IsPropertyShownByName:Int(name:String)
		Return bmx_wxpropertygrid_ispropertyshownbyname(wxObjectPtr, name)
	End Method
	
	Method IsPropertyUnspecifiedByName:Int(name:String)
		Return bmx_wxpropertygrid_ispropertyunspecifiedbyname(wxObjectPtr, name)
	End Method
	
	Method LimitPropertyEditingByName(name:String, limit:Int = True)
		bmx_wxpropertygrid_limitpropertyeditingbyname(wxObjectPtr, name, limit)
	End Method
	
	Method ReplacePropertyByName:wxPGProperty(name:String, property:wxPGProperty)
		Return wxPGProperty._find(bmx_wxpropertygrid_replacepropertybyname(wxObjectPtr, name, property.wxObjectPtr))
	End Method
	
	Method SetPropertyCellByName(name:String, column:Int, text:String = "", bitmap:wxBitmap = Null, fgCol:wxColour = Null, bgCol:wxColour = Null)
		If bitmap Then
			If fgCol Then
				If bgCol Then
					bmx_wxpropertygrid_setpropertycellbyname(wxObjectPtr, name, column, text, bitmap.wxObjectPtr, fgCol.wxObjectPtr, bgCol.wxObjectPtr)
				Else
					bmx_wxpropertygrid_setpropertycellbyname(wxObjectPtr, name, column, text, bitmap.wxObjectPtr, fgCol.wxObjectPtr, Null)
				End If
			Else
				If bgCol Then
					bmx_wxpropertygrid_setpropertycellbyname(wxObjectPtr, name, column, text, bitmap.wxObjectPtr, Null, bgCol.wxObjectPtr)
				Else
					bmx_wxpropertygrid_setpropertycellbyname(wxObjectPtr, name, column, text, bitmap.wxObjectPtr, Null, Null)
				End If
			End If
		Else
			If fgCol Then
				If bgCol Then
					bmx_wxpropertygrid_setpropertycellbyname(wxObjectPtr, name, column, text, Null, fgCol.wxObjectPtr, bgCol.wxObjectPtr)
				Else
					bmx_wxpropertygrid_setpropertycellbyname(wxObjectPtr, name, column, text, Null, fgCol.wxObjectPtr, Null)
				End If
			Else
				If bgCol Then
					bmx_wxpropertygrid_setpropertycellbyname(wxObjectPtr, name, column, text, Null, Null, bgCol.wxObjectPtr)
				Else
					bmx_wxpropertygrid_setpropertycellbyname(wxObjectPtr, name, column, text, Null, Null, Null)
				End If
			End If
		End If
	End Method
	
	Method SetPropertyChoicesByName(name:String, choices:wxPGChoices)
		bmx_wxpropertygrid_setpropertychoicesbyname(wxObjectPtr, name, choices.wxObjectPtr)
	End Method
	
	Method SetPropertyChoicesExclusiveByName(name:String)
		bmx_wxpropertygrid_setpropertychoicesexclusivebyname(wxObjectPtr, name)
	End Method
	
	Method SetPropertyClientDataByName(name:String, clientData:Object)
		' todo
	End Method
	
	Method SetPropertyEditorbyPropNameAndName(name:String, editorName:String)
		' todo
	End Method
	
	Method SetPropertyEditorByPropName(name:String, editor:wxPGEditor)
		' todo
	End Method
	
	Method SetPropertyImage(prop:wxPGProperty, bmp:wxBitmap)
		bmx_wxpropertygrid_setpropertyimage(wxObjectPtr, prop.wxObjectPtr, bmp.wxObjectPtr)
	End Method
	
	Method SetPropertyLabel(prop:wxPGProperty, label:String)
		bmx_wxpropertygrid_setpropertylabel(wxObjectPtr, prop.wxObjectPtr, label)
	End Method
	
	Method SetPropertyMaxLength:Int(prop:wxPGProperty, maxLen:Int)
		Return bmx_wxpropertygrid_setpropertymaxlength(wxObjectPtr, prop.wxObjectPtr, maxLen)
	End Method

	Method SetPropertyReadOnly(prop:wxPGProperty, set:Int = True)
		bmx_wxpropertygrid_setpropertyreadonly(wxObjectPtr, prop.wxObjectPtr, set)
	End Method
	
	Method SetPropertyUnspecified(prop:wxPGProperty)
		bmx_wxpropertygrid_setpropertyunspecified(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Method SetPropertyValueIntArray(prop:wxPGProperty, value:Int[])
		bmx_wxpropertygrid_setpropertyvalueintarray(wxObjectPtr, prop.wxObjectPtr, value)
	End Method
	
	Method SetPropertyValueULong(prop:wxPGProperty, value:Long)
		bmx_wxpropertygrid_setpropertyvalueulong(wxObjectPtr, prop.wxObjectPtr, value)
	End Method
	
	Method SetPropertyValueLong(prop:wxPGProperty, value:Long)
		bmx_wxpropertygrid_setpropertyvaluelong(wxObjectPtr, prop.wxObjectPtr, value)
	End Method
	
	Method SetPropertyValueSize(prop:wxPGProperty, w:Int, h:Int)
		bmx_wxpropertygrid_setpropertyvaluesize(wxObjectPtr, prop.wxObjectPtr, w, h)
	End Method
	
	Method SetPropertyValuePoint(prop:wxPGProperty, x:Int, y:Int)
		bmx_wxpropertygrid_setpropertyvaluepoint(wxObjectPtr, prop.wxObjectPtr, x, y)
	End Method
	
	Method SetPropertyValueBytePtr(prop:wxPGProperty, value:Byte Ptr)
		bmx_wxpropertygrid_setpropertyvaluebyteptr(wxObjectPtr, prop.wxObjectPtr, value)
	End Method
	
	Method SetPropertyValueString(prop:wxPGProperty, value:String)
		bmx_wxpropertygrid_setpropertyvaluestring(wxObjectPtr, prop.wxObjectPtr, value)
	End Method
	
	Method SetPropertyValueDateTime(prop:wxPGProperty, time:wxDateTime)
		bmx_wxpropertygrid_setpropertyvaluedatetime(wxObjectPtr, prop.wxObjectPtr, time.wxObjectPtr)
	End Method
	
	Method SetPropertyValueStringArray(prop:wxPGProperty, value:String[])
		bmx_wxpropertygrid_setpropertyvaluestringarray(wxObjectPtr, prop.wxObjectPtr, value)
	End Method
	
	Method SetPropertyValueBool(prop:wxPGProperty, value:Int)
		bmx_wxpropertygrid_setpropertyvaluebool(wxObjectPtr, prop.wxObjectPtr, value)
	End Method
	
	Method SetPropertyValueDouble(prop:wxPGProperty, value:Double)
		bmx_wxpropertygrid_setpropertyvaluedouble(wxObjectPtr, prop.wxObjectPtr, value)
	End Method
	
	Method SetPropertyValueInt(prop:wxPGProperty, value:Int)
		bmx_wxpropertygrid_setpropertyvalueint(wxObjectPtr, prop.wxObjectPtr, value)
	End Method

	Method SetPropertyImageByName(name:String, bmp:wxBitmap)
		bmx_wxpropertygrid_setpropertyimagebyname(wxObjectPtr, name, bmp.wxObjectPtr)
	End Method
	
	Method SetPropertyLabelByName(name:String, newproplabel:String)
		bmx_wxpropertygrid_setpropertylabelbyname(wxObjectPtr, name, newproplabel)
	End Method
	
	Method SetPropertyMaxLengthByName:Int(name:String, maxLen:Int)
		Return bmx_wxpropertygrid_setpropertymaxlengthbyname(wxObjectPtr, name, maxLen)
	End Method

	Method SetPropertyReadOnlyByName(name:String, set:Int = True)
		bmx_wxpropertygrid_setpropertyreadonlybyname(wxObjectPtr, name, set)
	End Method
	
	Method SetPropertyUnspecifiedByName(name:String)
		bmx_wxpropertygrid_setpropertyunspecifiedbyname(wxObjectPtr, name)
	End Method
	
	Method SetPropertyValueIntArrayByName(name:String, value:Int[])
		bmx_wxpropertygrid_setpropertyvalueintarraybyname(wxObjectPtr, name, value)
	End Method
	
	Method SetPropertyValueULongByName(name:String, value:Long)
		bmx_wxpropertygrid_setpropertyvalueulongbyname(wxObjectPtr, name, value)
	End Method
	
	Method SetPropertyValueLongByName(name:String, value:Long)
		bmx_wxpropertygrid_setpropertyvaluelongbyname(wxObjectPtr, name, value)
	End Method
	
	Method SetPropertyValueSizeByName(name:String, w:Int, h:Int)
		bmx_wxpropertygrid_setpropertyvaluesizebyname(wxObjectPtr, name, w, h)
	End Method
	
	Method SetPropertyValuePointByName(name:String, x:Int, y:Int)
		bmx_wxpropertygrid_setpropertyvaluepointbyname(wxObjectPtr, name, x, y)
	End Method
	
	Method SetPropertyValueBytePtrByName(name:String, value:Byte Ptr)
		bmx_wxpropertygrid_setpropertyvaluebyteptrbyname(wxObjectPtr, name, value)
	End Method
	
	Method SetPropertyValueStringByName(name:String, value:String)
		bmx_wxpropertygrid_setpropertyvaluestringbyname(wxObjectPtr, name, value)
	End Method
	
	Method SetPropertyValueDateTimeByName(name:String, time:wxDateTime)
		bmx_wxpropertygrid_setpropertyvaluedatetimebyname(wxObjectPtr, name, time)
	End Method
	
	Method SetPropertyValueStringArrayByName(name:String, value:String[])
		bmx_wxpropertygrid_setpropertyvaluestringarraybyname(wxObjectPtr, name, value)
	End Method
	
	Method SetPropertyValueBoolByName(name:String, value:Int)
		bmx_wxpropertygrid_setpropertyvalueboolbyname(wxObjectPtr, name, value)
	End Method
	
	Method SetPropertyValueDoubleByName(name:String, value:Double)
		bmx_wxpropertygrid_setpropertyvaluedoublebyname(wxObjectPtr, name, value)
	End Method
	
	Method SetPropertyValueIntByName(name:String, value:Int)
		bmx_wxpropertygrid_setpropertyvalueintbyname(wxObjectPtr, name, value)
	End Method

	Method SetPropertyAttributeByName(name:String, attrName:String, value:Int, argFlags:Int = 0)
		bmx_wxpropertygrid_setpropertyattributebyname(wxObjectPtr, name, attrName, value, argFlags)
	End Method

	Method SetPropertyAttribute(prop:wxPGProperty, attrName:String, value:Int, argFlags:Int = 0)
		bmx_wxpropertygrid_setpropertyattribute(wxObjectPtr, prop.wxObjectPtr, attrName, value, argFlags)
	End Method

	Method SetPropertyAttributeStringByName(name:String, attrName:String, value:String, argFlags:Int = 0)
		bmx_wxpropertygrid_setpropertyattributestringbyname(wxObjectPtr, name, attrName, value, argFlags)
	End Method

	Method SetPropertyAttributeString(prop:wxPGProperty, attrName:String, value:String, argFlags:Int = 0)
		bmx_wxpropertygrid_setpropertyattributestring(wxObjectPtr, prop.wxObjectPtr, attrName, value, argFlags)
	End Method

	Method GetPropertyValueAsColour:wxColour(prop:wxPGProperty)
		Return wxColour._create(bmx_wxpropertygrid_getpropertyvalueascolour(wxObjectPtr, prop.wxObjectPtr))
	End Method

	Method GetPropertyValueAsColourByName:wxColour(name:String)
		Return wxColour._create(bmx_wxpropertygrid_getpropertyvalueascolourbyname(wxObjectPtr, name))
	End Method

	Method SetPropertyValueColour(prop:wxPGProperty, value:wxColour)
		bmx_wxpropertygrid_setpropertyvaluecolour(wxObjectPtr, prop.wxObjectPtr, value.wxObjectPtr)
	End Method

	Method SetPropertyValueColourByName(name:String, value:wxColour)
		bmx_wxpropertygrid_setpropertyvaluecolourbyname(wxObjectPtr, name, value.wxObjectPtr)
	End Method

End Type

Extern
	Function bmx_wxpropertygrid_getpropertieswithflag:wxPGProperty[](handle:Byte Ptr, flags:Int, inverse:Int, iterFlags:Int)
	Function bmx_wxpropertygrid_propertiestonames:String[](handle:Byte Ptr, properties:wxPGProperty[])
	Function bmx_wxpropertygrid_namestoproperties:wxPGProperty[](handle:Byte Ptr, names:String[])
End Extern

Rem
bbdoc: wxPGProperty, is base type for properties.
End Rem
Type wxPGProperty Extends wxObject

	Function _create:wxPGProperty(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local this:wxPGProperty = New wxPGProperty
			this.wxObjectPtr = wxObjectPtr
			Return this
		End If
	End Function

	Function _find:wxPGProperty(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local prop:wxPGProperty = wxPGProperty(wxfind(wxObjectPtr))
			If Not prop Then
				Return wxPGProperty._create(wxObjectPtr)
			End If
			Return prop
		End If
	End Function

	Rem
	bbdoc: This is used by properties that have fixed sub-properties.
	End Rem
	Method AddChild(prop:wxPGProperty)
		bmx_wxpgproperty_addchild(wxObjectPtr, prop.wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Adds entry to property's wxPGChoices and editor control (if it is active).
	returns: Index of item added.
	End Rem
	Method AppendChoice:Int(label:String, value:Int = INT_MAX)
		Return bmx_wxpgproperty_appendchoice(wxObjectPtr, label, value)
	End Method
	
	Rem
	bbdoc: Returns true if extra children can be added for this property (i.e. it is wxPropertyCategory or wxCustomProperty)
	End Rem
	Method CanHaveExtraChildren:Int()
		Return bmx_wxpgproperty_canhaveextrachildren(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method ClearFlag(flag:Int)
		bmx_wxpgproperty_clearflag(wxObjectPtr, flag)
	End Method
	
	Rem
	bbdoc: Removes entry from property's wxPGChoices and editor control (if it is active).
	about: If selected item is deleted, then the value is set to unspecified.
	End Rem
	Method DeleteChoice(index:Int)
		bmx_wxpgproperty_deletechoice(wxObjectPtr, index)
	End Method
	
	Rem
	bbdoc: Deletes all sub-properties.
	End Rem
	Method Empty()
		bmx_wxpgproperty_empty(wxObjectPtr)
	End Method
	
	'Rem
	'bbdoc: If property did Not have data extension, one is created now (returns True in that Case).
	'End Rem
	'Method EnsureDataExt:Int()
	'	Return bmx_wxpgproperty_ensuredataext(wxObjectPtr)
	'End Method
	
	Rem
	bbdoc: 
	End Rem
	Method FixIndexesOfChildren(starthere:Int = 0)
		' TODO
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetArrIndex:Int()
		Return bmx_wxpgproperty_getarrindex(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Returns named attribute, as Int, if found.
	about: Otherwise defVal is returned.
	End Rem
	Method GetAttributeAsInt:Int(name:String, defVal:Int)
		Return bmx_wxpgproperty_getattributeasint(wxObjectPtr, name, defVal)
	End Method
	
	Rem
	bbdoc: Returns named attribute, as String, if found.
	about: Otherwise defVal is returned.
	End Rem
	Method GetAttributeAsString:String(name:String, defVal:String)
		Return bmx_wxpgproperty_getattributeasstring(wxObjectPtr, name, defVal)
	End Method
	
	Rem
	bbdoc: Returns named attribute, as Double.
	End Rem
	Method GetAttributeAsDouble:Double(name:String)
		Return bmx_wxpgproperty_getattributeasdouble(wxObjectPtr, name)
	End Method

	Rem
	bbdoc: Returns named attribute, as Long.
	End Rem
	Method GetAttributeAsLong:Long(name:String)
		Local value:Long
		bmx_wxpgproperty_getattributeaslong(wxObjectPtr, name, Varptr value)
		Return value
	End Method

	Rem
	bbdoc: Returns property's base name (ie. parent's name is not added in any case)
	End Rem
	Method GetBaseName:String()
		Return bmx_wxpgproperty_getbasename(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetCell:wxPGCell(column:Int)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetCellRenderer:wxPGCellRenderer(column:Int)
	End Method
	
	Rem
	bbdoc: Returns number of child properties.
	End Rem
	Method GetChildCount:Int()
		Return bmx_wxpgproperty_getchildcount(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Returns height of children, recursively, and by taking expanded/collapsed status into account.
	about: iMax is used when finding property y-positions.
	End Rem
	Method GetChildrenHeight:Int(lh:Int, iMax:Int = -1)
		Return bmx_wxpgproperty_getchildrenheight(wxObjectPtr, lh, iMax)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetChoiceCount:Int()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetChoiceInfo:Int(choiceinfo:wxPGChoiceInfo)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetChoices:wxPGChoices()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetChoiceString:String(index:Int)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetClassName:String()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetClientData:Object()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetColumnEditor:wxPGEditor(column:Int)
	End Method
	
	Rem
	bbdoc: Returns common value selected for this property, -1 for none.
	End Rem
	Method GetCommonValue:Int()
		Return bmx_wxpgproperty_getcommonvalue(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Returns number of child properties.
	End Rem
	Method GetCount:Int()
		Return bmx_wxpgproperty_getcount(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetCurrentChoice:wxPGChoiceEntry()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetDataExt:wxPGPropertyDataExt()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetDepth:Int()
		Return bmx_wxpgproperty_getdepth(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Return number of displayed common values for this property.
	End Rem
	Method GetDisplayedCommonValueCount:Int()
		Return bmx_wxpgproperty_getdisplayedcommonvaluecount(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetDisplayedString:String()
		Return bmx_wxpgproperty_getdisplayedstring(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetEditorClass:wxPGEditor()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetEditorDialog:wxPGEditorDialogAdapter()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetFlags:Int()
		Return bmx_wxpgproperty_getflags(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetFlagsAsString:String(flagsMask:Int)
		Return bmx_wxpgproperty_getflagsasstring(wxObjectPtr, flagsMask)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetGrid:wxPropertyGrid()
		Return wxPropertyGrid._create(bmx_wxpgproperty_getgrid(wxObjectPtr))
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetGridIfDisplayedwxPropertyGrid()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetHelpString:String()
		Return bmx_wxpgproperty_gethelpstring(wxObjectPtr)
	End Method
	
'	Method GetId:wxPGId()
'	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetImageSize(w:Int Var, h:Int Var)
		bmx_wxpgproperty_getimagesize(wxObjectPtr, Varptr w, Varptr h)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetIndexInParent:Int()
		Return bmx_wxpgproperty_getindexinparent(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetItemAtY:wxPGProperty(y:Int, lh:Int, nextItemY:Int Var)
		Return wxPGProperty._create(bmx_wxpgproperty_getitematy(wxObjectPtr, y, lh, Varptr nextItemY))
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetLabel:String()
		Return bmx_wxpgproperty_getlabel(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetLastVisibleSubItem:wxPGProperty()
		Return wxPGProperty._create(bmx_wxpgproperty_getlastvisiblesubitem(wxObjectPtr))
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetMainParent:wxPGProperty()
		Return wxPGProperty._create(bmx_wxpgproperty_getmainparent(wxObjectPtr))
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetMaxLength:Int()
		Return bmx_wxpgproperty_getmaxlength(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetName:String()
		Return bmx_wxpgproperty_getname(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetParent:wxPGProperty()
		Return wxPGProperty._create(bmx_wxpgproperty_getparent(wxObjectPtr))
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetParentState:wxPropertyGridState()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetPropertyByName:wxPGProperty(name:String)
		Return wxPGProperty._create(bmx_wxpgproperty_getpropertybyname(wxObjectPtr, name))
	End Method
	
	Rem
	bbdoc: Returns type name of property that is compatible with CreatePropertyByType. 
	End Rem
	Method GetType:String()
		Return bmx_wxpgproperty_gettype(wxObjectPtr)
	End Method

	Rem
	bbdoc: 
	End Rem
	Method GetValueAsArrayInt:Int[]()
		Return bmx_wxpgproperty_getvalueasarrayint(wxObjectPtr)
	End Method

	Rem
	bbdoc: 
	End Rem
	Method GetValueAsArrayString:String[]()
		Return bmx_wxpgproperty_getvalueasarraystring(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetValueAsString:String()
		Return bmx_wxpgproperty_getvalueasstring(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetValueAsDouble:Double()
		Return bmx_wxpgproperty_getvalueasdouble(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetValueAsBool:Int()
		Return bmx_wxpgproperty_getvalueasbool(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetValueAsInt:Int()
		Return bmx_wxpgproperty_getvalueasint(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetValueAsLong:Long()
		Local value:Long
		bmx_wxpgproperty_getvalueaslong(wxObjectPtr, Varptr value)
		Return value
	End Method

	Rem
	bbdoc: 
	End Rem
	Method GetValueAsPoint(x:Int Var, y:Int Var)
		bmx_wxpgproperty_getvalueaspoint(wxObjectPtr, Varptr x, Varptr y)
	End Method

	Rem
	bbdoc: 
	End Rem
	Method GetValueAsSize(w:Int Var, h:Int Var)
		bmx_wxpgproperty_getvalueassize(wxObjectPtr, Varptr w, Varptr h)
	End Method


	Rem
	bbdoc: Returns the property value as a wxColour.
	End Rem
	Method GetValueAsColour:wxColour()
		Return wxColour._create(bmx_wxpgproperty_getvalueascolour(wxObjectPtr))
	End Method
	
	Rem
	bbdoc: Returns text representation of property's value. 
	about: Parameters:
	<ul>
	<li><b>argFlags</b> 	If wxPG_FULL_VALUE is set, returns complete, storable string value instead of
	displayable. If wxPG_EDITABLE_VALUE is set, returns string value that must be editable in textctrl. If
	wxPG_COMPOSITE_FRAGMENT is set, returns text that is appropriate to display as a part of composite
	property string value.</li>
	</ul>
	End Rem
	Method GetValueString:String(argFlags:Int = 0)
		Return bmx_wxpgproperty_getvaluestring(wxObjectPtr, argFlags)
	End Method
	
	Rem
	bbdoc: Returns coordinate to the top y of the property.
	about: Note that the position of scrollbars is not taken into account. 
	End Rem
	Method GetY:Int()
		Return bmx_wxpgproperty_gety(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method HasFlag:Int(flag:Int)
		Return bmx_wxpgproperty_hasflag(wxObjectPtr, flag)
	End Method
	
	Rem
	bbdoc: Hides or reveals the property. 
	End Rem
	Method Hide:Int(hide:Int)
		Return bmx_wxpgproperty_hide(wxObjectPtr, hide)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method Index:Int(p:wxPGProperty)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method InsertChoice:Int(label:String, index:Int, value:Int = INT_MAX)
	End Method
	
	Rem
	bbdoc: Returns true if this property is actually a wxPropertyCategory. 
	End Rem
	Method IsCategory:Int()
		Return bmx_wxpgproperty_iscategory(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Returns true if this property is enabled.
	End Rem
	Method IsEnabled:Int()
		Return bmx_wxpgproperty_isenabled(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Returns true if this property is expanded.
	End Rem
	Method IsExpanded:Int()
		Return bmx_wxpgproperty_isexpanded(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the specified flag is set.
	End Rem
	Method IsFlagSet:Int(flag:Int)
		Return bmx_wxpgproperty_isflagset(wxObjectPtr, flag)
	End Method
	
	Rem
	bbdoc: Returns true if this property is actually a wxRootProperty. 
	End Rem
	Method IsRoot:Int()
		Return bmx_wxpgproperty_isroot(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method IsSomeParent:Int(candidateParent:wxPGProperty)
	End Method
	
	Rem
	bbdoc: Returns true if this is a sub-property. 
	End Rem
	Method IsSubProperty:Int()
		Return bmx_wxpgproperty_issubproperty(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method IsValueUnspecified:Int()
		Return bmx_wxpgproperty_isvalueunspecified(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Returns true if all parents expanded. 
	End Rem
	Method IsVisible:Int()
		Return bmx_wxpgproperty_isvisible(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Returns sub-property at index i.
	End Rem
	Method Item:wxPGProperty(i:Int)
		Return wxPGProperty._create(bmx_wxpgproperty_item(wxObjectPtr, i))
	End Method
	
	Rem
	bbdoc: Returns last sub-property.
	End Rem
	Method Last:wxPGProperty()
		Return wxPGProperty._create(bmx_wxpgproperty_last(wxObjectPtr))
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method PrepareValueForDialogEditing:Int(propgrid:wxPropertyGrid)
	End Method
	
	Rem
	bbdoc: If property's editor is created this forces its recreation.
	about: Useful in SetAttribute etc. Returns true if actually did anything.
	End Rem
	Method RecreateEditor:Int()
		Return bmx_wxpgproperty_recreateeditor(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Refresh values of child properties.
	about: Automatically called after value is set. 
	End Rem
	Method RefreshChildren()
		bmx_wxpgproperty_refreshchildren(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: If property's editor is active, then update it's value. 
	End Rem
	Method RefreshEditor()
		bmx_wxpgproperty_refresheditor(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Sets a string attribute of a property.
	about: Ids and relevants values are totally specific to property classes and may affect either the given instance or all instances of that class.
	End Rem
	Method SetAttributeString(name:String, value:String)
		bmx_wxpgproperty_setattributestring(wxObjectPtr, name, value)
	End Method

	Rem
	bbdoc: Sets an int attribute of a property.
	about: Ids and relevants values are totally specific to property classes and may affect either the given instance or all instances of that class.
	End Rem
	Method SetAttributeInt(name:String, value:Int)
		bmx_wxpgproperty_setattributeint(wxObjectPtr, name, value)
	End Method

	Rem
	bbdoc: Sets a double attribute of a property.
	about: Ids and relevants values are totally specific to property classes and may affect either the given instance or all instances of that class.
	End Rem
	Method SetAttributeDouble(name:String, value:Double)
		bmx_wxpgproperty_setattributedouble(wxObjectPtr, name, value)
	End Method

	Rem
	bbdoc: Sets a bool attribute of a property.
	about: Ids and relevants values are totally specific to property classes and may affect either the given instance or all instances of that class.
	End Rem
	Method SetAttributeBool(name:String, value:Int)
		bmx_wxpgproperty_setattributebool(wxObjectPtr, name, value)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetAttributes(attributes:wxPGAttributeStorage)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetCell(column:Int, cellObj:wxPGCell)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetChoices:Int(labels:String[], values:Int[] = Null)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetChoiceSelection(newValue:Int, choiceInfo:wxPGChoiceInfo)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetChoicesExclusive()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetClientData(clientData:Object)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetCommonValue(commonValue:Int)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetEditorByName(editorName:String)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetEditor(editor:wxPGEditor)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetExpanded(expanded:Int)
		bmx_wxpgproperty_setexpanded(wxObjectPtr, expanded)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetFlag(flag:Int)
		bmx_wxpgproperty_setflag(wxObjectPtr, flag)
	End Method
	
	Rem
	bbdoc: Sets flags from a '|' delimited string.
	about: Note that flag names are not prepended with 'wxPG_PROP_'.
	End Rem
	Method SetFlagsFromString(s:String)
		bmx_wxpgproperty_setflagsfromstring(wxObjectPtr, s)
	End Method
	
	Rem
	bbdoc: Sets the help string.
	End Rem
	Method SetHelpString(helpString:String)
		bmx_wxpgproperty_sethelpstring(wxObjectPtr, helpString)
	End Method
	
	Rem
	bbdoc: Sets the property label.
	End Rem
	Method SetLabel(label:String)
		bmx_wxpgproperty_setlabel(wxObjectPtr, label)
	End Method
	
	Rem
	bbdoc: Set max length of text editor.
	End Rem
	Method SetMaxLength:Int(maxLen:Int)
		Return bmx_wxpgproperty_setmaxlength(wxObjectPtr, maxLen)
	End Method

	Rem
	bbdoc: Sets the value (Int[]) of the property.
	End Rem
	Method SetValueIntArray(value:Int[])
		bmx_wxpgproperty_setvalueintarray(wxObjectPtr, value)
	End Method
	
	Rem
	bbdoc: Sets the value (ULong) of the property.
	End Rem
	Method SetValueULong(value:Long) 
		bmx_wxpgproperty_setvalueulong(wxObjectPtr, value)
	End Method
	
	Rem
	bbdoc: Sets the value (Long) of the property.
	End Rem
	Method SetValueLong(value:Long) 
		bmx_wxpgproperty_setvaluelong(wxObjectPtr, value)
	End Method
	
	Rem
	bbdoc: Sets the value (w, y) of the property.
	End Rem
	Method SetValueSize(w:Int, h:Int) 
		bmx_wxpgproperty_setvaluesize(wxObjectPtr, w, h)
	End Method
	
	Rem
	bbdoc: Sets the value (x, y) of the property.
	End Rem
	Method SetValuePoint(x:Int, y:Int) 
		bmx_wxpgproperty_setvaluepoint(wxObjectPtr, x, y)
	End Method
	
	Rem
	bbdoc: Sets the value (Byte Ptr) of the property.
	End Rem
	Method SetValueBytePtr(value:Byte Ptr) 
		bmx_wxpgproperty_setvaluebyteptr(wxObjectPtr, value)
	End Method
	
	Rem
	bbdoc: Sets the value (String) of the property.
	End Rem
	Method SetValueString(value:String) 
		bmx_wxpgproperty_setvaluestring(wxObjectPtr, value)
	End Method
	
	Rem
	bbdoc: Sets the value (String[]) of the property.
	End Rem
	Method SetValueStringArray(value:String[]) 
		bmx_wxpgproperty_setvaluestringarray(wxObjectPtr, value)
	End Method
	
	Rem
	bbdoc: Sets the value (Bool) of the property.
	End Rem
	Method SetValueBool(value:Int) 
		bmx_wxpgproperty_setvaluebool(wxObjectPtr, value)
	End Method
	
	Rem
	bbdoc: Sets the value (Double) of the property.
	End Rem
	Method SetValueDouble(value:Double) 
		bmx_wxpgproperty_setvaluedouble(wxObjectPtr, value)
	End Method
	
	Rem
	bbdoc: Sets the value (Int) of the property.
	End Rem
	Method SetValueInt(value:Int) 
		bmx_wxpgproperty_setvalueint(wxObjectPtr, value)
	End Method

	Rem
	bbdoc: Sets the value (wxColour) of the property.
	End Rem
	Method SetValueColour(value:wxColour)
		bmx_wxpgproperty_setvaluecolour(wxObjectPtr, value.wxObjectPtr)
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxPGPropertyWithChildren Extends wxPGProperty

	Function _create:wxPGPropertyWithChildren(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local this:wxPGPropertyWithChildren = New wxPGPropertyWithChildren
			this.wxObjectPtr = wxObjectPtr
			Return this
		End If
	End Function

End Type

Rem
bbdoc: 
End Rem
Type wxStringProperty Extends wxPGProperty

	Method Create:wxStringProperty(label:String = Null, name:String = Null, value:String = Null)
		If label = wxPG_LABEL label = Null
		If name = wxPG_LABEL name = Null
		wxObjectPtr = bmx_wxstringproperty_create(Self, label, name, value)
		Return Self
	End Method
	
End Type

Rem
bbdoc: 
End Rem
Type wxIntProperty Extends wxPGProperty

	Method Create:wxIntProperty(label:String = Null, name:String = Null, value:Int = 0)
		If label = wxPG_LABEL label = Null
		If name = wxPG_LABEL name = Null
		wxObjectPtr = bmx_wxintproperty_create(Self, label, name, value)
		Return Self
	End Method
End Type

Rem
bbdoc: 
End Rem
Type wxUIntProperty Extends wxPGProperty

	Method Create:wxUIntProperty(label:String = Null, name:String = Null, value:Int = 0)
		If label = wxPG_LABEL label = Null
		If name = wxPG_LABEL name = Null
		wxObjectPtr = bmx_wxuintproperty_create(Self, label, name, value)
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxDoubleProperty Extends wxPGProperty

	Method Create:wxDoubleProperty(label:String = Null, name:String = Null, value:Double = 0)
		If label = wxPG_LABEL label = Null
		If name = wxPG_LABEL name = Null
		wxObjectPtr = bmx_wxdoubleproperty_create(Self, label, name, value)
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxBoolProperty Extends wxPGProperty

	Method Create:wxBoolProperty(label:String = Null, name:String = Null, value:Int = False)
		If label = wxPG_LABEL label = Null
		If name = wxPG_LABEL name = Null
		wxObjectPtr = bmx_wxboolproperty_create(Self, label, name, value)
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxFlagsProperty Extends wxPGProperty

	Method Create:wxFlagsProperty(label:String = Null, name:String = Null, labels:String[] = Null, ..
			values:Int[] = Null, value:Int = 0)
		If label = wxPG_LABEL label = Null
		If name = wxPG_LABEL name = Null
		wxObjectPtr = bmx_wxflagsproperty_create(Self, label, name, labels, values, value)
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxFileProperty Extends wxPGProperty

	Method Create:wxFileProperty(label:String = Null, name:String = Null, value:String = "")
		If label = wxPG_LABEL label = Null
		If name = wxPG_LABEL name = Null
		wxObjectPtr = bmx_wxfileproperty_create(Self, label, name, value)
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxLongStringProperty Extends wxPGProperty

	Method Create:wxLongStringProperty(label:String = Null, name:String = Null, value:String = "")
		If label = wxPG_LABEL label = Null
		If name = wxPG_LABEL name = Null
		wxObjectPtr = bmx_wxlongstringproperty_create(Self, label, name, value)
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxDirProperty Extends wxPGProperty

	Method Create:wxDirProperty(label:String = Null, name:String = Null, value:String = "")
		If label = wxPG_LABEL label = Null
		If name = wxPG_LABEL name = Null
		wxObjectPtr = bmx_wxdirproperty_create(Self, label, name, value)
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxArrayStringProperty Extends wxPGProperty

	Method Create:wxArrayStringProperty(label:String = Null, name:String = Null, value:String[] = Null)
		wxObjectPtr = bmx_wxarraystringproperty_create(Self, label, name, value)
		Return Self
	End Method

End Type



'Rem
'bbdoc: 
'End Rem
'Type wxParentProperty Extends wxPGPropertyWithChildren
'End Type

Rem
bbdoc: 
End Rem
Type wxCustomProperty Extends wxPGProperty
End Type

Rem
bbdoc: 
End Rem
Type wxFontProperty Extends wxPGPropertyWithChildren

	Method Create:wxFontProperty(label:String, name:String = Null, font:wxFont = Null)
		If font Then
			wxObjectPtr = bmx_wxfontproperty_create(Self, label, name, font.wxObjectPtr)
		Else
			wxObjectPtr = bmx_wxfontproperty_create(Self, label, name, Null)
		End If
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxPropertyCategory Extends wxPGPropertyWithChildren

	Function _create:wxPropertyCategory(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local this:wxPropertyCategory = New wxPropertyCategory
			this.wxObjectPtr = wxObjectPtr
			Return this
		End If
	End Function

	Function _find:wxPropertyCategory(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local prop:wxPropertyCategory = wxPropertyCategory(wxfind(wxObjectPtr))
			If Not prop Then
				Return wxPropertyCategory._create(wxObjectPtr)
			End If
			Return prop
		End If
	End Function
	
	Rem
	bbdoc: 
	End Rem
	Method Create:wxPropertyCategory(label:String, name:String = Null)
		If label = wxPG_LABEL label = Null
		If name = wxPG_LABEL name = Null
		wxObjectPtr = bmx_wxpropertycategory_create(Self, label, name)
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxBaseEnumProperty Extends wxPGProperty
End Type

Rem
bbdoc: 
End Rem
Type wxEnumProperty Extends wxBaseEnumProperty

	Function CreateEnumPropertyWithArrays:wxEnumProperty(label:String, name:String, labels:String[], ..
			values:Int[] = Null, value:Int = 0)
		Return New wxEnumProperty.CreateWithArrays(label, name, labels, values, value)
	End Function

	Method CreateWithArrays:wxEnumProperty(label:String, name:String, labels:String[], ..
			values:Int[] = Null, value:Int = 0)
		wxObjectPtr = bmx_wxenumproperty_createwitharrays(Self, label, name, labels, values, value)
		Return Self
	End Method

	Function CreateEnumPropertyWithChoice:wxEnumProperty(label:String, name:String, choices:wxPGChoices, value:Int = 0)
		Return New wxEnumProperty.CreateWithChoices(label, name, choices, value)
	End Function

	Method CreateWithChoices:wxEnumProperty(label:String, name:String, choices:wxPGChoices, value:Int = 0)
		wxObjectPtr = bmx_wxenumproperty_createwithchoices(Self, label, name, choices.wxObjectPtr, value)
		Return Self
	End Method
	
	Method GetChoices:wxPGChoices()
		' TODO
	End Method
	
	Method GetEntry:String(index:Int, value:Int Var)
		' TODO
	End Method
	
	Method GetIndexForValue:Int(value:Int)
		' TODO
	End Method
	
	Method GetItemCount:Int()
		' TODO
	End Method
	
	
	
End Type

Rem
bbdoc: Has dropdown list of wxWidgets system colours. 
End Rem
Type wxSystemColourProperty Extends wxEnumProperty

	Method Create:wxSystemColourProperty(label:String, name:String = Null, value:wxColour = Null)
		If value Then
			wxObjectPtr = bmx_wxsystemcolourproperty_create(Self, label, name, value.wxObjectPtr)
		Else
			wxObjectPtr = bmx_wxsystemcolourproperty_create(Self, label, name, Null)
		End If
		Return Self
	End Method
	
	Rem
	bbdoc: Default is to use wxSystemSettings::GetColour(index). 
	End Rem
	Method GetColour:wxColour(index:Int)	
		' TODO
	End Method
	
End Type

Rem
bbdoc: 
End Rem
Type wxColourProperty Extends wxSystemColourProperty

	Method Create:wxColourProperty(label:String, name:String = Null, value:wxColour = Null)
		If value Then
			wxObjectPtr = bmx_wxcolourproperty_create(Self, label, name, value.wxObjectPtr)
		Else
			wxObjectPtr = bmx_wxcolourproperty_create(Self, label, name, Null)
		End If
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxCursorProperty Extends wxEnumProperty

	Method Create:wxCursorProperty(label:String = Null, name:String = Null, value:Int = 0)
		wxObjectPtr = bmx_wxcursorproperty_create(Self, label, name, value)
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxImageFileProperty Extends wxFileProperty

	Method Create:wxImageFileProperty(label:String = Null, name:String = Null, value:String = "")
		wxObjectPtr = bmx_wximagefileproperty_create(Self, label, name, value)
		Return Self
	End Method

End Type

Rem
bbdoc: Property representing wxDateTime.
about: <b>Supported special attributes:</b>
<ul>
<li>"DateFormat": Determines displayed date format.</li>
<li>"PickerStyle": Determines window style used with wxDatePickerCtrl. Default is wxDP_DEFAULT | wxDP_SHOWCENTURY. </li>
</ul>
End Rem
Type wxDateProperty Extends wxPGProperty

	Rem
	bbdoc: 
	End Rem
	Method Create:wxDateProperty(label:String = Null, name:String = Null, value:wxDateTime = Null)
		If value Then
			wxObjectPtr = bmx_wxdateproperty_create(Self, label, name, value.wxObjectPtr)
		Else
			wxObjectPtr = bmx_wxdateproperty_create(Self, label, name, Null)
		End If
		Return Self
	End Method

	Rem
	bbdoc: 
	End Rem
	Method GetDatePickerStyle:Int()
		Return bmx_wxdateproperty_getdatepickerstyle(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetDateValue:wxDateTime()
		Return wxDateTime._create(bmx_wxdateproperty_getdatevalue(wxObjectPtr))
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetFormat:String()
		Return bmx_wxdateproperty_getformat(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetDateValue(dt:wxDateTime)
		bmx_wxdateproperty_setdatevalue(wxObjectPtr, dt.wxObjectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetFormat(format:String)
		bmx_wxdateproperty_setformat(wxObjectPtr, format)
	End Method
	
End Type

Rem
bbdoc: 
End Rem
Type wxMultiChoiceProperty Extends wxPGProperty

	Function CreateMultiChoicePropertyWithArrays:wxMultiChoiceProperty(label:String, name:String, labels:String[], ..
			value:String[] = Null)
		Return New wxMultiChoiceProperty.CreateWithArrays(label, name, labels, value)
	End Function

	Method CreateWithArrays:wxMultiChoiceProperty(label:String, name:String, labels:String[], ..
			value:String[] = Null)
		wxObjectPtr = bmx_wxmultichoiceproperty_createwitharrays(Self, label, name, labels, value)
		Return Self
	End Method

	Function CreateMultiChoicePropertyWithChoice:wxMultiChoiceProperty(label:String, name:String, choices:wxPGChoices, value:String[] = Null)
		Return New wxMultiChoiceProperty.CreateWithChoices(label, name, choices, value)
	End Function

	Method CreateWithChoices:wxMultiChoiceProperty(label:String, name:String, choices:wxPGChoices, value:String[] = Null)
		wxObjectPtr = bmx_wxmultichoiceproperty_createwithchoices(Self, label, name, choices.wxObjectPtr, value)
		Return Self
	End Method

End Type

Rem
bbdoc: 
End Rem
Type wxColourPropertyValue Extends wxObject

	Function _create:wxColourPropertyValue(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local this:wxColourPropertyValue = New wxColourPropertyValue
			this.wxObjectPtr = wxObjectPtr
			Return this
		End If
	End Function
	
	Method Delete()
		If wxObjectPtr Then
			bmx_wxcolourpropertyvalue_delete(wxObjectPtr)
			wxObjectPtr = Null
		End If
	End Method
	
End Type

Rem
'bbdoc: 
'End Rem
Type wxPGPropArg

	Field pgidPtr:Byte Ptr

	Function _create:wxPGPropArg(pgidPtr:Byte Ptr)
		If pgidPtr Then
			Local this:wxPGPropArg = New wxPGPropArg
			this.pgidPtr = pgidPtr
			Return this
		End If
	End Function
	
	Method Delete()
		If pgidPtr Then
			bmx_wxpgproparg_delete(pgidPtr)
			pgidPtr = Null
		End If
	End Method

End Type
End Rem

Rem
bbdoc: Helper type for managing choices for properties.
about: Each entry can have label, value, bitmap, text colour, and background colour.
End Rem
Type wxPGChoices

	Field wxObjectPtr:Byte Ptr

	Function _create:wxPGChoices(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local this:wxPGChoices = New wxPGChoices
			this.wxObjectPtr = wxObjectPtr
			Return this
		End If
	End Function

	Function CreateChoices:wxPGChoices()
		Return New wxPGChoices.Create()
	End Function
	
	Method Create:wxPGChoices()
		wxObjectPtr = bmx_wxpgchoices_create()
		Return Self
	End Method
	
	Method Add:wxPGChoiceEntry(label:String, value:Int = INT_MAX)
		Return wxPGChoiceEntry._create(bmx_wxpgchoices_add(wxObjectPtr, label, value))
	End Method
	
	Method AddEntries(labels:String[], values:Int[])
		bmx_wxpgchoices_addentries(wxObjectPtr, labels, values)
	End Method

	Method AddAsSorted:wxPGChoiceEntry(label:String, value:Int = INT_MAX)
		Return wxPGChoiceEntry._create(bmx_wxpgchoices_addassorted(wxObjectPtr, label, value))
	End Method
	
	Method GetCount:Int()
		Return bmx_wxpgchoices_getcount(wxObjectPtr)
	End Method
	
	Method GetLabel:String(index:Int)
		Return bmx_wxpgchoices_getlabel(wxObjectPtr, index)
	End Method
	
	Method GetLabels:String[]()
		Return bmx_wxpgchoices_getlabels(wxObjectPtr)
	End Method
	
	Method GetValue:Int(index:Int)
		Return bmx_wxpgchoices_getvalue(wxObjectPtr, index)
	End Method
	
	Method HasValue:Int(value:Int)
		Return bmx_wxpgchoices_hasvalue(wxObjectPtr, value)
	End Method
	
	Method HasValues:Int()
		Return bmx_wxpgchoices_hasvalues(wxObjectPtr)
	End Method
	
	Method Index:Int(value:Int)
		Return bmx_wxpgchoices_index(wxObjectPtr, value)
	End Method
	
	Method IndexForLabel:Int(label:String)
		Return bmx_wxpgchoices_indexforlabel(wxObjectPtr, label)
	End Method
	
	Method Insert:wxPGChoiceEntry(label:String, index:Int, value:Int = INT_MAX)
		Return wxPGChoiceEntry._create(bmx_wxpgchoices_insert(wxObjectPtr, label, index, value))
	End Method
	
	Method IsOk:Int()
		Return bmx_wxpgchoices_isok(wxObjectPtr)
	End Method
	
	Method Item:wxPGChoiceEntry(index:Int)
		Return wxPGChoiceEntry._create(bmx_wxpgchoices_item(wxObjectPtr, index))
	End Method
	
	Method RemoveAt(index:Int, count:Int = 1)
		bmx_wxpgchoices_removeat(wxObjectPtr, index, count)
	End Method
	
	Method Set(labels:String[], values:Int[] = Null)
		bmx_wxpgchoices_set(wxObjectPtr, labels, values)
	End Method
	
	Method Delete()
		If wxObjectPtr Then
			bmx_wxpgchoices_delete(wxObjectPtr)
			wxObjectPtr = Null
		End If
	End Method

End Type

Rem
bbdoc: Attribute of a single choice.
End Rem
Type wxPGChoiceEntry Extends wxPGCell

	Function _create:wxPGChoiceEntry(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local this:wxPGChoiceEntry = New wxPGChoiceEntry
			this.wxObjectPtr = wxObjectPtr
			Return this
		End If
	End Function

	Method GetBgCol:wxColour()
		Return wxColour._create(bmx_wxpgchoiceentry_getbgcol(wxObjectPtr))
	End Method
	
	Method GetBitmap:wxBitmap()
		Return wxBitmap._create(bmx_wxpgchoiceentry_getbitmap(wxObjectPtr))
	End Method
	
	Method GetFgCol:wxColour()
		Return wxColour._create(bmx_wxpgchoiceentry_getfgcol(wxObjectPtr))
	End Method
	
	Method GetText:String()
		Return bmx_wxpgchoiceentry_gettext(wxObjectPtr)
	End Method
	
	Method SetBgCol(col:wxColour)
		bmx_wxpgchoiceentry_setbgcol(wxObjectPtr, col.wxObjectPtr)
	End Method
	
	Method SetBitmap(bitmap:wxBitmap)
		bmx_wxpgchoiceentry_setbitmap(wxObjectPtr, bitmap.wxObjectPtr)
	End Method
	
	Method SetFgCol(col:wxColour)
		bmx_wxpgchoiceentry_setfgcol(wxObjectPtr, col.wxObjectPtr)
	End Method
	
	Method SetText(text:String)
		bmx_wxpgchoiceentry_settext(wxObjectPtr, text)
	End Method
	
	Method GetValue:Int()
		Return bmx_wxpgchoiceentry_getvalue(wxObjectPtr)
	End Method
	
	Method HasValue:Int()
		Return bmx_wxpgchoiceentry_hasvalue(wxObjectPtr)
	End Method
	
	Method SetValue(value:Int)
		bmx_wxpgchoiceentry_setvalue(wxObjectPtr, value)
	End Method
	
	Method Delete()
		If wxObjectPtr Then
			bmx_wxpgchoiceentry_delete(wxObjectPtr)
			wxObjectPtr = Null
		End If
	End Method
	
End Type


Rem
bbdoc: 
End Rem
Type wxPropertyGridIteratorBase

	Field wxObjectPtr:Byte Ptr

	Function _create:wxPropertyGridIteratorBase(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local this:wxPropertyGridIteratorBase = New wxPropertyGridIteratorBase
			this.wxObjectPtr = wxObjectPtr
			Return this
		End If
	End Function
	
	Rem
	bbdoc: Returns True if at the end.
	End Rem
	Method AtEnd:Int()
		Return bmx_wxpropertygriditeratorbase_atend(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Get current property.
	End Rem
	Method GetProperty:wxPGProperty()
		Return wxPGProperty._create(bmx_wxpropertygriditeratorbase_getproperty(wxObjectPtr))
	End Method
	
'	Rem
'	bbdoc: Get current property, as wxPGPropertyWithChildren, but Null If Not valid as such.
'	End Rem
'	Method GetPropertyWithChildren:wxPGPropertyWithChildren()
'		Return wxPGPropertyWithChildren._create(bmx_wxpropertygriditeratorbase_getpropertywithchildren(wxObjectPtr))
'	End Method
	
	Rem
	bbdoc: Iterate to the next property.
	End Rem
	Method NextProperty(iterateChildren:Int = True)
		bmx_wxpropertygriditeratorbase_nextproperty(wxObjectPtr, iterateChildren)
	End Method
	
	Rem
	bbdoc: Iterate to the previous property.
	End Rem
	Method PrevProperty()
		bmx_wxpropertygriditeratorbase_prevproperty(wxObjectPtr)
	End Method
	
	Rem
	bbdoc: Set base parent, ie. a property when, in which iteration returns, it ends.
	about: Default base parent is the root of the used wxPropertyGridState.
	End Rem
	Method SetBaseParent(baseParent:wxPGPropertyWithChildren)
		bmx_wxpropertygriditeratorbase_setbaseparent(wxObjectPtr, baseParent.wxObjectPtr)
	End Method

End Type

Rem
bbdoc: Preferable way to iterate through contents of wxPropertyGrid, wxPropertyGridManager, and wxPropertyGridPage.
about: See wxPropertyContainerMethods::GetIterator() for more information about usage.
End Rem
Type wxPropertyGridIterator Extends wxPropertyGridIteratorBase

End Type

Rem
bbdoc: 
End Rem
Type wxPGEditor Extends wxObject

	Function _create:wxPGEditor(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local this:wxPGEditor = New wxPGEditor
			this.wxObjectPtr = wxObjectPtr
			Return this
		End If
	End Function

	Function _find:wxPGEditor(wxObjectPtr:Byte Ptr)
		If wxObjectPtr Then
			Local prop:wxPGEditor = wxPGEditor(wxfind(wxObjectPtr))
			If Not prop Then
				Return wxPGEditor._create(wxObjectPtr)
			End If
			Return prop
		End If
	End Function

End Type

Type wxPGCell

	Field wxObjectPtr:Byte Ptr

	Method GetBgCol:wxColour()
	End Method
	
	Method GetBitmap:wxBitmap()
	End Method
	
	Method GetFgCol:wxColour()
	End Method
	
	Method GetText:String()
	End Method
	
	Method SetBgCol(col:wxColour)
	End Method
	
	Method SetBitmap(bitmap:wxBitmap)
	End Method
	
	Method SetFgCol(col:wxColour)
	End Method
	
	Method SetText(text:String)
	End Method

End Type

Type wxPGCellRenderer
End Type

Type wxPGChoiceInfo
End Type

Type wxPGPropertyDataExt
End Type

Type wxPGEditorDialogAdapter
End Type

Type wxPGAttributeStorage
End Type

Rem
bbdoc: Holds information about events associated with wxPropertyGrid objects.
End Rem
Type wxPropertyGridEvent Extends wxCommandEvent

	Function Create:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
		Local this:wxPropertyGridEvent = New wxPropertyGridEvent
		
		this.init(wxEventPtr, evt)
		
		Return this
	End Function

	Rem
	bbdoc: Returns true if you can veto the action that the event is signaling.
	End Rem
	Method CanVeto:Int()
		Return bmx_wxpropertygridevent_canveto(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Disables property. 
	End Rem
	Method DisableProperty()
		bmx_wxpropertygridevent_disableproperty(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Enables property. 
	End Rem
	Method EnableProperty(enable:Int = True)
		bmx_wxpropertygridevent_enableproperty(wxEventPtr, enable)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method GetMainParent:wxPGProperty()
		Return wxPGProperty._find(bmx_wxpropertygridevent_getmainparent(wxEventPtr))
	End Method
	
	Rem
	bbdoc: Returns associated property. 
	End Rem
	Method GetProperty:wxPGProperty()
		Return wxPGProperty._find(bmx_wxpropertygridevent_getproperty(wxEventPtr))
	End Method
	
	Rem
	bbdoc: Returns client data of relevant property. 
	End Rem
	Method GetPropertyClientData:Object()
		' TODO
	End Method
	
	Rem
	bbdoc: Returns label of associated property. 
	End Rem
	Method GetPropertyLabel:String()
		Return bmx_wxpropertygridevent_getpropertylabel(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns global name of associated property. 
	End Rem
	Method GetPropertyName:String()
		Return bmx_wxpropertygridevent_getpropertyname(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns value of relevant property, as array of ints.
	End Rem
	Method GetPropertyValueAsArrayInt:Int[]()
		Return bmx_wxpropertygridevent_getpropertyvalueasarrayint(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns value of relevant property, as array of strings.
	End Rem
	Method GetPropertyValueAsArrayString:String[]()
		Return bmx_wxpropertygridevent_getpropertyvalueasarraystring(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns value of relevant property, as bool.
	End Rem
	Method GetPropertyValueAsBool:Int()
		Return bmx_wxpropertygridevent_getpropertyvalueasbool(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns value of relevant property, as double.
	End Rem
	Method GetPropertyValueAsDouble:Double()
		Return bmx_wxpropertygridevent_getpropertyvalueasdouble(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns value of relevant property, as int.
	End Rem
	Method GetPropertyValueAsInt:Int()
		Return bmx_wxpropertygridevent_getpropertyvalueasint(wxEventPtr)
	End Method
	
	Rem
	bbdoc: Returns value of relevant property, as (x, y) point.
	End Rem
	Method GetPropertyValueAsPoint(x:Int Var, y:Int Var)
		bmx_wxpropertygridevent_getpropertyvalueaspoint(wxEventPtr, Varptr x, Varptr y)
	End Method
	
	Rem
	bbdoc: Returns value of relevant property, as (x, h) size.
	End Rem
	Method GetPropertyValueAsSize(w:Int Var, h:Int Var)
		bmx_wxpropertygridevent_getpropertyvalueassize(wxEventPtr, Varptr w, Varptr h)
	End Method
	
	Rem
	bbdoc: Returns value of relevant property, as string.
	End Rem
	Method GetPropertyValueAsString:String()
		Return bmx_wxpropertygridevent_getpropertyvalueasstring(wxEventPtr)
	End Method

	Rem
	bbdoc: Returns true if event has associated property.
	End Rem
	Method HasProperty:Int()
		Return bmx_wxpropertygridevent_hasproperty(wxEventPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method IsPropertyEnabled:Int()
		Return bmx_wxpropertygridevent_ispropertyenabled(wxEventPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetCanVeto(canVeto:Int)
		' TODO or not required
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SetProperty(p:wxPGProperty)
		' TODO
	End Method
	
	Rem
	bbdoc: Changes the associated property.
	End Rem
	Method SetPropertyGrid(pg:wxPropertyGrid)
		' TODO
	End Method
	
	'method SetValue(Const wxVariant &value)
	'end method
	
	Rem
	bbdoc: Set override validation failure behavior.
	about: Only effective if Veto was also called, and only allowed if event type is wxEVT_PG_CHANGING. 
	End Rem
	Method SetValidationFailureBehavior(flags:Int)
		' TODO
	End Method
	
	Rem
	bbdoc: Sets custom failure message for this time only.
	about: Only applies if wxPG_VFB_SHOW_MESSAGE is set in validation failure flags. 
	End Rem
	Method SetValidationFailureMessage(message:String)
		' TODO
	End Method
	
	Rem
	bbdoc: Call this from your event handler to veto action that the event is signaling.
	about: You can only veto a shutdown if wxPropertyGridEvent::CanVeto returns true.
	End Rem
	Method Veto(value:Int = True)
		bmx_wxpropertygridevent_veto(wxEventPtr, value)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method WasVetoed:Int()
		' TODO
	End Method
	

End Type

Type TPropertyGridEventFactory Extends TEventFactory

	Method CreateEvent:wxEvent(wxEventPtr:Byte Ptr, evt:TEventHandler)
	
		Select evt.eventType
			Case wxEVT_PG_SELECTED, ..
					wxEVT_PG_CHANGING, ..
					wxEVT_PG_CHANGED, ..
					wxEVT_PG_HIGHLIGHTED, ..
					wxEVT_PG_RIGHT_CLICK, ..
					wxEVT_PG_PAGE_CHANGED, ..
					wxEVT_PG_ITEM_EXPANDED, ..
					wxEVT_PG_ITEM_COLLAPSED, ..
					wxEVT_PG_DOUBLE_CLICK

					
				Return wxPropertyGridEvent.Create(wxEventPtr, evt)
		End Select
		
		Return Null
	End Method

	Method GetEventType:Int(eventType:Int)
		Select eventType
			Case wxEVT_PG_SELECTED, ..
					wxEVT_PG_CHANGING, ..
					wxEVT_PG_CHANGED, ..
					wxEVT_PG_HIGHLIGHTED, ..
					wxEVT_PG_RIGHT_CLICK, ..
					wxEVT_PG_PAGE_CHANGED, ..
					wxEVT_PG_ITEM_EXPANDED, ..
					wxEVT_PG_ITEM_COLLAPSED, ..
					wxEVT_PG_DOUBLE_CLICK
					
				Return bmx_wxpropertygrid_geteventtype(eventType)
		End Select
	End Method
		
End Type

New TPropertyGridEventFactory
