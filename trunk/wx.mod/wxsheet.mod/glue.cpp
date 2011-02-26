/*
  Copyright (c) 2007-2011 Bruce A Henderson
 
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

MaxSheet::MaxSheet(BBObject * handle, wxWindow * parent, wxWindowID id, int x, int y, int w, int h, long style)
	: wxSheet(parent, id, wxPoint(x, y), wxSize(w, h), style)
{
	wxbind(this, handle);
}

MaxSheet::MaxSheet(BBObject * handle, wxWindow * parent, wxWindowID id)
	: wxSheet(parent, id)
{
	wxbind(this, handle);
}


MaxSheet::~MaxSheet() {
	wxunbind(this);
}


MaxSheetSplitter::MaxSheetSplitter(BBObject * handle, wxWindow * parent, wxWindowID id, int x, int y, int w, int h, long style)
	: maxHandle(handle), wxSheetSplitter(parent, id, wxPoint(x, y), wxSize(w, h), style)
{
	wxbind(this, handle);
}

MaxSheetSplitter::~MaxSheetSplitter() {
	wxunbind(this);
}

wxSheet * MaxSheetSplitter::CreateSheet(wxWindowID id) {
	return _wx_wxsheet_wxSheetSplitter__createsheet(maxHandle, id);
}



MaxSheetCellEditor::MaxSheetCellEditor(const wxSheetCellEditor& e)
{
	editor = e;
}

wxSheetCellEditor & MaxSheetCellEditor::Editor() {
	return editor;
}


MaxSheetCellRenderer::MaxSheetCellRenderer(const wxSheetCellRenderer& r)
{
	renderer = r;
}

wxSheetCellRenderer & MaxSheetCellRenderer::Renderer() {
	return renderer;
}


MaxSheetCellAttr::MaxSheetCellAttr(const wxSheetCellAttr& a)
{
	attr = a;
}

MaxSheetCellAttr::MaxSheetCellAttr(bool a)
	: attr(a)
{
}

wxSheetCellAttr & MaxSheetCellAttr::Attr() {
	return attr;
}


MaxSheetSelection::MaxSheetSelection(const wxSheetSelection& s)
{
	selection = s;
}

wxSheetSelection & MaxSheetSelection::Selection() {
	return selection;
}


MaxSheetBlock::MaxSheetBlock(const wxSheetBlock& b)
{
	block = b;
}

wxSheetBlock & MaxSheetBlock::Block() {
	return block;
}



IMPLEMENT_DYNAMIC_CLASS(MaxSheetCellStringRendererRefData, wxSheetCellStringRendererRefData)

MaxSheetCellStringRendererRefData::MaxSheetCellStringRendererRefData(BBObject * handle)
	: maxHandle(handle)
{
	wxbind(this, handle);	
}

MaxSheetCellStringRendererRefData::~MaxSheetCellStringRendererRefData() {
	wxunbind(this);
}

// call this to call the super-class Draw() method
void MaxSheetCellStringRendererRefData::MaxDraw(wxSheet * sheet, MaxSheetCellAttr * attr, MaxDC * dc,
		MaxRect * rect, int row, int col, bool isSelected) {

	wxSheetCellStringRendererRefData::Draw(*sheet, attr->Attr(), *dc->GetDC(), rect->Rect(),
			wxSheetCoords(row, col), isSelected);
}
		
void MaxSheetCellStringRendererRefData::Draw(wxSheet& sheet, const wxSheetCellAttr& attr, wxDC& dc,
		const wxRect& rect, const wxSheetCoords& coords, bool isSelected) {

	_wx_wxsheet_wxSheetCellStringRendererRefData__Draw(maxHandle, &sheet, new MaxSheetCellAttr(attr), 
			new MaxDC(dc), new MaxRect(rect), coords.GetRow(), coords.GetCol(), isSelected);
}

// *********************************************

BEGIN_EVENT_TABLE(MaxSheet, wxSheet)
END_EVENT_TABLE()

MaxSheet * bmx_wxsheet_create(BBObject * handle, wxWindow * parent, wxWindowID id, int x, int y, int w, int h, long style) {
	return new MaxSheet(handle, parent, id, x, y, w, h, style);
}

bool bmx_wxsheet_creategrid(wxSheet * sheet, int numRows, int numCols, int options) {
	return sheet->CreateGrid(numRows, numCols, options);
}

int bmx_wxsheet_getnumberrows(wxSheet * sheet) {
	return sheet->GetNumberRows();
}

int bmx_wxsheet_getnumbercols(wxSheet * sheet) {
	return sheet->GetNumberCols();
}

bool bmx_wxsheet_containscell(wxSheet * sheet, int row, int col) {
	return sheet->ContainsCell(wxSheetCoords(row, col));
}

bool bmx_wxsheet_containsgridrow(wxSheet * sheet, int row) {
	return sheet->ContainsGridRow(row);
}

bool bmx_wxsheet_containsgridcol(wxSheet * sheet, int col) {
	return sheet->ContainsGridCol(col);
}

bool bmx_wxsheet_containsgridcell(wxSheet * sheet, int row, int col) {
	return sheet->ContainsGridCell(wxSheetCoords(row, col));
}

bool bmx_wxsheet_containsrowlabelcell(wxSheet * sheet, int row, int col) {
	return sheet->ContainsRowLabelCell(wxSheetCoords(row, col));
}

bool bmx_wxsheet_containscollabelcell(wxSheet * sheet, int row, int col) {
	return sheet->ContainsColLabelCell(wxSheetCoords(row, col));
}

bool bmx_wxsheet_isgridcell(wxSheet * sheet, int row, int col) {
	return sheet->IsGridCell(wxSheetCoords(row, col));
}

bool bmx_wxsheet_islabelcell(wxSheet * sheet, int row, int col) {
	return sheet->IsLabelCell(wxSheetCoords(row, col));
}

bool bmx_wxsheet_isrowlabelcell(wxSheet * sheet, int row, int col) {
	return sheet->IsRowLabelCell(wxSheetCoords(row, col));
}

bool bmx_wxsheet_iscollabelcell(wxSheet * sheet, int row, int col) {
	return sheet->IsColLabelCell(wxSheetCoords(row, col));
}

bool bmx_wxsheet_iscornerlabelcell(wxSheet * sheet, int row, int col) {
	return sheet->IsCornerLabelCell(wxSheetCoords(row, col));
}

void bmx_wxsheet_clearvalues(wxSheet * sheet, int update) {
	sheet->ClearValues(update);
}

bool bmx_wxsheet_insertrows(wxSheet * sheet, int row, int numRows, int update) {
	return sheet->InsertRows(row, numRows, update);
}

bool bmx_wxsheet_appendrows(wxSheet * sheet, int numRows, int update) {
	return sheet->AppendRows(numRows, update);
}

bool bmx_wxsheet_deleterows(wxSheet * sheet, int row, int numRows, int update) {
	return sheet->DeleteRows(row, numRows, update);
}

bool bmx_wxsheet_insertcols(wxSheet * sheet, int col, int numCols, int update) {
	return sheet->InsertCols(col, numCols, update);
}

bool bmx_wxsheet_appendcols(wxSheet * sheet, int numCols, int update) {
	return sheet->AppendCols(numCols, update);
}

bool bmx_wxsheet_deletecols(wxSheet * sheet, int col, int numCols, int update) {
	return sheet->DeleteCols(col, numCols, update);
}

void bmx_wxsheet_setrowheight(wxSheet * sheet, int row, int height, bool ignoreMinSize) {
	sheet->SetRowHeight(row, height, ignoreMinSize);
}

void bmx_wxsheet_setcolwidth(wxSheet * sheet, int col, int width, bool ignoreMinSize) {
	sheet->SetColWidth(col, width, ignoreMinSize);
}

int bmx_wxsheet_getrowheight(wxSheet * sheet, int row) {
	return sheet->GetRowHeight(row);
}

int bmx_wxsheet_getrowtop(wxSheet * sheet, int row) {
	return sheet->GetRowTop(row);
}

int bmx_wxsheet_getrowbottom(wxSheet * sheet, int row) {
	return sheet->GetRowBottom(row);
}

int bmx_wxsheet_getcolwidth(wxSheet * sheet, int col) {
	return sheet->GetColWidth(col);
}

int bmx_wxsheet_getcolleft(wxSheet * sheet, int col) {
	return sheet->GetColLeft(col);
}

int bmx_wxsheet_getcolright(wxSheet * sheet, int col) {
	return sheet->GetColRight(col);
}

BBString * bmx_wxsheet_getcellvalue(wxSheet * sheet, int row, int col) {
	return bbStringFromWxString(sheet->GetCellValue(wxSheetCoords(row, col)));
}

void bmx_wxsheet_setcellvalue(wxSheet * sheet, int row, int col, BBString * value) {
	sheet->SetCellValue(wxSheetCoords(row, col), wxStringFromBBString(value));
}

int bmx_wxsheet_hascellvalue(wxSheet * sheet, int row, int col) {
	return sheet->HasCellValue(wxSheetCoords(row, col));
}

void bmx_wxsheet_setattrrenderer(wxSheet * sheet, int row, int col, MaxSheetCellRenderer * renderer, wxSheetAttr_Type attrType) {
	sheet->SetAttrRenderer(wxSheetCoords(row, col), renderer->Renderer(), attrType);
}

void bmx_wxsheet_setattreditor(wxSheet * sheet, int row, int col, MaxSheetCellEditor * editor, wxSheetAttr_Type attrType) {
	sheet->SetAttrEditor(wxSheetCoords(row, col), editor->Editor(), attrType);
}

void bmx_wxsheet_setattrreadonly(wxSheet * sheet, int row, int col, bool isReadOnly, wxSheetAttr_Type attrType) {
	sheet->SetAttrReadOnly(wxSheetCoords(row, col), isReadOnly, attrType);
}

void bmx_wxsheet_setattrorientation(wxSheet * sheet, int row, int col, int orientation, wxSheetAttr_Type attrType) {
	sheet->SetAttrOrientation(wxSheetCoords(row, col), orientation, attrType);
}

void bmx_wxsheet_setattrbackgroundcolour(wxSheet * sheet, int row, int col, MaxColour * colour, wxSheetAttr_Type attrType) {
	sheet->SetAttrBackgroundColour(wxSheetCoords(row, col), colour->Colour(), attrType);
}

void bmx_wxsheet_setattrforegroundcolour(wxSheet * sheet, int row, int col, MaxColour * colour, wxSheetAttr_Type attrType) {
	sheet->SetAttrForegroundColour(wxSheetCoords(row, col), colour->Colour(), attrType);
}

void bmx_wxsheet_setattrfont(wxSheet * sheet, int row, int col, MaxFont * font, wxSheetAttr_Type attrType) {
	sheet->SetAttrFont(wxSheetCoords(row, col), font->Font(), attrType);
}

void bmx_wxsheet_setattralignment(wxSheet * sheet, int row, int col, int align, wxSheetAttr_Type attrType) {
	sheet->SetAttrAlignment(wxSheetCoords(row, col), align, attrType);
}

void bmx_wxsheet_setattrlevel(wxSheet * sheet, int row, int col, int level, wxSheetAttr_Type attrType) {
	sheet->SetAttrLevel(wxSheetCoords(row, col), level, attrType);
}

void bmx_wxsheet_setattroverflow(wxSheet * sheet, int row, int col, bool allow, wxSheetAttr_Type attrType) {
	sheet->SetAttrOverflow(wxSheetCoords(row, col), allow, attrType);
}

void bmx_wxsheet_setattroverflowmarker(wxSheet * sheet, int row, int col, bool drawMarker, wxSheetAttr_Type attrType) {
	sheet->SetAttrOverflowMarker(wxSheetCoords(row, col), drawMarker, attrType);
}

void bmx_wxsheet_setattrshoweditor(wxSheet * sheet, int row, int col, bool showEditor, wxSheetAttr_Type attrType) {
	sheet->SetAttrShowEditor(wxSheetCoords(row, col), showEditor, attrType);
}

MaxColour * bmx_wxsheet_getattrbackgroundcolour(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	wxColour c(sheet->GetAttrBackgroundColour(wxSheetCoords(row, col), attrType));
	return new MaxColour(c);
}

MaxColour * bmx_wxsheet_getattrforegroundcolour(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	wxColour c(sheet->GetAttrForegroundColour(wxSheetCoords(row, col), attrType));
	return new MaxColour(c);
}

MaxFont * bmx_wxsheet_getattrfont(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	wxFont f(sheet->GetAttrFont(wxSheetCoords(row, col), attrType));
	return new MaxFont(f);
}

int bmx_wxsheet_getattralignment(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	return sheet->GetAttrAlignment(wxSheetCoords(row, col), attrType);
}

int bmx_wxsheet_getattrorientation(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	return sheet->GetAttrOrientation(wxSheetCoords(row, col), attrType);
}

int bmx_wxsheet_getattrlevel(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	return sheet->GetAttrLevel(wxSheetCoords(row, col), attrType);
}

bool bmx_wxsheet_getattroverflow(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	return sheet->GetAttrOverflow(wxSheetCoords(row, col), attrType);
}

bool bmx_wxsheet_getattroverflowmarker(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	return sheet->GetAttrOverflowMarker(wxSheetCoords(row, col), attrType);
}

bool bmx_wxsheet_getattrshoweditor(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	return sheet->GetAttrShowEditor(wxSheetCoords(row, col), attrType);
}

bool bmx_wxsheet_getattrreadonly(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	return sheet->GetAttrReadOnly(wxSheetCoords(row, col), attrType);
}

MaxSheetCellRenderer * bmx_wxsheet_getattrrenderer(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	return new MaxSheetCellRenderer(sheet->GetAttrRenderer(wxSheetCoords(row, col), attrType));
}

MaxSheetCellEditor * bmx_wxsheet_getattreditor(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	return new MaxSheetCellEditor(sheet->GetAttrEditor(wxSheetCoords(row, col), attrType));
}

void bmx_wxsheet_setcolformatbool(wxSheet * sheet, int col) {
	sheet->SetColFormatBool(col);
}

void bmx_wxsheet_setcolformatnumber(wxSheet * sheet, int col) {
	sheet->SetColFormatNumber(col);
}

void bmx_wxsheet_setcolformatfloat(wxSheet * sheet, int col, int width, int precision) {
	sheet->SetColFormatFloat(col, width, precision);
}

void bmx_wxsheet_setcolformatcustom(wxSheet * sheet, int col, BBString * typeName) {
	sheet->SetColFormatCustom(col, wxStringFromBBString(typeName));
}

bool bmx_wxsheet_iscellvisible(wxSheet * sheet, int row, int col, bool wholeCellVisible) {
	return sheet->IsCellVisible(wxSheetCoords(row, col), wholeCellVisible);
}

bool bmx_wxsheet_isrowvisible(wxSheet * sheet, int row, bool wholeRowVisible) {
	return sheet->IsRowVisible(row, wholeRowVisible);
}

bool bmx_wxsheet_iscolvisible(wxSheet * sheet, int col, bool wholeColVisible) {
	return sheet->IsColVisible(col, wholeColVisible);
}

void bmx_wxsheet_makecellvisible(wxSheet * sheet, int row, int col) {
	sheet->MakeCellVisible(wxSheetCoords(row, col));
}

void bmx_wxsheet_getgridcursorcell(wxSheet * sheet, int * row, int * col) {
	wxSheetCoords c(sheet->GetGridCursorCell());
	*row = c.GetRow();
	*col = c.GetCol();
}

int bmx_wxsheet_getgridcursorrow(wxSheet * sheet) {
	return sheet->GetGridCursorRow();
}

int bmx_wxsheet_getgridcursorcol(wxSheet * sheet) {
	return sheet->GetGridCursorCol();
}

void bmx_wxsheet_setgridcursorcell(wxSheet * sheet, int row, int col) {
	sheet->SetGridCursorCell(wxSheetCoords(row, col));
}

MaxSheetCellAttr * bmx_wxsheet_getorcreateattr(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	return new MaxSheetCellAttr(sheet->GetOrCreateAttr(wxSheetCoords(row, col), attrType));
}

MaxSheetCellAttr * bmx_wxsheet_getattr(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	return new MaxSheetCellAttr(sheet->GetAttr(wxSheetCoords(row, col), attrType));
}

void bmx_wxsheet_setattr(wxSheet * sheet, int row, int col, MaxSheetCellAttr * attr, wxSheetAttr_Type attrType) {
	sheet->SetAttr(wxSheetCoords(row, col), attr->Attr(), attrType);
}

MaxSheetCellAttr * bmx_wxsheet_getgridattr(wxSheet * sheet, int row, int col) {
	return new MaxSheetCellAttr(sheet->GetGridAttr(wxSheetCoords(row, col)));
}

MaxSheetCellAttr * bmx_wxsheet_getgridcellattr(wxSheet * sheet, int row, int col) {
	return new MaxSheetCellAttr(sheet->GetGridCellAttr(wxSheetCoords(row, col)));
}

MaxSheetCellAttr * bmx_wxsheet_getgridrowattr(wxSheet * sheet, int row) {
	return new MaxSheetCellAttr(sheet->GetGridRowAttr(row));
}

MaxSheetCellAttr * bmx_wxsheet_getgridcolattr(wxSheet * sheet, int col) {
	return new MaxSheetCellAttr(sheet->GetGridColAttr(col));
}

void bmx_wxsheet_setgridcellattr(wxSheet * sheet, int row, int col, MaxSheetCellAttr * attr) {
	sheet->SetGridCellAttr(wxSheetCoords(row, col), attr->Attr());
}

void bmx_wxsheet_setgridrowattr(wxSheet * sheet, int row, MaxSheetCellAttr * attr) {
	sheet->SetGridRowAttr(row, attr->Attr());
}

void bmx_wxsheet_setgridcolattr(wxSheet * sheet, int col, MaxSheetCellAttr * attr) {
	sheet->SetGridColAttr(col, attr->Attr());
}

bool bmx_wxsheet_hasspannedcells(wxSheet * sheet) {
	return sheet->HasSpannedCells();
}

void bmx_wxsheet_getcellowner(wxSheet * sheet, int row, int col, int * ownerRow, int * ownerCol) {
	wxSheetCoords c = sheet->GetCellOwner(wxSheetCoords(row, col));
	*ownerRow = c.GetRow();
	*ownerCol = c.GetCol();
}

void bmx_wxsheet_getcellblock(wxSheet * sheet, int row, int col, int * oRow, int * oCol, int * oWidth, int * oHeight) {
	wxSheetBlock b = sheet->GetCellBlock(wxSheetCoords(row, col));
	*oRow = b.GetLeft();
	*oCol = b.GetTop();
	*oWidth = b.GetWidth();
	*oHeight = b.GetHeight();
}

void bmx_wxsheet_getcellspan(wxSheet * sheet, int row, int col, int * rowSpan, int * colSpan) {
	wxSheetCoords c = sheet->GetCellSpan(wxSheetCoords(row, col));
	*rowSpan = c.GetRow();
	*colSpan = c.GetCol();
}

void bmx_wxsheet_setcellspan(wxSheet * sheet, int row, int col, int rows, int cols) {
	sheet->SetCellSpan(wxSheetCoords(row, col), wxSheetCoords(rows, cols));
}


MaxSheetCellAttr * bmx_wxsheet_getrowlabelattr(wxSheet * sheet, int row) {
	return new MaxSheetCellAttr(sheet->GetRowLabelAttr(row));
}

MaxSheetCellAttr * bmx_wxsheet_getcollabelattr(wxSheet * sheet, int col) {
	return new MaxSheetCellAttr(sheet->GetColLabelAttr(col));
}

MaxSheetCellAttr * bmx_wxsheet_getcornerlabelattr(wxSheet * sheet) {
	return new MaxSheetCellAttr(sheet->GetCornerLabelAttr());
}

MaxSheetCellAttr * bmx_wxsheet_getrowlabelcellattr(wxSheet * sheet, int row) {
	return new MaxSheetCellAttr(sheet->GetRowLabelCellAttr(row));
}

MaxSheetCellAttr * bmx_wxsheet_getcollabelcellattr(wxSheet * sheet, int col) {
	return new MaxSheetCellAttr(sheet->GetColLabelCellAttr(col));
}

void bmx_wxsheet_setrowlabelcellattr(wxSheet * sheet, int row, MaxSheetCellAttr * attr) {
	sheet->SetRowLabelCellAttr(row, attr->Attr());
}

void bmx_wxsheet_setcollabelcellattr(wxSheet * sheet, int col, MaxSheetCellAttr * attr) {
	sheet->SetColLabelCellAttr(col, attr->Attr());
}

void bmx_wxsheet_setcornerlabelattr(wxSheet * sheet, MaxSheetCellAttr * attr) {
	sheet->SetCornerLabelAttr(attr->Attr());
}

MaxSheetCellAttr * bmx_wxsheet_getdefaultattr(wxSheet * sheet, int row, int col) {
	return new MaxSheetCellAttr(sheet->GetDefaultAttr(wxSheetCoords(row, col)));
}

MaxSheetCellAttr * bmx_wxsheet_getdefaultgridcellattr(wxSheet * sheet) {
	return new MaxSheetCellAttr(sheet->GetDefaultGridCellAttr());
}

MaxSheetCellAttr * bmx_wxsheet_getdefaultrowlabelattr(wxSheet * sheet) {
	return new MaxSheetCellAttr(sheet->GetDefaultRowLabelAttr());
}

MaxSheetCellAttr * bmx_wxsheet_getdefaultcollabelattr(wxSheet * sheet) {
	return new MaxSheetCellAttr(sheet->GetDefaultColLabelAttr());
}

void bmx_wxsheet_setdefaultattr(wxSheet * sheet, int row, int col, MaxSheetCellAttr * attr) {
	sheet->SetDefaultAttr(wxSheetCoords(row, col), attr->Attr());
}

void bmx_wxsheet_setdefaultgridcellattr(wxSheet * sheet, MaxSheetCellAttr * attr) {
	sheet->SetDefaultGridCellAttr(attr->Attr());
}

void bmx_wxsheet_setdefaultrowlabelattr(wxSheet * sheet, MaxSheetCellAttr * attr) {
	sheet->SetDefaultRowLabelAttr(attr->Attr());
}

void bmx_wxsheet_setdefaultcollabelattr(wxSheet * sheet, MaxSheetCellAttr * attr) {
	sheet->SetDefaultColLabelAttr(attr->Attr());
}

void bmx_wxsheet_getcellsize(wxSheet * sheet, int row, int col, int * w, int * h) {
	wxSize s = sheet->GetCellSize(wxSheetCoords(row, col));
	*w = s.x;
	*h = s.y;
}

bool bmx_wxsheet_iscellshown(wxSheet * sheet, int row, int col) {
	return sheet->IsCellShown(wxSheetCoords(row, col));
}

void bmx_wxsheet_setmargins(wxSheet * sheet, int width, int height) {
	sheet->SetMargins(width, height);
}

int bmx_wxsheet_getrowbestheight(wxSheet * sheet, int row) {
	return sheet->GetRowBestHeight(row);
}

int bmx_wxsheet_getcolbestwidth(wxSheet * sheet, int col) {
	return sheet->GetColBestWidth(col);
}

int bmx_wxsheet_getrowlabelwidth(wxSheet * sheet, bool zeroNotShown) {
	return sheet->GetRowLabelWidth(zeroNotShown);
}

int bmx_wxsheet_getcollabelheight(wxSheet * sheet, bool zeroNotShown) {
	return sheet->GetColLabelHeight(zeroNotShown);
}

void bmx_wxsheet_setrowlabelwidth(wxSheet * sheet, int width) {
	sheet->SetRowLabelWidth(width);
}

void bmx_wxsheet_setcollabelheight(wxSheet * sheet, int height) {
	sheet->SetColLabelHeight(height);
}

int bmx_wxsheet_autosizerow(wxSheet * sheet, int row, bool setAsMin) {
	return sheet->AutoSizeRow(row, setAsMin);
}

int bmx_wxsheet_autosizecol(wxSheet * sheet, int col, bool setAsMin) {
	return sheet->AutoSizeCol(col, setAsMin);
}

void bmx_wxsheet_autosizerows(wxSheet * sheet, bool setAsMin) {
	sheet->AutoSizeRows(setAsMin);
}

void bmx_wxsheet_autosizecols(wxSheet * sheet, bool setAsMin) {
	sheet->AutoSizeCols(setAsMin);
}

void bmx_wxsheet_autosize(wxSheet * sheet, bool setAsMin) {
	sheet->AutoSize(setAsMin);
}

void bmx_wxsheet_autosizerowlabelheight(wxSheet * sheet, int row) {
	sheet->AutoSizeRowLabelHeight(row);
}

void bmx_wxsheet_autosizecollabelwidth(wxSheet * sheet, int col) {
	sheet->AutoSizeColLabelWidth(col);
}

void bmx_wxsheet_setequalcolwidths(wxSheet * sheet, int minWidth) {
	sheet->SetEqualColWidths(minWidth);
}

BBString * bmx_wxsheet_getrowlabelvalue(wxSheet * sheet, int row) {
	return bbStringFromWxString(sheet->GetRowLabelValue(row));
}

BBString * bmx_wxsheet_getcollabelvalue(wxSheet * sheet, int col) {
	return bbStringFromWxString(sheet->GetColLabelValue(col));
}

void bmx_wxsheet_setrowlabelvalue(wxSheet * sheet, int row, BBString * value) {
	sheet->SetRowLabelValue(row, wxStringFromBBString(value));
}

void bmx_wxsheet_setcollabelvalue(wxSheet * sheet, int col, BBString * value) {
	sheet->SetColLabelValue(col, wxStringFromBBString(value));
}

BBString * bmx_wxsheet_getcornerlabelvalue(wxSheet * sheet) {
	return bbStringFromWxString(sheet->GetCornerLabelValue());
}

void bmx_wxsheet_setcornerlabelvalue(wxSheet * sheet, BBString * value) {
	sheet->SetCornerLabelValue(wxStringFromBBString(value));
}

int bmx_wxsheet_isareaeditable(wxSheet * sheet, int cellType) {
	return sheet->IsAreaEditable(cellType);
}

int bmx_wxsheet_getareaeditable(wxSheet * sheet) {
	return sheet->GetAreaEditable();
}

void bmx_wxsheet_setareaeditable(wxSheet * sheet, int cellType) {
	sheet->SetAreaEditable(cellType);
}

void bmx_wxsheet_enabledragrowsize(wxSheet * sheet, bool enable) {
	sheet->EnableDragRowSize(enable);
}

void bmx_wxsheet_enabledragcolsize(wxSheet * sheet, bool enable) {
	sheet->EnableDragColSize(enable);
}

void bmx_wxsheet_enabledraggridsize(wxSheet * sheet, bool enable) {
	sheet->EnableDragGridSize(enable);
}

void bmx_wxsheet_disabledragrowsize(wxSheet * sheet) {
	sheet->DisableDragRowSize();
}

void bmx_wxsheet_disabledragcolsize(wxSheet * sheet) {
	sheet->DisableDragColSize();
}

void bmx_wxsheet_disabledraggridsize(wxSheet * sheet) {
	sheet->DisableDragGridSize();
}

bool bmx_wxsheet_candragrowsize(wxSheet * sheet) {
	return sheet->CanDragRowSize();
}

bool bmx_wxsheet_candragcolsize(wxSheet * sheet) {
	return sheet->CanDragColSize();
}

bool bmx_wxsheet_candraggridsize(wxSheet * sheet) {
	return sheet->CanDragGridSize();
}

void bmx_wxsheet_enablegridlines(wxSheet * sheet, int dir) {
	sheet->EnableGridLines(dir);
}

int bmx_wxsheet_gridlinesenabled(wxSheet * sheet) {
	return sheet->GridLinesEnabled();
}

MaxColour * bmx_wxsheet_getgridlinecolour(wxSheet * sheet) {
	wxColour c(sheet->GetGridLineColour());
	return new MaxColour(c);
}

void bmx_wxsheet_setgridlinecolour(wxSheet * sheet, MaxColour * colour) {
	sheet->SetGridLineColour(colour->Colour());
}

MaxSheetSelection * bmx_wxsheet_getselection(wxSheet * sheet) {
	return new MaxSheetSelection(*sheet->GetSelection());
}

void bmx_wxsheet_adjustscrollbars(wxSheet * sheet, bool calcWinSizes) {
	sheet->AdjustScrollbars(calcWinSizes);
}

int bmx_wxsheet_getscrollbarmode(wxSheet * sheet) {
	return sheet->GetScrollBarMode();
}

void bmx_wxsheet_setscrollbarmode(wxSheet * sheet, int mode) {
	sheet->SetScrollBarMode(mode);
}

void bmx_wxsheet_sethorizontalscrollbarmode(wxSheet * sheet, int mode) {
	sheet->SetHorizontalScrollBarMode(mode);
}

void bmx_wxsheet_setverticalscrollbarmode(wxSheet * sheet, int mode) {
	sheet->SetVerticalScrollBarMode(mode);
}

int bmx_wxsheet_needsverticalscrollbar(wxSheet * sheet) {
	return sheet->NeedsVerticalScrollBar();
}

int bmx_wxsheet_needshorizontalscrollbar(wxSheet * sheet) {
	return sheet->NeedsHorizontalScrollBar();
}

void bmx_wxsheet_refreshcell(wxSheet * sheet, int row, int col, bool singleCell) {
	sheet->RefreshCell(wxSheetCoords(row, col), singleCell);
}

void bmx_wxsheet_refreshblock(wxSheet * sheet, MaxSheetBlock * block) {
	sheet->RefreshBlock(block->Block());
}

void bmx_wxsheet_refreshrow(wxSheet * sheet, int row) {
	sheet->RefreshRow(row);
}

void bmx_wxsheet_refreshcol(wxSheet * sheet, int col) {
	sheet->RefreshCol(col);
}

void bmx_wxsheet_refreshgridcellblock(wxSheet * sheet, MaxSheetBlock * block) {
	sheet->RefreshGridCellBlock(block->Block());
}

void bmx_wxsheet_refreshattrchange(wxSheet * sheet, int row, int col, wxSheetAttr_Type attrType) {
	sheet->RefreshAttrChange(wxSheetCoords(row, col), attrType);
}

void bmx_wxsheet_refreshsheet(wxSheet * sheet, bool eraseb, MaxRect * rect) {
	if (rect) {
		sheet->Refresh(eraseb, & rect->Rect());
	} else {
		sheet->Refresh(eraseb);
	}
}

bool bmx_wxsheet_hasselection(wxSheet * sheet, bool selecting) {
	return sheet->HasSelection(selecting);
}

bool bmx_wxsheet_iscellselected(wxSheet * sheet, int row, int col) {
	return sheet->IsCellSelected(wxSheetCoords(row, col));
}

bool bmx_wxsheet_isrowselected(wxSheet * sheet, int row) {
	return sheet->IsRowSelected(row);
}

bool bmx_wxsheet_iscolselected(wxSheet * sheet, int col) {
	return sheet->IsColSelected(col);
}

bool bmx_wxsheet_isblockselected(wxSheet * sheet, MaxSheetBlock * block) {
	return sheet->IsBlockSelected(block->Block());
}

bool bmx_wxsheet_isselecting(wxSheet * sheet) {
	return sheet->IsSelecting();
}

void bmx_wxsheet_setselectionmode(wxSheet * sheet, wxSheetSelectionMode_Type selmode) {
	sheet->SetSelectionMode(selmode);
}

int bmx_wxsheet_getselectionmode(wxSheet * sheet) {
	return sheet->GetSelectionMode();
}

bool bmx_wxsheet_hasselectionmode(wxSheet * sheet, int mode) {
	return sheet->HasSelectionMode(mode);
}

void bmx_wxsheet_beginbatch(wxSheet * sheet) {
	sheet->BeginBatch();
}

void bmx_wxsheet_endbatch(wxSheet * sheet, bool refresh) {
	sheet->EndBatch(refresh);
}

int bmx_wxsheet_getbatchcount(wxSheet * sheet) {
	return sheet->GetBatchCount();
}

void bmx_wxsheet_forcerefresh(wxSheet * sheet) {
	sheet->ForceRefresh();
}

MaxSheetBlock * bmx_wxsheet_fixselectionblock(wxSheet * sheet, MaxSheetBlock * block, int selMode) {
	return new MaxSheetBlock(sheet->FixSelectionBlock(block->Block(), selMode));
}

bool bmx_wxsheet_selectrow(wxSheet * sheet, int row, bool addToSelected, bool sendEvt) {
	return sheet->SelectRow(row, addToSelected, sendEvt);
}

bool bmx_wxsheet_selectrows(wxSheet * sheet, int rowTop, int rowBottom, bool addToSelected, bool sendEvt) {
	return sheet->SelectRows(rowTop, rowBottom, addToSelected, sendEvt);
}

bool bmx_wxsheet_selectCol(wxSheet * sheet, int col, bool addToSelected, bool sendEvt) {
	return sheet->SelectCol(col, addToSelected, sendEvt);
}

bool bmx_wxsheet_selectcols(wxSheet * sheet, int colLeft, int colRight, bool addToSelected, bool sendEvt) {
	return sheet->SelectCols(colLeft, colRight, addToSelected, sendEvt);
}

bool bmx_wxsheet_selectcell(wxSheet * sheet, int row, int col, bool addToSelected, bool sendEvt) {
	return sheet->SelectCell(wxSheetCoords(row, col), addToSelected, sendEvt);
}

bool bmx_wxsheet_selectblock(wxSheet * sheet, MaxSheetBlock * block, bool addToSelected, bool sendEvt) {
	return sheet->SelectBlock(block->Block(), addToSelected, sendEvt);
}

bool bmx_wxsheet_selectall(wxSheet * sheet, bool sendEvt) {
	return sheet->SelectAll(sendEvt);
}

bool bmx_wxsheet_deselectrow(wxSheet * sheet, int row, bool sendEvt) {
	return sheet->DeselectRow(row, sendEvt);
}

bool bmx_wxsheet_deselectrows(wxSheet * sheet, int rowTop, int rowBottom, bool sendEvt) {
	return sheet->DeselectRows(rowTop, rowBottom, sendEvt);
}

bool bmx_wxsheet_deselectcol(wxSheet * sheet, int col, bool sendEvt) {
	return sheet->DeselectCol(col, sendEvt);
}

bool bmx_wxsheet_deselectcols(wxSheet * sheet, int colLeft, int colRight, bool sendEvt) {
	return sheet->DeselectCols(colLeft, colRight, sendEvt);
}

bool bmx_wxsheet_deselectcell(wxSheet * sheet, int row, int col, bool sendEvt) {
	return sheet->DeselectCell(wxSheetCoords(row, col), sendEvt);
}

bool bmx_wxsheet_deselectblock(wxSheet * sheet, MaxSheetBlock * block, bool sendEvt) {
	return sheet->DeselectBlock(block->Block(), sendEvt);
}

bool bmx_wxsheet_clearselection(wxSheet * sheet, bool sendEvt) {
	return sheet->ClearSelection(sendEvt);
}

bool bmx_wxsheet_togglecellselection(wxSheet * sheet, int row, int col, bool addToSelected, bool sendEvt) {
	return sheet->ToggleCellSelection(wxSheetCoords(row, col), addToSelected, sendEvt);
}

bool bmx_wxsheet_togglerowselection(wxSheet * sheet, int row, bool addToSelected, bool sendEvt) {
	return sheet->ToggleRowSelection(row, addToSelected, sendEvt);
}

bool bmx_wxsheet_togglecolselection(wxSheet * sheet, int col, bool addToSelected, bool sendEvt) {
	return sheet->ToggleColSelection(col, addToSelected, sendEvt);
}

MaxPen * bmx_wxsheet_getcursorcellhighlightpen(wxSheet * sheet) {
	wxPen p(sheet->GetCursorCellHighlightPen());
	return new MaxPen(p);
}

MaxPen * bmx_wxsheet_getcursorcellhighlightropen(wxSheet * sheet) {
	wxPen p(sheet->GetCursorCellHighlightROPen());
	return new MaxPen(p);
}

void bmx_wxsheet_setcursorcellhighlightpen(wxSheet * sheet, MaxPen * pen) {
	sheet->SetCursorCellHighlightPen(pen->Pen());
}

void bmx_wxsheet_setcursorcellhighlightreopen(wxSheet * sheet, MaxPen * pen) {
	sheet->SetCursorCellHighlightROPen(pen->Pen());
}

MaxColour * bmx_wxsheet_getlabeloutlinecolour(wxSheet * sheet) {
	wxColour c(sheet->GetLabelOutlineColour());
	return new MaxColour(c);
}

void bmx_wxsheet_setlabeloutlinecolour(wxSheet * sheet, MaxColour * colour) {
	sheet->SetLabelOutlineColour(colour->Colour());
}

MaxColour * bmx_wxsheet_getselectionbackground(wxSheet * sheet) {
	wxColour c(sheet->GetSelectionBackground());
	return new MaxColour(c);
}

MaxColour * bmx_wxsheet_getselectionforeground(wxSheet * sheet) {
	wxColour c(sheet->GetSelectionForeground());
	return new MaxColour(c);
}

void bmx_wxsheet_setselectionbackground(wxSheet * sheet, MaxColour * colour) {
	sheet->SetSelectionBackground(colour->Colour());
}

void bmx_wxsheet_setselectionforeground(wxSheet * sheet, MaxColour * colour) {
	sheet->SetSelectionForeground(colour->Colour());
}

bool bmx_wxsheet_hasfocus(wxSheet * sheet) {
	return sheet->HasFocus();
}

bool bmx_wxsheet_copycurrentselectiontoclipboard(wxSheet * sheet, bool copyCursor, BBString * colSep) {
	return sheet->CopyCurrentSelectionToClipboard(copyCursor, wxStringFromBBString(colSep).GetChar(0));
}

bool bmx_wxsheet_copycurrentselectiontointernalselection(wxSheet * sheet, bool copyCursor) {
	return sheet->CopyCurrentSelectionToInternalSelection(copyCursor);
}

bool bmx_wxsheet_copyinternalselectiontoclipboard(wxSheet * sheet, BBString * colSep) {
	return sheet->CopyInternalSelectionToClipboard(wxStringFromBBString(colSep).GetChar(0));
}

BBString * bmx_wxsheet_copyinternalselectiontostring(wxSheet * sheet, BBString * colSep) {
	return bbStringFromWxString(sheet->CopyInternalSelectionToString(wxStringFromBBString(colSep).GetChar(0)));
}

bool bmx_wxsheet_copystringtointernalselection(wxSheet * sheet, BBString * value, BBString * colSep) {
	return sheet->CopyStringToInternalSelection(wxStringFromBBString(value), wxStringFromBBString(colSep).GetChar(0));
}

bool bmx_wxsheet_pastefromclipboard(wxSheet * sheet, int row, int col, BBString * colSep) {
	return sheet->PasteFromClipboard(wxSheetCoords(row, col), wxStringFromBBString(colSep).GetChar(0));
}

bool bmx_wxsheet_pasteinternalcopiedselection(wxSheet * sheet, int row, int col) {
	return sheet->PasteInternalCopiedSelection(wxSheetCoords(row, col));
}

bool bmx_wxsheet_currentlypasting(wxSheet * sheet) {
	return sheet->CurrentlyPasting();
}

MaxSheetCellEditor * bmx_wxsheet_getdefaulteditorfortype(wxSheet * sheet, BBString * typeName) {
	return new MaxSheetCellEditor(sheet->GetDefaultEditorForType(wxStringFromBBString(typeName)));
}

MaxSheetCellRenderer * bmx_wxsheet_getdefaultrendererfortype(wxSheet * sheet, BBString * typeName) {
	return new MaxSheetCellRenderer(sheet->GetDefaultRendererForType(wxStringFromBBString(typeName)));
}

bool bmx_wxsheet_setnumberrows(wxSheet * sheet, int rows, bool update) {
	return sheet->SetNumberRows(rows, update);
}

bool bmx_wxsheet_setnumbercols(wxSheet * sheet, int cols, bool update) {
	return sheet->SetNumberCols(cols, update);
}

bool bmx_wxsheet_setnumbercells(wxSheet * sheet, int rows, int cols, bool update) {
	return sheet->SetNumberCells(rows, cols, update);
}

int bmx_wxsheet_getdefaultrowheight(wxSheet * sheet) {
	return sheet->GetDefaultRowHeight();
}

int bmx_wxsheet_getdefaultcolwidth(wxSheet * sheet) {
	return sheet->GetDefaultColWidth();
}

void bmx_wxsheet_setdefaultrowheight(wxSheet * sheet, int height, bool resizeExistingRows) {
	sheet->SetDefaultRowHeight(height, resizeExistingRows);
}

void bmx_wxsheet_setdefaultcolwidth(wxSheet * sheet, int width, bool resizeExistingCols) {
	sheet->SetDefaultColWidth(width, resizeExistingCols);
}

int bmx_wxsheet_getminimalacceptablerowheight(wxSheet * sheet) {
	return sheet->GetMinimalAcceptableRowHeight();
}

int bmx_wxsheet_getminimalacceptablecolwidth(wxSheet * sheet) {
	return sheet->GetMinimalAcceptableColWidth();
}

void bmx_wxsheet_setminimalacceptablerowheight(wxSheet * sheet, int height) {
	sheet->SetMinimalAcceptableRowHeight(height);
}

void bmx_wxsheet_setminimalacceptablecolwidth(wxSheet * sheet, int width) {
	sheet->SetMinimalAcceptableColWidth(width);
}

int bmx_wxsheet_getminimalrowheight(wxSheet * sheet, int row) {
	return sheet->GetMinimalRowHeight(row);
}

int bmx_wxsheet_getminimalcolwidth(wxSheet * sheet, int col) {
	return sheet->GetMinimalColWidth(col);
}

void bmx_wxsheet_setminimalrowheight(wxSheet * sheet, int row, int height) {
	sheet->SetMinimalRowHeight(row, height);
}

void bmx_wxsheet_setminimalcolwidth(wxSheet * sheet, int col, int width) {
	sheet->SetMinimalColWidth(col, width);
}

// *********************************************

int bmx_wxsheetselection_getnumberrows(MaxSheetSelection * selection) {
	return selection->Selection().GetNumberRows();
}

int bmx_wxsheetselection_getnumbercols(MaxSheetSelection * selection) {
	return selection->Selection().GetNumberCols();
}

int bmx_wxsheetselection_getoptions(MaxSheetSelection * selection) {
	return selection->Selection().GetOptions();
}

void bmx_wxsheetselection_setoptions(MaxSheetSelection * selection, int options) {
	selection->Selection().SetOptions(options);
}

bool bmx_wxsheetselection_hasselection(MaxSheetSelection * selection) {
	return selection->Selection().HasSelection();
}

int bmx_wxsheetselection_getcount(MaxSheetSelection * selection) {
	return selection->Selection().GetCount();
}

bool bmx_wxsheetselection_isminimized(MaxSheetSelection * selection) {
	return selection->Selection().IsMinimzed();
}

int bmx_wxsheetselection_clear(MaxSheetSelection * selection) {
	return selection->Selection().Clear();
}

int bmx_wxsheetselection_empty(MaxSheetSelection * selection) {
	return selection->Selection().Empty();
}

MaxSheetBlock * bmx_wxsheetselection_getblock(MaxSheetSelection * selection, int index) {
	wxSheetBlock b(selection->Selection().GetBlock(index));
	return new MaxSheetBlock(b);
}

void bmx_wxsheetselection_delete(MaxSheetSelection * selection) {
	delete selection;
}


// *********************************************


void bmx_wxsheetblock_delete(MaxSheetBlock * block) {
	delete block;
}

MaxSheetBlock * bmx_wxsheetblock_create(int row, int col, int height, int width) {
	wxSheetBlock b(row, col, height, width);
	return new MaxSheetBlock(b);
}

int bmx_wxsheetblock_getleft(MaxSheetBlock * block) {
	return block->Block().GetLeft();
}

int bmx_wxsheetblock_getright(MaxSheetBlock * block) {
	return block->Block().GetRight();
}

int bmx_wxsheetblock_gettop(MaxSheetBlock * block) {
	return block->Block().GetTop();
}

int bmx_wxsheetblock_getbottom(MaxSheetBlock * block) {
	return block->Block().GetBottom();
}

int bmx_wxsheetblock_getwidth(MaxSheetBlock * block) {
	return block->Block().GetWidth();
}

int bmx_wxsheetblock_getheight(MaxSheetBlock * block) {
	return block->Block().GetHeight();
}



// *********************************************

BEGIN_EVENT_TABLE(MaxSheetSplitter, wxSheetSplitter)
END_EVENT_TABLE()

MaxSheetSplitter * bmx_wxsheetsplitter_create(BBObject * handle, wxWindow * parent, wxWindowID id, int x, int y, int w, int h, long style) {
	return new MaxSheetSplitter(handle, parent, id, x, y, w, h, style);
}

void bmx_wxsheetsplitter_initialize(wxSheetSplitter * splitter, wxSheet * sheet) {
	splitter->Initialize(sheet);
}





// *********************************************

void bmx_wxsheettable_setview(wxSheetTable * table, wxSheet * sheet) {
	table->SetView(sheet);
}

int bmx_wxsheettable_getnumberrows(wxSheetTable * table) {
	return table->GetNumberRows();
}

int bmx_wxsheettable_getnumbercols(wxSheetTable * table) {
	return table->GetNumberCols();
}

bool bmx_wxsheettable_containsgridrow(wxSheetTable * table, int row) {
	return table->ContainsGridRow(row);
}

bool bmx_wxsheettable_containsgridcol(wxSheetTable * table, int col) {
	return table->ContainsGridCol(col);
}

bool bmx_wxsheettable_containsgridcell(wxSheetTable * table, int row, int col) {
	return table->ContainsGridCell(wxSheetCoords(row, col));
}

BBString * bmx_wxsheettable_getvalue(wxSheetTable * table, int row, int col) {
	return bbStringFromWxString(table->GetValue(wxSheetCoords(row, col)));
}

void bmx_wxsheettable_setvalue(wxSheetTable * table, int row, int col, BBString * value) {
	table->SetValue(wxSheetCoords(row, col), wxStringFromBBString(value));
}

bool bmx_wxsheettable_hasvalue(wxSheetTable * table, int row, int col) {
	return table->HasValue(wxSheetCoords(row, col));
}

int bmx_wxsheettable_getfirstnonemptycoltoleft(wxSheetTable * table, int row, int col) {
	return table->GetFirstNonEmptyColToLeft(wxSheetCoords(row, col));
}

void bmx_wxsheettable_clearvalues(wxSheetTable * table, int update) {
	table->ClearValues(update);
}

BBString * bmx_wxsheettable_getdefaultrowlabelvalue(wxSheetTable * table, int row) {
	return bbStringFromWxString(table->GetDefaultRowLabelValue(row));
}

BBString * bmx_wxsheettable_getdefaultcollabelvalue(wxSheetTable * table, int col) {
	return bbStringFromWxString(table->GetDefaultColLabelValue(col));
}

long bmx_wxsheettable_getvalueasint(wxSheetTable * table, int row, int col) {
	return table->GetValueAsLong(wxSheetCoords(row, col));
}

double bmx_wxsheettable_getvalueasdouble(wxSheetTable * table, int row, int col) {
	return table->GetValueAsDouble(wxSheetCoords(row, col));
}

bool bmx_wxsheettable_getvalueasbool(wxSheetTable * table, int row, int col) {
	return table->GetValueAsBool(wxSheetCoords(row, col));
}


// *********************************************

MaxSheetCellEditor * bmx_wxsheetcelleditor_create(wxSheetCellEditorRefData * data) {
	wxSheetCellEditor e(data);
	return new MaxSheetCellEditor(e);
}

void bmx_wxsheetcelleditor_delete(MaxSheetCellEditor * editor) {
	delete editor;
}

// *********************************************

wxSheetCellAutoWrapStringEditorRefData * bmx_wxsheetcellautowrapstringeditorrefdata_create() {
	return new wxSheetCellAutoWrapStringEditorRefData();
}

// *********************************************

MaxSheetCellRenderer * bmx_wxsheetcellrenderer_create(wxSheetCellRendererRefData * data) {
	wxSheetCellRenderer r(data);
	return new MaxSheetCellRenderer(r);
}

void bmx_wxsheetcellrenderer_delete(MaxSheetCellRenderer * renderer) {
	delete renderer;
}
	
// *********************************************

wxSheetCellAutoWrapStringRendererRefData * bmx_wxsheetcellautowrapstringrendererrefdata_create() {
	return new wxSheetCellAutoWrapStringRendererRefData();
}

// *********************************************

wxSheetCellTextEditorRefData * bmx_wxsheetcelltexteditorrefdata_create() {
	return new wxSheetCellTextEditorRefData();
}

// *********************************************

wxSheetCellNumberEditorRefData * bmx_wxsheetcellnumbereditorrefdata_create(int minimum, int maximum) {
	return new wxSheetCellNumberEditorRefData(minimum, maximum);
}

// *********************************************

wxSheetCellFloatEditorRefData * bmx_wxsheetcellfloateditorrefdata_create(int width, int precision) {
	return new wxSheetCellFloatEditorRefData(width, precision);
}

// *********************************************

wxSheetCellChoiceEditorRefData * bmx_wxsheetcellchoiceeditorrefdata_create(BBArray * choices, bool allowOthers) {
	return new wxSheetCellChoiceEditorRefData(bbStringArrayTowxArrayStr(choices), allowOthers);
}

// *********************************************

wxSheetCellBoolEditorRefData * bmx_wxsheetcellbooleditorrefdata_create() {
	return new wxSheetCellBoolEditorRefData();
}

// *********************************************

wxSheetCellEnumEditorRefData * bmx_wxsheetcellenumeditorrefdata_create(BBString * choices) {
	return new wxSheetCellEnumEditorRefData(wxStringFromBBString(choices));
}

// *********************************************

MaxSheetCellStringRendererRefData * bmx_wxsheetcellstringrendererrefdata_create(BBObject * handle) {
	return new MaxSheetCellStringRendererRefData(handle);
}


void bmx_wxsheetcellstringrendererrefdata_draw(MaxSheetCellStringRendererRefData * data,
		wxSheet * sheet, MaxSheetCellAttr * attr, MaxDC * dc, MaxRect * rect, int row, int col, bool isSelected) {

	data->MaxDraw(sheet, attr, dc, rect, row, col, isSelected);
}

// *********************************************

wxSheetCellNumberRendererRefData * bmx_wxsheetcellnumberrendererrefdata_create() {
	return new wxSheetCellNumberRendererRefData();
}

// *********************************************

wxSheetCellFloatRendererRefData * bmx_wxsheetcellfloatrendererrefdata_create(int width, int precision) {
	return new wxSheetCellFloatRendererRefData(width, precision);
}

// *********************************************

wxSheetCellBoolRendererRefData * bmx_wxsheetcellboolrendererrefdata_create() {
	return new wxSheetCellBoolRendererRefData();
}

// *********************************************

wxSheetCellEnumRendererRefData * bmx_wxsheetcellenumrendererrefdata_create(BBString * choices) {
	return new wxSheetCellEnumRendererRefData(wxStringFromBBString(choices));
}

// *********************************************

wxSheetCellBitmapRendererRefData * bmx_wxsheetcellbitmaprendererrefdata_create(MaxBitmap * bitmap, int align) {
	return new wxSheetCellBitmapRendererRefData(bitmap->Bitmap(), align);
}


// *********************************************

MaxSheetCellAttr * bmx_wxsheetcellattr_create(bool createData) {
	return new MaxSheetCellAttr(createData);
}

void bmx_wxsheetcellattr_setforegroundcolour(MaxSheetCellAttr * attr, MaxColour * colour) {
	attr->Attr().SetForegroundColour(colour->Colour());
}

void bmx_wxsheetcellattr_setbackgroundcolour(MaxSheetCellAttr * attr, MaxColour * colour) {
	attr->Attr().SetBackgroundColour(colour->Colour());
}

void bmx_wxsheetcellattr_setfont(MaxSheetCellAttr * attr, MaxFont * font) {
	attr->Attr().SetFont(font->Font());
}

void bmx_wxsheetcellattr_setalignment(MaxSheetCellAttr * attr, int align) {
	attr->Attr().SetAlignment(align);
}

void bmx_wxsheetcellattr_setalignmenthv(MaxSheetCellAttr * attr, int horzAlign, int vertAlign) {
	attr->Attr().SetAlignment(horzAlign, vertAlign);
}

void bmx_wxsheetcellattr_setorientation(MaxSheetCellAttr * attr, int orientation) {
	attr->Attr().SetOrientation(orientation);
}

void bmx_wxsheetcellattr_setlevel(MaxSheetCellAttr * attr, wxSheetAttrLevel_Type level) {
	attr->Attr().SetLevel(level);
}

void bmx_wxsheetcellattr_setoverflow(MaxSheetCellAttr * attr, bool allow) {
	attr->Attr().SetOverflow(allow);
}

void bmx_wxsheetcellattr_setoverflowmarker(MaxSheetCellAttr * attr, bool drawMarker) {
	attr->Attr().SetOverflowMarker(drawMarker);
}

void bmx_wxsheetcellattr_setshoweditor(MaxSheetCellAttr * attr, bool showEditor) {
	attr->Attr().SetShowEditor(showEditor);
}

void bmx_wxsheetcellattr_setreadonly(MaxSheetCellAttr * attr, bool isReadOnly) {
	attr->Attr().SetReadOnly(isReadOnly);
}

void bmx_wxsheetcellattr_setrenderer(MaxSheetCellAttr * attr, MaxSheetCellRenderer * renderer) {
	attr->Attr().SetRenderer(renderer->Renderer());
}

void bmx_wxsheetcellattr_seteditor(MaxSheetCellAttr * attr, MaxSheetCellEditor * editor) {
	attr->Attr().SetEditor(editor->Editor());
}

void bmx_wxsheetcellattr_setkind(MaxSheetCellAttr * attr, wxSheetAttr_Type kind) {
	attr->Attr().SetKind(kind);
}

bool bmx_wxsheetcellattr_hasforegroundcolour(MaxSheetCellAttr * attr) {
	return attr->Attr().HasForegroundColour();
}

bool bmx_wxsheetcellattr_hasbackgroundcolour(MaxSheetCellAttr * attr) {
	return attr->Attr().HasBackgroundColour();
}

bool bmx_wxsheetcellattr_hasfont(MaxSheetCellAttr * attr) {
	return attr->Attr().HasFont();
}

bool bmx_wxsheetcellattr_hasalignment(MaxSheetCellAttr * attr) {
	return attr->Attr().HasAlignment();
}

bool bmx_wxsheetcellattr_hasorientation(MaxSheetCellAttr * attr) {
	return attr->Attr().HasOrientation();
}

bool bmx_wxsheetcellattr_haslevel(MaxSheetCellAttr * attr) {
	return attr->Attr().HasLevel();
}

bool bmx_wxsheetcellattr_hasoverflowmode(MaxSheetCellAttr * attr) {
	return attr->Attr().HasOverflowMode();
}

bool bmx_wxsheetcellattr_hasoverflowmarkermode(MaxSheetCellAttr * attr) {
	return attr->Attr().HasOverflowMarkerMode();
}

bool bmx_wxsheetcellattr_hasshoweditormode(MaxSheetCellAttr * attr) {
	return attr->Attr().HasShowEditorMode();
}

bool bmx_wxsheetcellattr_hasreadwritemode(MaxSheetCellAttr * attr) {
	return attr->Attr().HasReadWriteMode();
}

bool bmx_wxsheetcellattr_hasrenderer(MaxSheetCellAttr * attr) {
	return attr->Attr().HasRenderer();
}

bool bmx_wxsheetcellattr_haseditor(MaxSheetCellAttr * attr) {
	return attr->Attr().HasEditor();
}

bool bmx_wxsheetcellattr_hasdefaultattr(MaxSheetCellAttr * attr) {
	return attr->Attr().HasDefaultAttr();
}

bool bmx_wxsheetcellattr_iscomplete(MaxSheetCellAttr * attr) {
	return attr->Attr().IsComplete();
}

MaxColour * bmx_wxsheetcellattr_getforegroundcolour(MaxSheetCellAttr * attr) {
	wxColour c(attr->Attr().GetForegroundColour());
	return new MaxColour(c);
}

MaxColour * bmx_wxsheetcellattr_getbackgroundcolour(MaxSheetCellAttr * attr) {
	wxColour c(attr->Attr().GetBackgroundColour());
	return new MaxColour(c);
}

MaxFont * bmx_wxsheetcellattr_getfont(MaxSheetCellAttr * attr) {
	wxFont f(attr->Attr().GetFont());
	return new MaxFont(f);
}

int bmx_wxsheetcellattr_getalignment(MaxSheetCellAttr * attr) {
	return attr->Attr().GetAlignment();
}

wxOrientation bmx_wxsheetcellattr_getorientation(MaxSheetCellAttr * attr) {
	return attr->Attr().GetOrientation();
}

wxSheetAttrLevel_Type bmx_wxsheetcellattr_getlevel(MaxSheetCellAttr * attr) {
	return attr->Attr().GetLevel();
}

bool bmx_wxsheetcellattr_getoverflow(MaxSheetCellAttr * attr) {
	return attr->Attr().GetOverflow();
}

bool bmx_wxsheetcellattr_getoverflowmarker(MaxSheetCellAttr * attr) {
	return attr->Attr().GetOverflowMarker();
}

bool bmx_wxsheetcellattr_getshoweditor(MaxSheetCellAttr * attr) {
	return attr->Attr().GetShowEditor();
}

bool bmx_wxsheetcellattr_getreadonly(MaxSheetCellAttr * attr) {
	return attr->Attr().GetReadOnly();
}

MaxSheetCellRenderer * bmx_wxsheetcellattr_getrenderer(MaxSheetCellAttr * attr, wxSheet * sheet, int row, int col) {
	return new MaxSheetCellRenderer(attr->Attr().GetRenderer(sheet, wxSheetCoords(row, col)));
}

MaxSheetCellEditor * bmx_wxsheetcellattr_geteditor(MaxSheetCellAttr * attr, wxSheet * sheet, int row, int col) {
	return new MaxSheetCellEditor(attr->Attr().GetEditor(sheet, wxSheetCoords(row, col)));
}

wxSheetAttr_Type bmx_wxsheetcellattr_getkind(MaxSheetCellAttr * attr) {
	return attr->Attr().GetKind();
}

void bmx_wxsheetcellattr_delete(MaxSheetCellAttr * attr) {
	delete attr;
}

// *********************************************

int bmx_wxsheetevent_getrow(wxSheetEvent & event) {
	return event.GetRow();
}

int bmx_wxsheetevent_getcol(wxSheetEvent & event) {
	return event.GetCol();
}

void bmx_wxsheetevent_getcoords(wxSheetEvent & event, int * row, int * col) {
	wxSheetCoords s(event.GetCoords());
	*row = s.GetRow();
	*col = s.GetCol();
}

bool bmx_wxsheetevent_selecting(wxSheetEvent & event) {
	return event.Selecting();
}

bool bmx_wxsheetevent_controldown(wxSheetEvent & event) {
	return event.ControlDown();
}

bool bmx_wxsheetevent_shiftdown(wxSheetEvent & event) {
	return event.ShiftDown();
}

bool bmx_wxsheetevent_altdown(wxSheetEvent & event) {
	return event.AltDown();
}

bool bmx_wxsheetevent_metadown(wxSheetEvent & event) {
	return event.MetaDown();
}

void bmx_wxsheetevent_getposition(wxSheetEvent & event, int * x, int * y) {
	wxPoint p(event.GetPosition());
	*x = p.x;
	*y = p.y;
}

void bmx_wxsheetevent_getscrolledposition(wxSheetEvent & event, int * x, int * y) {
	wxPoint p(event.GetScrolledPosition());
	*x = p.x;
	*y = p.y;
}

wxWindow * bmx_wxsheetevent_geteventwindow(wxSheetEvent & event) {
	return event.GetEventWindow();
}


// *********************************************

int bmx_wxsheetsplitterevent_getsashposition(wxSheetSplitterEvent & event) {
	return event.GetSashPosition();
}

void bmx_wxsheetsplitterevent_setsashposition(wxSheetSplitterEvent & event, int pos) {
	event.SetSashPosition(pos);
}

int bmx_wxsheetsplitterevent_getsplitmode(wxSheetSplitterEvent & event) {
	return event.GetSplitMode();
}

bool bmx_wxsheetsplitterevent_isverticalsplit(wxSheetSplitterEvent & event) {
	return event.IsVerticalSplit();
}

wxSheet * bmx_wxsheetsplitterevent_getsheet(wxSheetSplitterEvent & event) {
	return event.GetSheet();
}

wxSheetSplitter * bmx_wxsheetsplitterevent_getsheetsplitter(wxSheetSplitterEvent & event) {
	return event.GetSheetSplitter();
}


// *********************************************

void bmx_wxsheeteditorcreatedevent_getcoords(wxSheetEditorCreatedEvent & event, int * row, int * col) {
	wxSheetCoords s(event.GetCoords());
	*row = s.GetRow();
	*col = s.GetCol();
}

wxWindow * bmx_wxsheeteditorcreatedevent_getcontrol(wxSheetEditorCreatedEvent & event) {
	return event.GetControl();
}

void bmx_wxsheeteditorcreatedevent_setcoords(wxSheetEditorCreatedEvent & event, int row, int col) {
	event.SetCoords(wxSheetCoords(row, col));
}

void bmx_wxsheeteditorcreatedevent_setcontrol(wxSheetEditorCreatedEvent & event, wxWindow * control) {
	event.SetControl(control);
}

	
// *********************************************

MaxSheetBlock * bmx_wxsheetrangeselectevent_getblock(wxSheetRangeSelectEvent & event) {
	return new MaxSheetBlock(event.GetBlock());
}

bool bmx_wxsheetrangeselectevent_getaddtoselection(wxSheetRangeSelectEvent & event) {
	return event.GetAddToSelection();
}

void bmx_wxsheetrangeselectevent_setblock(wxSheetRangeSelectEvent & event, MaxSheetBlock * block) {
	event.SetBlock(block->Block());
}


// *********************************************

int bmx_wxsheetcellsizeevent_getsize(wxSheetCellSizeEvent & event) {
	return event.GetSize();
}



// *********************************************

int bmx_wxsheet_geteventtype(int type) {
	switch(type) {
		case 15920: return wxEVT_SHEET_VIEW_CHANGED;
		case 15921: return wxEVT_SHEET_SELECTING_CELL;
		case 15922: return wxEVT_SHEET_SELECTED_CELL;
		case 15800: return wxEVT_SHEET_CELL_LEFT_DOWN;
		case 15810: return wxEVT_SHEET_CELL_RIGHT_DOWN;
		case 15801: return wxEVT_SHEET_CELL_LEFT_UP;
		case 15811: return wxEVT_SHEET_CELL_RIGHT_UP;
		case 15820: return wxEVT_SHEET_CELL_LEFT_DCLICK;
		case 15830: return wxEVT_SHEET_CELL_RIGHT_DCLICK;
		case 15840: return wxEVT_SHEET_LABEL_LEFT_DOWN;
		case 15850: return wxEVT_SHEET_LABEL_RIGHT_DOWN;
		case 15841: return wxEVT_SHEET_LABEL_LEFT_UP;
		case 15851: return wxEVT_SHEET_LABEL_RIGHT_UP;
		case 15860: return wxEVT_SHEET_LABEL_LEFT_DCLICK;
		case 15870: return wxEVT_SHEET_LABEL_RIGHT_DCLICK;
		case 15880: return wxEVT_SHEET_ROW_SIZE;
		case 15881: return wxEVT_SHEET_ROW_SIZING;
		case 15882: return wxEVT_SHEET_ROW_SIZED;
		case 15890: return wxEVT_SHEET_COL_SIZE;
		case 15891: return wxEVT_SHEET_COL_SIZING;
		case 15892: return wxEVT_SHEET_COL_SIZED;
		case 15900: return wxEVT_SHEET_RANGE_SELECTING;
		case 15901: return wxEVT_SHEET_RANGE_SELECTED;
		case 15910: return wxEVT_SHEET_CELL_VALUE_CHANGING;
		case 15911: return wxEVT_SHEET_CELL_VALUE_CHANGED;
		case 15930: return wxEVT_SHEET_EDITOR_ENABLED;
		case 15940: return wxEVT_SHEET_EDITOR_DISABLED;
		case 15950: return wxEVT_SHEET_EDITOR_CREATED;
		case 1800: return wxEVT_SHEET_SPLIT_BEGIN;
		case 1801: return wxEVT_SHEET_SPLIT_CHANGING;
		case 1802: return wxEVT_SHEET_SPLIT_CHANGED;
		case 1803: return wxEVT_SHEET_SPLIT_DOUBLECLICKED;
		case 1804: return wxEVT_SHEET_SPLIT_UNSPLIT;
		case 1805: return wxEVT_SHEET_SPLIT_CREATE_SHEET;
	}
	
	return 0;
}

