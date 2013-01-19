///////////////////////////////////////////////////////////////////////////////
// Name:        wx/msw/datectrl.h
// Purpose:     wxDatePickerCtrl for Windows
// Author:      Vadim Zeitlin
// Modified by:
// Created:     2005-01-09
// RCS-ID:      $Id: datectrl.h 69222 2011-09-29 13:43:02Z VZ $
// Copyright:   (c) 2005 Vadim Zeitlin <vadim@wxwindows.org>
// Licence:     wxWindows licence
///////////////////////////////////////////////////////////////////////////////

#ifndef _WX_MSW_DATECTRL_H_
#define _WX_MSW_DATECTRL_H_

// ----------------------------------------------------------------------------
// wxDatePickerCtrl
// ----------------------------------------------------------------------------

class WXDLLIMPEXP_ADV wxDatePickerCtrl : public wxDatePickerCtrlBase
{
public:
    // ctors
    wxDatePickerCtrl() { }

    wxDatePickerCtrl(wxWindow *parent,
                     wxWindowID id,
                     const wxDateTime& dt = wxDefaultDateTime,
                     const wxPoint& pos = wxDefaultPosition,
                     const wxSize& size = wxDefaultSize,
                     long style = wxDP_DEFAULT | wxDP_SHOWCENTURY,
                     const wxValidator& validator = wxDefaultValidator,
                     const wxString& name = wxDatePickerCtrlNameStr)
    {
        Create(parent, id, dt, pos, size, style, validator, name);
    }

    bool Create(wxWindow *parent,
                wxWindowID id,
                const wxDateTime& dt = wxDefaultDateTime,
                const wxPoint& pos = wxDefaultPosition,
                const wxSize& size = wxDefaultSize,
                long style = wxDP_DEFAULT | wxDP_SHOWCENTURY,
                const wxValidator& validator = wxDefaultValidator,
                const wxString& name = wxDatePickerCtrlNameStr);

    // Override this one to add date-specific (and time-ignoring) checks.
    virtual void SetValue(const wxDateTime& dt);
    virtual wxDateTime GetValue() const;

    // Implement the base class pure virtuals.
    virtual void SetRange(const wxDateTime& dt1, const wxDateTime& dt2);
    virtual bool GetRange(wxDateTime *dt1, wxDateTime *dt2) const;

    // Override MSW-specific functions used during control creation.
    virtual WXDWORD MSWGetStyle(long style, WXDWORD *exstyle) const;

protected:
    virtual wxLocaleInfo MSWGetFormat() const;
    virtual bool MSWAllowsNone() const { return HasFlag(wxDP_ALLOWNONE); }
    virtual bool MSWOnDateTimeChange(const tagNMDATETIMECHANGE& dtch);

    DECLARE_DYNAMIC_CLASS_NO_COPY(wxDatePickerCtrl)
};

#endif // _WX_MSW_DATECTRL_H_