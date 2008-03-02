/*
  Copyright (c) 2007,2008 Bruce A Henderson
 
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
  
  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.
  
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
*/ 

#include "glue.h"

// ---------------------------------------------------------------------------------------

MaxMDIChildFrame::MaxMDIChildFrame(BBObject * handle, wxMDIParentFrame * parent, wxWindowID id, const wxString& title, int x, int y, int w, int h, long style)
	: maxHandle(handle), wxMDIChildFrame(parent, id, title, wxPoint(x, y), wxSize(w, h), style)
{
	wxbind(this, handle);
}

MaxMDIChildFrame::~MaxMDIChildFrame() {
	wxunbind(this);
}

MaxMDIParentFrame::MaxMDIParentFrame(BBObject * handle, wxWindow * parent, wxWindowID id, const wxString& title, int x, int y, int w, int h, long style)
	: maxHandle(handle), wxMDIParentFrame(parent, id, title, wxPoint(x, y), wxSize(w, h), style)
{
	wxbind(this, handle);
}

MaxMDIParentFrame::~MaxMDIParentFrame() {
	wxunbind(this);
}

// *********************************************


BEGIN_EVENT_TABLE(MaxMDIChildFrame, wxMDIChildFrame)
END_EVENT_TABLE()

wxMDIChildFrame * bmx_wxmdichildframe_create(BBObject * handle, wxMDIParentFrame * parent, wxWindowID id, BBString * title, int x, int y, int w, int h, long style) {
	return new MaxMDIChildFrame(handle, parent, id, wxStringFromBBString(title), x, y, w, h, style);
}

void bmx_wxmdichildframe_activate(wxMDIChildFrame * frame) {
	frame->Activate();
}

void bmx_wxmdichildframe_maximize(wxMDIChildFrame * frame, bool value) {
	frame->Maximize(value);
}

void bmx_wxmdichildframe_restore(wxMDIChildFrame * frame) {
	frame->Restore();
}


// *********************************************

BEGIN_EVENT_TABLE(MaxMDIParentFrame, wxMDIParentFrame)
END_EVENT_TABLE()

wxMDIParentFrame * bmx_wxmdiparentframe_create(BBObject * handle, wxWindow * parent, wxWindowID id, BBString * title, int x, int y, int w, int h, long style) {
	return new MaxMDIParentFrame(handle, parent, id, wxStringFromBBString(title), x, y, w, h, style);
}

void bmx_wxmdiparentframe_activatenext(wxMDIParentFrame * frame) {
	frame->ActivateNext();
}

void bmx_wxmdiparentframe_activateprevious(wxMDIParentFrame * frame) {
	frame->ActivatePrevious();
}

void bmx_wxmdiparentframe_arrangeicons(wxMDIParentFrame * frame) {
	frame->ArrangeIcons();
}

void bmx_wxmdiparentframe_cascade(wxMDIParentFrame * frame) {
	frame->Cascade();
}

void bmx_wxmdiparentframe_getclientsize(wxMDIParentFrame * frame, int * width, int * height) {
	frame->GetClientSize(width, height);
}

wxMDIChildFrame * bmx_wxmdiparentframe_getactivechild(wxMDIParentFrame * frame) {
	return frame->GetActiveChild();
}

wxMDIClientWindow * bmx_wxmdiparentframe_getclientwindow(wxMDIParentFrame * frame) {
	return frame->GetClientWindow();
}

#ifdef WIN32
wxMenu * bmx_wxmdiparentframe_getwindowmenu(wxMDIParentFrame * frame) {
	return frame->GetWindowMenu();
}

void bmx_wxmdiparentframe_setwindowmenu(wxMDIParentFrame * frame, wxMenu * menu) {
	frame->SetWindowMenu(menu);
}
#endif

void bmx_wxmdiparentframe_tile(wxMDIParentFrame * frame, wxOrientation orient) {
	frame->Tile(orient);
}

