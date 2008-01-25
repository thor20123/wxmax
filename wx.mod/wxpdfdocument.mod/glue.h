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
#include "wx/pdfdoc.h"

class MaxPdfDocument;
class MaxPdfLink;
class MaxPdfLineStyle;
class MaxPdfColour;
class MaxPdfShape;

extern "C" {

#include <blitz.h>

	void _wx_wxpdfdocument_wxPdfDocument__Header(BBObject * handle);
	void _wx_wxpdfdocument_wxPdfDocument__Footer(BBObject * handle);
	bool _wx_wxpdfdocument_wxPdfDocument__AcceptPageBreak(BBObject * handle);

	void bmx_wxpdfdocument_free(wxPdfDocument * doc);

	wxPdfDocument * bmx_wxpdfdocument_create(BBObject * handle, int orientation, BBString * unit, wxPaperSize format);
	void bmx_wxpdfdocument_addpage(wxPdfDocument * doc, int orientation);
	void bmx_wxpdfdocument_setfont(wxPdfDocument * doc, BBString * family, BBString * style, double size);
	void bmx_wxpdfdocument_cell(wxPdfDocument * doc, double w, double h, BBString * txt, int border, int ln, int align, int fill, MaxPdfLink * link);
	void bmx_wxpdfdocument_saveasfile(wxPdfDocument * doc, BBString * name);

	void bmx_wxpdfdocument_addspotcolor(wxPdfDocument * doc, BBString * name, double cyan, double magenta, double yellow, double black);
	void bmx_wxpdfdocument_aliasnbpages(wxPdfDocument * doc, BBString * _alias);
	void bmx_wxpdfdocument_arrow(wxPdfDocument * doc, double x1, double y1, double x2, double y2, double lineWidth, double height, double width);
	void bmx_wxpdfdocument_circle(wxPdfDocument * doc, double x0, double y0, double r, double astart, double afinish, int style, int nSeg);
	void bmx_wxpdfdocument_curve(wxPdfDocument * doc, double x0, double y0, double x1, double y1, double x2, double y2, double x3, double y3, int style);
	void bmx_wxpdfdocument_ellipse(wxPdfDocument * doc, double x0, double y0, double rx, double ry, double angle, double astart, double afinish, int style, int nSeg);
	bool bmx_wxpdfdocument_image(wxPdfDocument * doc, BBString * file, double x, double y, double w, double h, BBString * mimeType, MaxPdfLink * link, int maskImage);
	void bmx_wxpdfdocument_ln(wxPdfDocument * doc, double h);
	void bmx_wxpdfdocument_sety(wxPdfDocument * doc, double y);
	int bmx_wxpdfdocument_pageno(wxPdfDocument * doc);

	void bmx_wxpdfdocument_setx(wxPdfDocument * doc, double x);
	void bmx_wxpdfdocument_settitle(wxPdfDocument * doc, BBString * title);
	void bmx_wxpdfdocument_setdrawcolor(wxPdfDocument * doc, MaxColour * colour);
	void bmx_wxpdfdocument_setfillcolor(wxPdfDocument * doc, MaxColour * colour);
	void bmx_wxpdfdocument_settextcolor(wxPdfDocument * doc, MaxColour * colour);
	double bmx_wxpdfdocument_getstringwidth(wxPdfDocument * doc, BBString * text);
	void bmx_wxpdfdocument_setlinewidth(wxPdfDocument * doc, double width);
	void bmx_wxpdfdocument_setauthor(wxPdfDocument * doc, BBString * author);
	void bmx_wxpdfdocument_settextcolorgrayscale(wxPdfDocument * doc, int grayscale);
	int bmx_wxpdfdocument_multicell(wxPdfDocument * doc, double w, double h, BBString * txt, int border, int align, int fill, int maxline);

	bool bmx_wxpdfdocument_acceptpagebreak(MaxPdfDocument * doc);

	bool bmx_wxpdfdocument_addfont(wxPdfDocument * doc, BBString * family, BBString * style, BBString * file);
	bool bmx_wxpdfdocument_addfontcjk(wxPdfDocument * doc, BBString * family);
	int bmx_wxpdfdocument_addlink(wxPdfDocument * doc);
	void bmx_wxpdfdocument_annotate(wxPdfDocument * doc, double x, double y, BBString * text);
	void bmx_wxpdfdocument_appendjavascript(wxPdfDocument * doc, BBString * javascript);
	int bmx_wxpdfdocument_axialgradient(wxPdfDocument * doc, MaxPdfColour * col1, MaxPdfColour * col2, double x1, double y1, double x2, double y2, double intexp);
	int bmx_wxpdfdocument_begintemplate(wxPdfDocument * doc, double x, double y, double width, double height);
	void bmx_wxpdfdocument_bookmark(wxPdfDocument * doc, BBString * txt, int level, double y);
	void bmx_wxpdfdocument_setimagescale(wxPdfDocument * doc, double scale);
	void bmx_wxpdfdocument_setkeywords(wxPdfDocument * doc, BBString * keywords);
	void bmx_wxpdfdocument_setleftmargin(wxPdfDocument * doc, double margin);
	void bmx_wxpdfdocument_setlineheight(wxPdfDocument * doc, double height);
	void bmx_wxpdfdocument_setlinestyle(wxPdfDocument * doc, MaxPdfLineStyle * style);
	double bmx_wxpdfdocument_gettopmargin(wxPdfDocument * doc);
	double bmx_wxpdfdocument_getx(wxPdfDocument * doc);
	double bmx_wxpdfdocument_gety(wxPdfDocument * doc);
	double bmx_wxpdfdocument_getbreakmargin(wxPdfDocument * doc);
	double bmx_wxpdfdocument_getcellmargin(wxPdfDocument * doc);
	BBString * bmx_wxpdfdocument_getfontfamily(wxPdfDocument * doc);
	BBString * bmx_wxpdfdocument_getfontpath(wxPdfDocument * doc);
	double bmx_wxpdfdocument_getfontsize(wxPdfDocument * doc);
	BBString * bmx_wxpdfdocument_getfontstyle(wxPdfDocument * doc);
	bool bmx_wxpdfdocument_getfontsubsetting(wxPdfDocument * doc);
	double bmx_wxpdfdocument_getimagescale(wxPdfDocument * doc);
	double bmx_wxpdfdocument_getleftmargin(wxPdfDocument * doc);
	double bmx_wxpdfdocument_getlineheight(wxPdfDocument * doc);
	double bmx_wxpdfdocument_getlinewidth(wxPdfDocument * doc);

	void bmx_wxpdfdocument_writexml(wxPdfDocument * doc, BBString * txt);

	void bmx_wxpdfdocument_translate(wxPdfDocument * doc, double tx, double ty);
	void bmx_wxpdfdocument_translatex(wxPdfDocument * doc, double tx);
	void bmx_wxpdfdocument_translatey(wxPdfDocument * doc, double ty);
	void bmx_wxpdfdocument_unsetclipping(wxPdfDocument * doc);
	void bmx_wxpdfdocument_usetemplate(wxPdfDocument * doc, int templateId, double x, double y, double width, double height);
	void bmx_wxpdfdocument_write(wxPdfDocument * doc, double h, BBString * txt, MaxPdfLink * link);
	void bmx_wxpdfdocument_writecell(wxPdfDocument * doc, double h, BBString * txt, int border, int fill, MaxPdfLink * link);
	void bmx_wxpdfdocument_textfield(wxPdfDocument * doc, BBString * name, double width, double height, BBString * value, bool multiline);
	void bmx_wxpdfdocument_textfieldxy(wxPdfDocument * doc, BBString * name, double x, double y, double width, double height, BBString * value, bool multiline);
	void bmx_wxpdfdocument_stoptransform(wxPdfDocument * doc);
	void bmx_wxpdfdocument_text(wxPdfDocument * doc, double x, double y, BBString * txt);
	int bmx_wxpdfdocument_textbox(wxPdfDocument * doc, double w, double h, BBString * txt, int halign, int valign, int border, int fill);
	void bmx_wxpdfdocument_checkbox(wxPdfDocument * doc, BBString * name, double width, bool checked);
	void bmx_wxpdfdocument_checkboxxy(wxPdfDocument * doc, BBString * name, double x, double y, double width, bool checked);
	void bmx_wxpdfdocument_combobox(wxPdfDocument * doc, BBString * name, double width, double height, BBArray * values);
	void bmx_wxpdfdocument_comboboxxy(wxPdfDocument * doc, BBString * name, double x, double y, double width, double height, BBArray * values);
	void bmx_wxpdfdocument_clippedcell(wxPdfDocument * doc, double w, double h, BBString * txt, int border, int ln, int align, int fill, MaxPdfLink * link);
	void bmx_wxpdfdocument_clippingellipse(wxPdfDocument * doc, double x, double y, double rx, double ry, bool outline);
	void bmx_wxpdfdocument_clippingpath(wxPdfDocument * doc);
	void bmx_wxpdfdocument_clippingpathshape(wxPdfDocument * doc, MaxPdfShape * shape, int style);
	void bmx_wxpdfdocument_clippingpolygon(wxPdfDocument * doc, BBArray * x, BBArray * y, bool outline);
	void bmx_wxpdfdocument_clippingrect(wxPdfDocument * doc, double x, double y, double w, double h, bool outline);
	void bmx_wxpdfdocument_clippingtext(wxPdfDocument * doc, double x, double y, BBString * txt, bool outline);
	void bmx_wxpdfdocument_closepath(wxPdfDocument * doc, int style);

}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class MaxPdfDocument : public wxPdfDocument
{
public:
	MaxPdfDocument(BBObject * handle, int orientation, const wxString& unit, wxPaperSize format);
	~MaxPdfDocument();

	void Header();
	void Footer();
	bool AcceptPageBreak();
	bool AcceptPageBreak_default();
	
private:
	BBObject * maxHandle;
	
};

class MaxPdfLink
{
public:
	MaxPdfLink(const wxPdfLink & l);
	wxPdfLink & Link();

private:
	wxPdfLink pdfLink;

};

class MaxPdfColour
{
public:
	MaxPdfColour(const wxPdfColour & c);
	wxPdfColour & Colour();

private:
	wxPdfColour colour;

};

class MaxPdfLineStyle
{
public:
	MaxPdfLineStyle(const wxPdfLineStyle & s);
	wxPdfLineStyle & Style();

private:
	wxPdfLineStyle style;

};

class MaxPdfShape
{
public:
	MaxPdfShape(const wxPdfShape & s);
	wxPdfShape & Shape();

private:
	wxPdfShape shape;

};

