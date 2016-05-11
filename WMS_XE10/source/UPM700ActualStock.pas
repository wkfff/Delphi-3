unit UPM700ActualStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables, ComCtrls, MaskUtils, AdvObj;

const
  prt_Cnt=12;    //����Ʈ ���� ����

type
  TFPM700ActualStock = class(TForm)
    qryOpen: TQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Msk_In_Dt: TDateTimePicker;
    Label2: TLabel;
    Mak_Location_From: TMaskEdit;
    Label14: TLabel;
    Mak_Location_To: TMaskEdit;
    Button2: TButton;
    Button4: TButton;
    cbAll: TCheckBox;
    Pgbar: TProgressBar;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure edCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }    

    gcMGridAlign : Array[0..27] of Char;   //�׸��� ��� ��ġ ����;
    gcSGridAlign : Array[0..16] of Char;   //�׸��� ��� ��ġ ����;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
    
    Procedure Prt_Title(aPNo : integer );
    Procedure Prt_init;
  public
    { Public declarations }
  end;
      
  TPrint=record
    PTitle:Array[0..prt_Cnt] of  string; //�ʵ� ��
    PLoc: Array[0..prt_Cnt]  of  Char;   //�ʵ� Ÿ��
    PSize:Array[0..prt_Cnt]  of  Integer;//�ʵ� ũ��
    PData:Array[0..prt_Cnt]  of  String; //�ʵ� ���� �ڷ�
    PFont:Array[0..prt_Cnt]  of  Integer;//�ʵ� ���� �ڷ�
  end;
var
  FPM700ActualStock: TFPM700ActualStock;
  prt : Tprint;

implementation

uses UDM, ULib, UOneADay, UQMain, Com_Print;

{$R *.dfm}

procedure TFPM700ActualStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM700ActualStock.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM700ActualStock.FormCreate(Sender: TObject);
begin
  If  gChForm <> (Sender As TForm) Then gChForm := (Sender As TForm);
    
  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;
  
  Msk_In_Dt.Date := now;

  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM700ActualStock.edCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFPM700ActualStock.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender); 
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM700ActualStock.FormDestroy(Sender: TObject);
begin
  FPM700ActualStock := nil;
end;

procedure TFPM700ActualStock.pr_Clear;
begin

end;

procedure TFPM700ActualStock.pr_Grid_Init;
begin
end;

procedure TFPM700ActualStock.pr_qryOpen;
begin        
  
  with qryOpen do try
    Close;
    Open;

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFPM700ActualStock.pr_Ready;
begin

end;

procedure TFPM700ActualStock.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    If ARow = 0 Then VAlign := vtaCenter
    Else Begin
       Case gcMGridAlign[ACol] Of
          'C' :  HAlign := taCenter;       //no
          'R' :  HAlign := taRightJustify;       //����
          'L' :  HAlign := taLeftJustify;  //����
       End;
    End;
end;

procedure TFPM700ActualStock.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM700ActualStock ,'FPM700ActualStock');
end;

procedure TFPM700ActualStock.Button1Click(Sender: TObject);
begin
//
end;

procedure TFPM700ActualStock.Button2Click(Sender: TObject);
var
  Tot,r1,r2,r3,r4 : Real;
  pNo,P_Width     : Integer;
  R_cnt           : Integer;
  SAV_lOC,sSql, sItem_Code :String;
