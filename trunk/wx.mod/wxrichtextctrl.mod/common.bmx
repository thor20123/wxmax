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

Import wx.wx
Import wx.wxTextCtrl
Import wx.wxComboCtrl
Import wx.wxImage
Import wx.wxPrintout
Import BRL.Blitz


' headers :-)
?linuxx86
Import "../lib/linux/wx/include/gtk2-unicode-release-static/*.h"
?linuxx64
Import "../lib/linuxx64/wx/include/gtk2-unicode-release-static/*.h"
?win32x86
Import "../lib/win32/mswu/*.h"
?win32x64
Import "../lib/win32x64/mswu/*.h"
?macosppc
Import "../lib/macosppc/wx/include/mac-unicode-release-static/*.h"
?macosx86
Import "../lib/macosx86/wx/include/mac-unicode-release-static/*.h"
?macosx64
Import "../lib/macosx64/wx/include/mac-unicode-release-static/*.h"
?raspberrypi
Import "../lib/raspberrypi/wx/include/gtk2-unicode-release-static/*.h"
?
Import "../include/*.h"

Import "glue.cpp"

Extern

End Extern


Const wxRICHTEXT_TYPE_ANY:Int = 0
Const wxRICHTEXT_TYPE_TEXT:Int = 1
Const wxRICHTEXT_TYPE_XML:Int = 2
Const wxRICHTEXT_TYPE_HTML:Int = 3
Const wxRICHTEXT_TYPE_RTF:Int = 4
Const wxRICHTEXT_TYPE_PDF:Int = 5

Const wxRICHTEXT_FIXED_WIDTH:Int = $01
Const wxRICHTEXT_FIXED_HEIGHT:Int = $02
Const wxRICHTEXT_VARIABLE_WIDTH:Int = $04
Const wxRICHTEXT_VARIABLE_HEIGHT:Int = $08

Const wxRICHTEXT_LAYOUT_SPECIFIED_RECT:Int = $10

Const wxRICHTEXT_DRAW_IGNORE_CACHE:Int = $01

Const wxRICHTEXT_HITTEST_NONE:Int = $01
Const wxRICHTEXT_HITTEST_BEFORE:Int = $02
Const wxRICHTEXT_HITTEST_AFTER:Int = $04
Const wxRICHTEXT_HITTEST_ON:Int = $08
Const wxRICHTEXT_HITTEST_OUTSIDE:Int = $10

Const wxRICHTEXT_FORMATTED:Int = $01
Const wxRICHTEXT_UNFORMATTED:Int = $02

Const wxRICHTEXT_SETSTYLE_NONE:Int = $00
Const wxRICHTEXT_SETSTYLE_WITH_UNDO:Int = $01
Const wxRICHTEXT_SETSTYLE_OPTIMIZE:Int = $02
Const wxRICHTEXT_SETSTYLE_PARAGRAPHS_ONLY:Int = $04
Const wxRICHTEXT_SETSTYLE_CHARACTERS_ONLY:Int = $08
Const wxRICHTEXT_SETSTYLE_RENUMBER:Int = $10
Const wxRICHTEXT_SETSTYLE_SPECIFY_LEVEL:Int = $20
Const wxRICHTEXT_SETSTYLE_RESET:Int = $40
Const wxRICHTEXT_SETSTYLE_REMOVE:Int = $80


Const wxRICHTEXT_INSERT_NONE:Int = $00
Const wxRICHTEXT_INSERT_WITH_PREVIOUS_PARAGRAPH_STYLE:Int = $01

Const wxTEXT_ATTR_PARA_SPACING_AFTER:Int = $00000800
Const wxTEXT_ATTR_PARA_SPACING_BEFORE:Int = $00001000
Const wxTEXT_ATTR_LINE_SPACING:Int = $00002000
Const wxTEXT_ATTR_CHARACTER_STYLE_NAME:Int = $00004000
Const wxTEXT_ATTR_PARAGRAPH_STYLE_NAME:Int = $00008000
Const wxTEXT_ATTR_LIST_STYLE_NAME:Int = $00010000
Const wxTEXT_ATTR_BULLET_STYLE:Int = $00020000
Const wxTEXT_ATTR_BULLET_NUMBER:Int = $00040000
Const wxTEXT_ATTR_BULLET_TEXT:Int = $00080000
Const wxTEXT_ATTR_BULLET_NAME:Int = $00100000
Const wxTEXT_ATTR_URL:Int = $00200000
Const wxTEXT_ATTR_PAGE_BREAK:Int = $00400000
Const wxTEXT_ATTR_EFFECTS:Int = $00800000
Const wxTEXT_ATTR_OUTLINE_LEVEL:Int = $01000000

