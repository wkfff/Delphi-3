unit UQMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBBlankFrm, Menus, StdCtrls, Buttons, ExtCtrls, IdBaseComponent,
  IdComponent, IdIPWatch, TFlatButtonUnit, TFlatPanelUnit, jpeg, Dbtables,
  ComCtrls, AdvGrid;

type
  TFQMain = class(TFBBlankFrm)
    MainMenu1: TMainMenu;
    C1: TMenuItem;
    H1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N3: TMenuItem;
    N11: TMenuItem;
    About1: TMenuItem;
    N14: TMenuItem;
    Timer1: TTimer;
    Timer2: TTimer;
    sbMsg: TStatusBar;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SSD100: TSpeedButton;
    SSD200: TSpeedButton;
    SSD300: TSpeedButton;
    SSD400: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Image21: TImage;
    N7: TMenuItem;
    N9: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N4: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    KPI1: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    Image2: TImage;
    N28: TMenuItem;
    N29: TMenuItem;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure fbtnClick(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FlatButton11Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
  private
    { Private declarations } 
    FClientInstance : TFarProc;
    FPrevClientProc : TFarProc;

    procedure ClientWndProc(var Message: TMessage);
    function  fn_ChildCount(): boolean;//자식윈도우 최대 열수 있는 갯수
  public
    { Public declarations } 
    giloginHandle : Integer;
    function  fn_ChildShow(tChild_Name :TComponentClass;  sChild_Name:String):Boolean; //자식윈도우를 찾아서 보여줌
  end;

const
  giCnt = 10;  //mdi창 관리 10 개이상 뛰울수 없슴

var
  FQMain: TFQMain;

implementation

uses ULib, UIItem, UUser,
  UAbout, UDM, USM200Exp, USM200, USM100Exp,
  USM100, USD130Exp, USD130, UOneADay, USD220, USD220Reg, USM200Stock,
  UDash, USM200Month, USM200Cust, UBarcodePrint, USD110;

{$R *.dfm}  
{$R XPTheme.RES}
{$WARN   SYMBOL_DEPRECATED   OFF}

procedure TFQMain.FormDestroy(Sender: TObject);
begin
  inherited;
  FQMain := nil;
end;

procedure TFQMain.FormCreate(Sender: TObject);
  function fn_GetName:String;
  begin
    with DM.qryOpen do try
      Close;
      SQL.Clear;
      SQL.Add(' select name from MT100  '+
              '  where userid = :userid ');
      Params[0].AsString := gsUserID;
      Open;
      if not IsEmpty then begin
        Result := Fields[0].AsString;
      end;
    except
       on E:EDBEngineError do begin
          Application.MessageBox(PChar('ERROR :'+E.Message), 'ERROR', MB_OK);
          Exit;
       end;
    end;
  end;
begin
  inherited;
  Caption        := Caption;

  //lblVersion.Caption := 'Version '+gsVersion;
  sbMsg.Panels[2].Text := '아이디 : '+ gsUserID;
  sbMsg.Panels[3].Text := '사용자 : '+ fn_GetName;


  
  FClientInstance := MakeObjectInstance(ClientWndProc);
  FPrevClientProc := Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC));
  SetWindowLong(ClientHandle, GWL_WNDPROC, LongInt(FClientInstance));
end;

procedure TFQMain.N3Click(Sender: TObject);
begin

  fn_ChildShow(TFIItem ,'FIItem');

  //Application.CreateForm(TFIItem, FIItem);
  //FIItem.Show;

  //FIItem := TFIItem.Create(Self);
  //FIItem.ShowModal;
end;

procedure TFQMain.N5Click(Sender: TObject);
begin
  fn_ChildShow(TFUser ,'FUser');

  //Application.CreateForm(TFUser, FUser);
  //FUser.Show;
end;

procedure TFQMain.fbtnClick(Sender: TObject);
begin
  fn_ChildShow(TFSM200Exp ,'FSM200Exp');

  //Application.CreateForm(TFSM200Exp, FSM200Exp);
  //FSM200Exp.Show;
end;

procedure TFQMain.FlatButton1Click(Sender: TObject);
begin
  fn_ChildShow(TFSM200, 'FSM200');

  //Application.CreateForm(TFSM200, FSM200);
  //FSM200.Show;
end;

procedure TFQMain.Timer1Timer(Sender: TObject);
begin
  gsNowDate        := formatdatetime('YYYY-MM-DD', now);
  
  sbMsg.Panels[1].Text := '일자:'+gsNowDate;
  gsNowDateTime    := formatdatetime('YYYY-MM-DD HH:MM:SS', now);
  gsNowDateShort   := Copy(formatdatetime('YYYYMMDD', now),3,6); 
end;

procedure TFQMain.About1Click(Sender: TObject);
begin
  FAbout := TFAbout.Create(Self);
  FAbout.ShowModal;
end;

procedure TFQMain.FlatButton11Click(Sender: TObject);
begin
  Close;
end;

procedure TFQMain.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled  := False;
  fn_ChildShow(TFDash, 'FDash');
end;

procedure TFQMain.SpeedButton6Click(Sender: TObject);
begin
  Close;
end;

procedure TFQMain.N9Click(Sender: TObject);
begin
  fn_ChildShow(TFSM100Exp, 'FSM100Exp');

end;

