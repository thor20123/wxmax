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

MaxKnob::MaxKnob(BBObject * handle, wxWindow * parent, wxWindowID id, int value, int minValue, int maxValue,
		int minAngle, int maxAngle, int x, int y, int w, int h, long style)
	: wxKnob(parent, id, value, minValue, maxValue, minAngle, maxAngle, wxPoint(x, y), wxSize(w, h), style)
{
	wxbind(this, handle);
}

MaxKnob::~MaxKnob() {
	wxunbind(this);
}


// *********************************************

BEGIN_EVENT_TABLE(MaxKnob, wxKnob)
END_EVENT_TABLE()

wxKnob * bmx_wxknob_create(BBObject * handle, wxWindow * parent, wxWindowID id, int value,
		int minValue, int maxValue, int minAngle, int maxAngle, int x, int y, int w, int h, long style) {
	return new MaxKnob(handle, parent, id, value, minValue, maxValue, minAngle, maxAngle, x, y, w, h, style);
}

void bmx_wxknob_setrange(wxKnob * knob, int minValue, int maxValue) {
	knob->SetRange(minValue, maxValue);
}

int bmx_wxknob_getmin(wxKnob * knob) {
	return knob->GetMin();
}

int bmx_wxknob_getmax(wxKnob * knob) {
	return knob->GetMax();
}

void bmx_wxknob_setmin(wxKnob * knob, int value) {
	knob->SetMin(value);
}

void bmx_wxknob_setmax(wxKnob * knob, int value) {
	knob->SetMax(value);
}

int bmx_wxknob_getminangle(wxKnob * knob) {
	return knob->GetMinAngle();
}

int bmx_wxknob_getmaxangle(wxKnob * knob) {
	return knob->GetMaxAngle();
}

int bmx_wxknob_getvalue(wxKnob * knob) {
	return knob->GetValue();
}

void bmx_wxknob_setvalue(wxKnob * knob, int value) {
	knob->SetValue(value);
}


