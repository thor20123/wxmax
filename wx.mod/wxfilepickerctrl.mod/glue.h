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
#include "wx/filepicker.h"

class MaxFilePickerCtrl;
class MaxDirPickerCtrl;


extern "C" {

#include <blitz.h>

	MaxFilePickerCtrl * bmx_wxfilepickerctrl_create(BBObject * handle, wxWindow * parent, int id,
		BBString * path, BBString * message, BBString * wildcard, int x, int y, int w, int h, long style);
	BBString * bmx_wxfilepickerctrl_getpath(wxFilePickerCtrl * picker);
	void bmx_wxfilepickerctrl_setpath(wxFilePickerCtrl * picker, BBString * filename);

	MaxDirPickerCtrl * bmx_wxdirpickerctrl_create(BBObject * handle, wxWindow * parent, int id,
		BBString * path, BBString * message, int x, int y, int w, int h, long style);
	BBString * bmx_wxdirpickerctrl_getpath(wxDirPickerCtrl * picker);
	void bmx_wxdirpickerctrl_setpath(wxDirPickerCtrl * picker, BBString * dirname);

	BBString * wx_wxfiledirpickerevent_getpath(wxFileDirPickerEvent & event);
	void wx_wxfiledirpickerevent_setpath(wxFileDirPickerEvent & event, BBString * path);

	int bmx_wxfilepickerctrl_geteventtype(int type);

}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class MaxFilePickerCtrl : public wxFilePickerCtrl
{
public:
	MaxFilePickerCtrl(BBObject * handle, wxWindow * parent, wxWindowID id, const wxString& path,
		const wxString& message, const wxString& wildcard, int x, int y, int w, int h, long style);
	~MaxFilePickerCtrl();
	
};

class MaxDirPickerCtrl : public wxDirPickerCtrl
{
public:
	MaxDirPickerCtrl(BBObject * handle, wxWindow * parent, wxWindowID id, const wxString& path,
		const wxString& message, int x, int y, int w, int h, long style);
	~MaxDirPickerCtrl();
	
};