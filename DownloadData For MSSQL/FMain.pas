unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, AdvPanel, AdvSplitter,
  AdvMemo, DBAdvMemo, AdvmSQLS, Vcl.Menus, AdvMenus, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, DBAdvGrid, Vcl.StdCtrls, AeroButtons, AdvOfficeStatusBar,
  Data.DB, DateUtils, sSkinProvider, sSkinManager, Vcl.Mask, AdvSmoothEdit,
  AdvSmoothEditButton, AdvSmoothDatePicker, AdvLabel;

type
  TMainForm = class(TForm)
    AdvPanelStyler1: TAdvPanelStyler;
    AdvPanel1: TAdvPanel;
    DBAdvGrid1: TDBAdvGrid;
    AdvSplitter1: TAdvSplitter;
    AdvSQLMemoStyler1: TAdvSQLMemoStyler;
    AdvMainMenu1: TAdvMainMenu;
    V1: TMenuItem;
    N1: TMenuItem;
    AdvMenuStyler1: TAdvMenuStyler;
    AdvPanel2: TAdvPanel;
    AdvPanel3: TAdvPanel;
    AdvPanel4: TAdvPanel;
    AdvSplitter2: TAdvSplitter;
    AeroBitBtn1: TAeroBitBtn;
    AeroBitBtn2: TAeroBitBtn;
    AeroBitBtn3: TAeroBitBtn;
    AdvMemo1: TAdvMemo;
    AdvOfficeStatusBar1: TAdvOfficeStatusBar;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    AdvPanel5: TAdvPanel;
    AdvSmoothDatePicker1: TAdvSmoothDatePicker;
    AdvSmoothDatePicker2: TAdvSmoothDatePicker;
    AdvLabel1: TAdvLabel;
    AdvLabel2: TAdvLabel;
    procedure FormShow(Sender: TObject);
    procedure AeroBitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AeroBitBtn3Click(Sender: TObject);
    procedure AeroBitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure AdvMemo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure Init;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses UDM, FQueries, UVersionInfo;

{$R *.dfm}

procedure TMainForm.AdvMemo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
    AeroBitBtn1.Click
  else if Key = VK_ESCAPE then
    Close;
end;

procedure TMainForm.AeroBitBtn1Click(Sender: TObject);
begin
  if Trim(AdvMemo1.Lines.Text) = '' then
  begin
    ShowMessage('쿼리를 입력하세요!');
    Exit;
  end;

  Init;

  with DM.UniQuery1 do
  begin
    SQL.Text.Empty;
    Close;

    SQL.Text := AdvMemo1.Lines.Text;

    Open;
  end;

  DBAdvGrid1.AutoSize := True;
  AdvOfficeStatusBar1.Panels[0].Text := IntToStr(DM.UniQuery1.RecordCount) + '건이 조회 되었습니다';
end;

procedure TMainForm.AeroBitBtn2Click(Sender: TObject);
var
  Form_Query : TQueryForm;
begin
//  AdvMemo1.Lines.Text := 'select * from pd120 where i_date > ' + QuotedStr(DateToStr(Today));

  Form_Query := TQueryForm.Create(Application);
  Form_Query.Top := MainForm.Top;
  Form_Query.Left := MainForm.Left + MainForm.Width;
  Form_Query.Width := 400;
  Form_Query.Height := 210;
  if Form_Query.ShowModal = mrOk then
    AdvMemo1.Lines.Text := Form_Query.selQuery + ' where i_date between ' + QuotedStr(DateToStr(AdvSmoothDatePicker1.Date)) + ' and ' + QuotedStr(DateToStr(AdvSmoothDatePicker2.Date));
  Form_Query.Free;
end;

procedure TMainForm.AeroBitBtn3Click(Sender: TObject);
var
  tbName, sqlInsert, sqlInsertValues : string;
  sqlInsertList, errList : TStringList;
  i, j, succCnt : Integer;
begin
  if (DBAdvGrid1.RowCount < 2) or (Trim(DBAdvGrid1.Cells[1,1])  = '') then
  begin
    ShowMessage('조회를 먼저 실행하세요!');
    Exit;
  end;

  sqlInsertList := TStringList.Create;
  errList := TStringList.Create;
  sqlInsert := '';
  sqlInsertValues := '';
  succCnt := 0;

  tbName := Trim(copy(AdvMemo1.Lines.Text, Pos('from',AdvMemo1.Lines.Text) + 4, Pos('where',AdvMemo1.Lines.Text) - (Pos('from',AdvMemo1.Lines.Text) + 4)));

  sqlInsert := 'INSERT INTO ' + tbName + ' (';

  for i := 1 to DBAdvGrid1.Columns.Count - 1 do
  begin
    sqlInsert := sqlInsert + DBAdvGrid1.Columns[i].FieldName;

    if i = DBAdvGrid1.Columns.Count - 1 then
      sqlInsert := sqlInsert + ') values ('
    else
      sqlInsert := sqlInsert + ', ';
  end;

  for j := 1 to DBAdvGrid1.RowCount - 1 do
  begin
    sqlInsertValues := '';

    for i := 1 to DBAdvGrid1.Columns.Count - 1 do
    begin
      if TField(DBAdvGrid1.FieldAtColumn[i]).DataType = ftString then
        sqlInsertValues := sqlInsertValues + QuotedStr(DBAdvGrid1.Cells[i,j])
      else
      begin
        if Trim(DBAdvGrid1.Cells[i,j]) = '' then
          sqlInsertValues := sqlInsertValues + 'null'
        else
          sqlInsertValues := sqlInsertValues + DBAdvGrid1.Cells[i,j];
      end;

      if i <> DBAdvGrid1.Columns.Count - 1 then
        sqlInsertValues := sqlInsertValues + ', ';
    end;

    sqlInsertValues := sqlInsert + sqlInsertValues + ')';
    sqlInsertList.Add(sqlInsertValues);
  end;

  AdvMemo1.Lines.Text := sqlInsertList.Text;

//  for i := 0 to sqlInsertList.Count - 1 do
//  begin
//    try
//      with DM.UniQuery2 do
//      begin
//        SQL.Text.Empty;
//        Close;
//
//        SQL.Text := sqlInsertList.Strings[i];
//        ExecSQL;
//      end;
//
//      succCnt := succCnt + 1;
//    except
//      errList.Add(sqlInsertList.Strings[i]);
//    end;

//  end;

//  AdvMemo1.Lines.Text := errList.Text;
  AdvOfficeStatusBar1.Panels[0].Text := IntToStr(succCnt) + '건이 입력 되었습니다';

  sqlInsertList.Destroy;
  errList.Destroy;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  DM.UniQuery1.Close;
  DM.UniQuery2.Close;

  DM.UniConnection1.Disconnect;
  DM.UniConnection2.Disconnect;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
//  DM.fn_SetDBConnect;

  Init;

  Caption := Caption + ' ' + fnGetVersionInfo(tvFileVersion);
end;

procedure TMainForm.Init;
begin
  DM.ClearSql;

  DBAdvGrid1.ClearColumnHeaders;
  DBAdvGrid1.ClearAll;

  AdvSmoothDatePicker1.Date := Today - 1;
  AdvSmoothDatePicker2.Date := Today;

  AdvOfficeStatusBar1.Panels[0].Text := '';
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  Init;
end;


end.
