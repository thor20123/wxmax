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

#include "wxglue.h"
#include "wx/wizard.h"
#include "../wxbitmap.mod/glue.h"

class MaxWizard;
class MaxWizardPage;
class MaxWizardPageSimple;

extern "C" {

#include <blitz.h>

	wxWizardPage * _wx_wxwizard_wxWizardPage__GetPrev(BBObject * handle);
	wxWizardPage * _wx_wxwizard_wxWizardPage__GetNext(BBObject * handle);

	MaxWizard * bmx_wxwizard_create(BBObject * handle, wxWindow * parent, int id, BBString * title, MaxBitmap * bitmap, int x, int y, long style);
	wxWizardPage * bmx_wxwizard_getcurrentpage(wxWizard * wizard);
	wxSizer * bmx_wxwizard_getpageareasizer(wxWizard * wizard);
	void bmx_wxwizard_getpagesize(wxWizard * wizard, int * w, int * h);
	bool bmx_wxwizard_hasnextpage(wxWizard * wizard, wxWizardPage * page);
	bool bmx_wxwizard_hasprevpage(wxWizard * wizard, wxWizardPage * page);
	bool bmx_wxwizard_runwizard(wxWizard * wizard, wxWizardPage * firstPage);
	void bmx_wxwizard_setborder(wxWizard * wizard, int border);

	MaxWizardPage * bmx_wxwizardpage_create(BBObject * handle, wxWizard * parent, MaxBitmap * bitmap);
	wxWizardPage * bmx_wxwizardpage_getprev(wxWizardPage * page);
	wxWizardPage * bmx_wxwizardpage_getnext(wxWizardPage * page);
	MaxBitmap * bmx_wxwizardpage_getbitmap(wxWizardPage * page);

	MaxWizardPageSimple * bmx_wxwizardpagesimple_create(BBObject * handle, wxWizard * parent, wxWizardPage * prev, wxWizardPage * nxt, MaxBitmap * bitmap);
	void bmx_wxwizardpagesimple_setprev(wxWizardPageSimple * p, wxWizardPage * page);
	void bmx_wxwizardpagesimple_setnext(wxWizardPageSimple * p, wxWizardPage * page);
	void bmx_wxwizardpagesimple_chain(wxWizardPageSimple * first, wxWizardPageSimple * second);

	bool bmx_wxwizardevent_getdirection(wxWizardEvent & event);
	wxWizardPage * bmx_wxwizardevent_getpage(wxWizardEvent & event);

	int bmx_wxwizard_geteventtype(int type);

}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class MaxWizard : public wxWizard
{
public:
	MaxWizard(BBObject * handle, wxWindow * parent, wxWindowID id, const wxString& title, 
		const wxBitmap& bitmap, int x, int y, long style);
	~MaxWizard();
	
private:

    // any class wishing to process wxWidgets events must use this macro
    DECLARE_EVENT_TABLE()
};


class MaxWizardPage : public wxWizardPage
{
public:
	MaxWizardPage(BBObject * handle, wxWizard * parent, const wxBitmap& bitmap);
	~MaxWizardPage();
	
	wxWizardPage* GetPrev() const;
	wxWizardPage* GetNext() const;
	
private:

    // any class wishing to process wxWidgets events must use this macro
    DECLARE_EVENT_TABLE()
	BBObject * maxHandle;
};


class MaxWizardPageSimple : public wxWizardPageSimple
{
public:
	MaxWizardPageSimple(BBObject * handle, wxWizard * parent, wxWizardPage * prev, wxWizardPage * next, const wxBitmap& bitmap);
	~MaxWizardPageSimple();
	
private:

    // any class wishing to process wxWidgets events must use this macro
    DECLARE_EVENT_TABLE()
};