procedure TFQMain.N17Click(Sender: TObject);
begin
  fn_ChildShow(TFSM100, 'FSM100');
end;

procedure TFQMain.N10Click(Sender: TObject);
begin
  fn_ChildShow(TFSD130Exp, 'FSD130Exp');
end;

procedure TFQMain.ClientWndProc(var Message: TMessage);
var
    Dc  : hDC;
    Row : Integer;  Col : Integer;
    iHeight : Integer;
    iWidth  : Integer;
begin
    with Message do
       case Msg of
          WM_ERASEBKGND:
          begin
            Dc := TWMEraseBkGnd(Message).Dc;
            for Row := 0 to ClientHeight div Image2.Picture.Height do
              for Col := 0 to ClientWidth div Image2.Picture.Width do
                BitBlt(Dc,
                       Col * Image2.Picture.Width,
                       Row * Image2.Picture.Height,
                       Image2.Picture.Width,
                       Image2.Picture.Height,
                       Image2.Picture.Bitmap.Canvas.Handle,
                       0,
                       0,
                       SRCCOPY);
                Result := 1;
          end;
          else
            Result := CallWindowProc(FPrevClientProc,
                                     ClientHandle,
                                     Msg,
                                     wParam,
                                     lParam);
          end;
                     {
    if Image2 =nil then exit;
    iHeight := ClientHeight div Image2.Picture.Height;
    iWidth  := ClientWidth div Image2.Picture.Width;
    with Message do begin
       case Msg of
          WM_ERASEBKGND:
             Begin
               Dc := TWMEraseBkGnd(Message).Dc;
               For Row := 0 To iHeight Do
                 For Col := 0 to  iWidth  Do
                   BitBlt(Dc,
                          Col * Image2.Picture.Width,
                          Row * Image2.Picture.Height,
                          Image2.Picture.Width,
                          Image2.Picture.Height,
                          //Image2.Picture.Bitmap.Canvas.Handle,
                          Image2.Canvas.Handle,
                          0,
                          0,
                          SRCCOPY);
               Result := 1;
             End;
          Else
            Result := CallWindowProc(FPrevClientProc,
                                     ClientHandle,
                                     Msg,
                                     wParam,
                                     lParam);     
       End;   //end case...
    end;   //end with...          }
end;

function TFQMain.fn_ChildCount: boolean;
begin
    {
    if MdiChildCount = giCnt then begin
       ShowMessage('더이상 창을 열수없습니다.!!!');
       Result := False;
    end
    else
       Result := True;
       }
end;

function TFQMain.fn_ChildShow(tChild_Name: TComponentClass;
  sChild_Name: String): Boolean;
    procedure pr_Ch_From;
    Begin
        If MdiChildCount > 0 Then Begin
           If gChForm <> ActiveMDIChild Then Begin
             gChForm := ActiveMDIChild;
           End;   //end if...
        End;   //end if...
    End;
Var
    i : Integer;
begin
    Result := False;
    For i := 0 to MdiChildCount - 1 do begin
       If UpperCase(MdiChildren[i].Name) = UpperCase(sChild_Name) then begin
         {lock the control}   
          pr_WinControlTitleSetting(MdiChildren[i]);
          MdiChildren[i].Show;
          Result := False;
          Exit;
       End;   //end if...
    End;   //end for...

    If fn_ChildCount() = False then exit; //폼갯수 ->10개
    Perform (WM_SetRedraw, 0, 0);

    //CATS서버 접속 여부체크...
    //proc_Connect_Chk();

    //20021007 백민하 프로그램에서 처리했으므로 필요없어 삭제
    Application.CreateForm(tChild_Name, gChForm);
    //tChild_Name.Create(Application);
    {do you thing ... then unlock the control}
    Perform (WM_SetRedraw, 1, 0);
    RedrawWindow(Handle, nil, 0, RDW_FRAME + RDW_INVALIDATE +
                                      RDW_ALLCHILDREN + RDW_NOINTERNALPAINT);

    Result := True;
end;

procedure TFQMain.N12Click(Sender: TObject);
begin
  fn_ChildShow(TFSD130, 'FSD130');
end;

procedure TFQMain.N22Click(Sender: TObject);
begin
  Cascade;
end;

procedure TFQMain.N23Click(Sender: TObject);
begin 
  TileMode := tbHorizontal;
  Tile; 
end;

procedure TFQMain.N24Click(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TFQMain.N15Click(Sender: TObject);
begin  
  fn_ChildShow(TFSD220Reg, 'FSD220Reg');
end;

procedure TFQMain.N18Click(Sender: TObject);
begin
  fn_ChildShow(TFSD220, 'FSD220');
end;

procedure TFQMain.N20Click(Sender: TObject);
begin
  fn_ChildShow(TFSM200Stock, 'FSM200Stock');

end;

procedure TFQMain.N25Click(Sender: TObject);
begin
  fn_ChildShow(TFSM200Month, 'FSM200Month');
end;

procedure TFQMain.N27Click(Sender: TObject);
begin
  fn_ChildShow(TFSM200Cust, 'FSM200Cust');
end;

procedure TFQMain.N2Click(Sender: TObject);
begin
  fn_ChildShow(TFBarcodePrint, 'FBarcodePrint');
end;

procedure TFQMain.N16Click(Sender: TObject);
begin
  fn_ChildShow(TFSD110, 'FSD110');
end;

end.