Const wxTEXT_ATTR_BULLET_STYLE_NONE:Int = $00000000
Const wxTEXT_ATTR_BULLET_STYLE_ARABIC:Int = $00000001
Const wxTEXT_ATTR_BULLET_STYLE_LETTERS_UPPER:Int = $00000002
Const wxTEXT_ATTR_BULLET_STYLE_LETTERS_LOWER:Int = $00000004
Const wxTEXT_ATTR_BULLET_STYLE_ROMAN_UPPER:Int = $00000008
Const wxTEXT_ATTR_BULLET_STYLE_ROMAN_LOWER:Int = $00000010
Const wxTEXT_ATTR_BULLET_STYLE_SYMBOL:Int = $00000020
Const wxTEXT_ATTR_BULLET_STYLE_BITMAP:Int = $00000040
Const wxTEXT_ATTR_BULLET_STYLE_PARENTHESES:Int = $00000080
Const wxTEXT_ATTR_BULLET_STYLE_PERIOD:Int = $00000100
Const wxTEXT_ATTR_BULLET_STYLE_STANDARD:Int = $00000200
Const wxTEXT_ATTR_BULLET_STYLE_RIGHT_PARENTHESIS:Int = $00000400
Const wxTEXT_ATTR_BULLET_STYLE_OUTLINE:Int = $00000800

Const wxTEXT_ATTR_BULLET_STYLE_ALIGN_LEFT:Int = $00000000
Const wxTEXT_ATTR_BULLET_STYLE_ALIGN_RIGHT:Int = $00001000
Const wxTEXT_ATTR_BULLET_STYLE_ALIGN_CENTRE:Int = $00002000

Const wxTEXT_ATTR_EFFECT_NONE:Int = $00000000
Const wxTEXT_ATTR_EFFECT_CAPITALS:Int = $00000001
Const wxTEXT_ATTR_EFFECT_SMALL_CAPITALS:Int = $00000002
Const wxTEXT_ATTR_EFFECT_STRIKETHROUGH:Int = $00000004
Const wxTEXT_ATTR_EFFECT_DOUBLE_STRIKETHROUGH:Int = $00000008
Const wxTEXT_ATTR_EFFECT_SHADOW:Int = $00000010
Const wxTEXT_ATTR_EFFECT_EMBOSS:Int = $00000020
Const wxTEXT_ATTR_EFFECT_OUTLINE:Int = $00000040
Const wxTEXT_ATTR_EFFECT_ENGRAVE:Int = $00000080
Const wxTEXT_ATTR_EFFECT_SUPERSCRIPT:Int = $00000100
Const wxTEXT_ATTR_EFFECT_SUBSCRIPT:Int = $00000200

Const wxTEXT_ATTR_LINE_SPACING_NORMAL:Int = 10
Const wxTEXT_ATTR_LINE_SPACING_HALF:Int = 15
Const wxTEXT_ATTR_LINE_SPACING_TWICE:Int = 20

Const wxTEXT_ATTR_CHARACTER:Int = wxTEXT_ATTR_FONT | wxTEXT_ATTR_EFFECTS | wxTEXT_ATTR_BACKGROUND_COLOUR | ..
		wxTEXT_ATTR_TEXT_COLOUR | wxTEXT_ATTR_CHARACTER_STYLE_NAME | wxTEXT_ATTR_URL

Const wxTEXT_ATTR_PARAGRAPH:Int = wxTEXT_ATTR_ALIGNMENT | wxTEXT_ATTR_LEFT_INDENT | wxTEXT_ATTR_RIGHT_INDENT | ..
		wxTEXT_ATTR_TABS | wxTEXT_ATTR_PARA_SPACING_BEFORE | wxTEXT_ATTR_PARA_SPACING_AFTER | ..
		wxTEXT_ATTR_LINE_SPACING | wxTEXT_ATTR_BULLET_STYLE | wxTEXT_ATTR_BULLET_NUMBER | wxTEXT_ATTR_BULLET_TEXT | ..
		wxTEXT_ATTR_BULLET_NAME | wxTEXT_ATTR_PARAGRAPH_STYLE_NAME | wxTEXT_ATTR_LIST_STYLE_NAME | wxTEXT_ATTR_OUTLINE_LEVEL

Const wxTEXT_ATTR_ALL:Int = wxTEXT_ATTR_CHARACTER | wxTEXT_ATTR_PARAGRAPH

