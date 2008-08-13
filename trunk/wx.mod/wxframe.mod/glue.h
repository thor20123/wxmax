#include "wxglue.h"
#include "../wxstatusbar.mod/glue.h"
#include "../wxtoolbar.mod/glue.h"
#include "../wxmenubar.mod/glue.h"
#include "wx/xrc/xh_frame.h"

class MaxFrame;


extern "C" {

#include <blitz.h>

	bool _wx_wxtoplevelwindow_wxTopLevelWindow__myShouldPreventAppExit(void * window);
	BBObject * _wx_wxframe_wxFrame__xrcNew(wxFrame * frame);

	MaxFrame * bmx_wxframe_create(BBObject * maxHandle, wxWindow* parent, wxWindowID id, BBString * title,
		int x, int y, int w, int h, long style);
	void bmx_wxframe_setmenubar(wxFrame * frame, MaxMenuBar * menubar);
	MaxStatusBar * bmx_wxframe_createstatusbar(wxFrame * frame, int number, long style, wxWindowID id);
	void bmx_wxframe_setstatustext(wxFrame * frame, BBString * text, int number);
	wxMenuBar * bmx_wxframe_getmenubar(wxFrame * frame);
	void bmx_wxframe_setstatusbar(wxFrame * frame, wxStatusBar * statusbar);
	wxStatusBar * bmx_wxframe_getstatusbar(wxFrame * frame);
	void bmx_wxframe_positionstatusbar(MaxFrame * frame);

	wxToolBar * bmx_wxframe_createtoolbar(wxFrame * frame, long style, wxWindowID id);
	wxToolBar * bmx_wxframe_gettoolbar(wxFrame * frame);
	void bmx_wxframe_settoolbar(wxFrame * frame, wxToolBar * toolbar);
	void bmx_wxframe_sendsizeevent(wxFrame * frame);
	void bmx_wxframe_processcommand(wxFrame * frame, int id);
	void bmx_wxframe_setstatusbarpane(wxFrame * frame, int n);

	void bmx_wxframe_addresourcehandler();

}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


class MaxFrame : public wxFrame
{
public:
	MaxFrame();
	MaxFrame(BBObject * handle, wxWindow* parent, wxWindowID id, const wxString& title, int x,
		int y, int w, int h, long style);
	~MaxFrame();
		
	virtual MaxStatusBar * OnCreateStatusBar(int number, long style, wxWindowID id, const wxString& name);
	virtual MaxToolBar * OnCreateToolBar(long style, wxWindowID id, const wxString& name);

	virtual bool ShouldPreventAppExit() const {
		return _wx_wxtoplevelwindow_wxTopLevelWindow__myShouldPreventAppExit(wxfind(const_cast<wxObject *>((wxObject*)this)));
	}
	
	virtual void PositionStatusBar() {
		wxFrame::PositionStatusBar();
	}
	
	void MaxBind(BBObject * handle);
	
private:
	
    // any class wishing to process wxWidgets events must use this macro
    DECLARE_EVENT_TABLE()
};

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class MaxFrameXmlHandler : public wxFrameXmlHandler
{
    DECLARE_DYNAMIC_CLASS(MaxFrameXmlHandler)

public:
    MaxFrameXmlHandler();
    virtual wxObject *DoCreateResource();
};