begin

    if cbAll.Checked then begin
       if Mak_Location_From.Text = '' then Mak_Location_From.Text := 'A00000';
       if Mak_Location_To.Text = ''   then Mak_Location_To.Text   := 'Z99999';
       if Mak_Location_From.Text > Mak_Location_To.Text then begin
          ShowMessage('From�� To���� Ů�ϴ�..');
          Exit;
       end;
    end;

    R_cnt :=0;    
    Pgbar.Visible := True;
    pNo   :=1;
    With qryOpen do begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT substring(a.LOC_CODE,1,1)+''-''+substring(a.LOC_CODE,2,2)+''-''+substring(a.LOC_CODE,4,2)+''-''+substring(a.LOC_CODE,6,1) LOC_CODE'+
              '       ,CATNO                     '+
              '       ,b.ITEM_NAME               '+
              '       ,cast(b.qty as varchar(8)) + ''/''+ qty_unit ORDER_UNIT '+
              '       ,LOC_GUBUN                 '+
              '       ,a.QTY                     '+
              '       ,QTY_EA                    '+
              '   FROM PM700 a                   '+
              '   JOIN MT300 b                   '+
              '     ON a.ITEM_CODE = b.ITEM_CODE '+
              '  WHERE a.QTY > 0                 ');
      if not cbAll.Checked then begin
        SQL.Add(' AND LOC_CODE BETWEEN :LOC_CODE1 AND :LOC_CODE2 ');
        Params[0].Value := FormatMaskText('0-00-00-0;0', Mak_Location_From.Text);
        Params[1].Value := FormatMaskText('0-00-00-0;0', Mak_Location_To.Text);
      end;
      Open;

      r1 :=0;
      r2 :=0;
      r3 :=0;
      r4 :=0;
      tot:=0;  
      Pgbar.Max := RecordCount;

      if (Eof) then begin
        ShowMessage('����� �ڷᰡ �����ϴ�!!!');
        Exit;
      end;
      Prt_init;
      Prt_Title(pNo);
      Sav_Loc := '';
      while(Not eof) do begin
        inc(R_cnt);             
        Pgbar.Position := R_cnt;
                   
        r2 := r2 + FieldByName('QTY').AsInteger;
        prt.PData [0]:=FormatMaskText('L\-99\-99\-9;1;_',Fieldbyname('LOC_CODE').Asstring); // '�����̼�;
        prt.PData [1]:=Fieldbyname('CATNO').AsString;                                       //
        prt.PData [2]:=Fieldbyname('ITEM_NAME').AsString;                                   // 'ITEM ��';
        prt.PData [3]:=Fieldbyname('ORDER_UNIT').AsString;                                  //
        prt.PData [4]:=FormatFloat(',##0', FieldByName('QTY').AsFloat);                     // '������;
        prt.PData [5]:=FormatFloat(',##0', FieldByName('QTY_EA').AsFloat);                  //
        prt.PData [6]:=Fieldbyname('LOC_GUBUN').AsString;                                   //

        if (Pag_Height - 120 <  prt_Row) then
        begin
           Print_Draw_Line(0,pag_width,12);
           Print_Next_Page;
           inc(pNo);
           Prt_Title(pNo);
        end;

        Print_Draw_new_Body(11,[],'����ü', prt.PSize,prt.PData,prt.PLoc);
        Next;
      end;

      //�հ��߰�
      //---------------------------------------------------------------------//
      Print_New_Line(0,pag_width,7);
      prt.PData [0]:='';
      prt.PData [1]:='';
      prt.PData [2]:='[��   ��]';
      prt.PData [3]:='';
      prt.PData [4]:='';
      prt.PData [5]:='';
      prt.PData [6]:=FormatFloat(',##0', r2);
      prt.PData [7]:='';
      prt.PData [8]:='';
      prt.PData [9]:='';
      prt.PData [10]:='';
      prt.PData [11]:='';
      Print_Draw_new_Body(11,[],'����ü', prt.PSize,prt.PData,prt.PLoc);
      Print_New_Line(0,pag_width,7);
      //---------------------------------------------------------------------//
      //prt.PData [0]:='';
      //prt.PData [1]:='';
      //prt.PData [2]:='[ TOTAL ]  ' + FormatFloat(',##0', TOT);
      //prt.PData [3]:='';
      //prt.PData [4]:='';
      //prt.PData [5]:='';
      //prt.PData [6]:='';
      //prt.PData [7]:='';
      //prt.PData [8]:='';
      //prt.PData [9]:='';
      //prt.PData [10]:='';
      //Print_Draw_new_Body(11,[],'����ü', prt.PSize,prt.PData,prt.PLoc);
      //Print_New_Line(0,pag_width,7);
      //---------------------------------------------------------------------//
      Prt_Row :=Pag_Height - 120;
      Print_Draw_Line(0,pag_width,11);
      Print_Draw_Close;
      If ( R_Cnt > 1 ) Then ShowMessage( IntToStr(R_Cnt)+'���� ��µǾ����ϴ�.!!!') ;
    end;
    Pgbar.Visible := False;
end;

procedure TFPM700ActualStock.Prt_init;
begin

    with prt do begin
      PLoc[0] := 'C';  PSize[0]  := 06;   PTitle[0]  := 'Location';         PFont[0]:=13;
      PLoc[1] := 'C';  PSize[1]  := 06;   PTitle[1]  := 'CAT. NO.';         PFont[1]:=0;
      PLoc[2] := 'L';  PSize[2]  := 20;   PTitle[2]  := '�� ǰ ��';         PFont[2]:=0;
      PLoc[3] := 'C';  PSize[3]  := 06;   PTitle[3]  := '������';         PFont[3]:=0;
      PLoc[4] := 'R';  PSize[4]  := 10;   PTitle[4]  := '������';         PFont[4]:=13;
      PLoc[5] := 'R';  PSize[5]  := 10;   PTitle[5]  := '������ȯ�����'; PFont[5]:=13;
      PLoc[6] := 'C';  PSize[6]  := 06;   PTitle[6]  := '�����̼Ǳ���';     PFont[6]:=0;
      Print_Draw_new_Init(PSize, 1);
      Print_Draw_open;
    end;
end;

procedure TFPM700ActualStock.Prt_Title(aPNo: integer);
begin
    with prt do begin
      prt_Row:=0;
      Print_Draw_Main_Title(14,[],'����ü','���ǻ系��');
      Set_Print_Font(10,[],'����ü');
      Print_Draw_Sub_Title(2,2,1000,'�ۼ��ð� : ' + FormatDateTime('hh:nn:ss', Time));
      Print_Draw_Sub_Title(1,2,10,'�ǻ�  ���� : ' + FormatDateTime('YYYY-MM-DD', Msk_In_Dt.DateTime));
      Print_Draw_Sub_Title(2,2,1000,'  ������ : ' + inttostr(aPNo));
      Print_Draw_New_Head(1,11,'����ü',[],psize,PTitle,ploc);
    end;
end;

end.
