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

#ifndef _WX_MAX_PALETTE_H_
#define _WX_MAX_PALETTE_H_

#include "wxglue.h"

class MaxPalette;

extern "C" {

#include <blitz.h>

	MaxPalette * bmx_wxpalette_create(BBArray * r, BBArray * g, BBArray *b);
	int bmx_wxpalette_getcolourscount(MaxPalette * palette);
	int bmx_wxpalette_getpixel(MaxPalette * palette, int red, int green, int blue);
	bool bmx_wxpalette_getrgb(MaxPalette * palette, int pixel, int * red, int * green, int * blue);
	bool bmx_wxpalette_isok(MaxPalette * palette);

}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class MaxPalette
{
public:
	MaxPalette(const wxPalette & p = wxNullPalette);
	wxPalette & Palette();

private:
	wxPalette palette;

};

#endif // _WX_MAX_PALETTE_H_