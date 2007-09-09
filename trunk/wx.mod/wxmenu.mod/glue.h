/*
  Copyright (c) 2007 Bruce A Henderson
 
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
#include "wx/menu.h"

class MaxMenu;

extern "C" {

#include <blitz.h>

	MaxMenu * bmx_wxmenu_create(BBObject * maxHandle, BBString * title, long style);
	wxMenuItem * bmx_wxmenu_append(wxMenu * menu, int id, BBString * item, BBString * helpString, wxItemKind kind);
	wxMenuItem * bmx_wxmenu_appendMenu(wxMenu * menu, int id, BBString * item, MaxMenu * subMenu, BBString * helpString);
	wxMenuItem * bmx_wxmenu_appendseparator(wxMenu * menu);
	wxMenuItem * bmx_wxmenu_appendcheckitem(wxMenu * menu, int id, BBString * item, BBString * helpString);
	wxMenuItem * bmx_wxmenu_appendradioitem(wxMenu * menu, int id, BBString * item, BBString * helpString);
	void bmx_wxmenu_break(wxMenu * menu);

	wxMenuItem * bmx_wxmenu_appendsubmenu(wxMenu * menu, wxMenu * submenu, BBString * item, BBString * helpString);
	void bmx_wxmenu_check(wxMenu * menu, int id, bool value);
	void bmx_wxmenu_delete(wxMenu * menu, int id);
	void bmx_wxmenu_destroy(wxMenu * menu, int id);
	void bmx_wxmenu_enable(wxMenu * menu, int id, bool value);
	int bmx_wxmenu_finditem(wxMenu * menu, BBString * itemString);
	wxMenuItem * bmx_wxmenu_finditembyposition(wxMenu * menu, int pos);
	BBString * bmx_wxmenu_gethelpstring(wxMenu * menu, int id);
	BBString * bmx_wxmenu_getlabel(wxMenu * menu, int id);
	int bmx_wxmenu_getmenuitemcount(wxMenu * menu);
	BBString * bmx_wxmenu_gettitle(wxMenu * menu);
	wxMenuItem * bmx_wxmenu_insert(wxMenu * menu, int pos, int id, BBString * item, BBString * helpString, wxItemKind kind);
	wxMenuItem * bmx_wxmenu_insertcheckitem(wxMenu * menu, int pos, int id, BBString * item, BBString * helpString);
	wxMenuItem * bmx_wxmenu_insertradioitem(wxMenu * menu, int pos, int id, BBString * item, BBString * helpString);
	wxMenuItem * bmx_wxmenu_insertseparator(wxMenu * menu, int pos);
	bool bmx_wxmenu_ischecked(wxMenu * menu, int id);
	bool bmx_wxmenu_isenabled(wxMenu * menu, int id);
	wxMenuItem * bmx_wxmenu_prepend(wxMenu * menu, int id, BBString * item, BBString * helpString, wxItemKind kind);
	wxMenuItem * bmx_wxmenu_prependcheckitem(wxMenu * menu, int id, BBString * item, BBString * helpString);
	wxMenuItem * bmx_wxmenu_prependradioitem(wxMenu * menu, int id, BBString * item, BBString * helpString);
	wxMenuItem * bmx_wxmenu_prependseparator(wxMenu * menu);
	void bmx_wxmenu_remove(wxMenu * menu, int id);
	void bmx_wxmenu_sethelpstring(wxMenu * menu, int id, BBString * helpString);
	void bmx_wxmenu_setlabel(wxMenu * menu, int id, BBString * label);
	void bmx_wxmenu_settitle(wxMenu * menu, BBString * title);
	void bmx_wxmenu_updateui(wxMenu * menu, wxEvtHandler * source);

	int bmx_wxmenu_geteventtype(int type);

}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


class MaxMenu : public wxMenu
{
public:
	MaxMenu(BBObject * handle, const wxString& title, long style);
	~MaxMenu();
};

