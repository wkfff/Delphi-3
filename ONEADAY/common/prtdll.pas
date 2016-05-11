unit prtdll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TPI_Thread = class(TThread)
    procedure Execute; override;
end;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Edit2: TEdit;
    Button9: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Function bar_Open(D_Name,baud:String):boolean;stdcall; external 'BarPrt.dll' name 'ComOpen';
  procedure Set_CRC(i:Integer);stdcall; external 'BarPrt.dll' name 'Set_CRC';
  Function GetPiSts(piid:Integer):Boolean;stdcall; external 'BarPrt.dll' name 'GetPiSts';
  Function Send_PI(Pi_Id,Floor :Integer;  pidata : String):Boolean; stdcall; external 'BarPrt.dll' name 'Send_PI'

//  Function GetPiSts(sPosChk:String):Boolean;stdcall; external 'BarPrt.dll' name 'GetPiSts';
  Function Write(Write_Data : array of byte;Data_len : integer):Integer; stdcall; external 'BarPrt.dll' name 'Write';
  Function read(var Write_Data : Array of byte; Data_len : Integer):Integer; stdcall; external 'BarPrt.dll' name 'read';
  Function Write_Str(Write_Data : String;Data_len : integer):Integer; stdcall; external 'BarPrt.dll' name 'Write_Str';
  Function read_Str(var Write_Data : String; Data_len : Integer):Integer; stdcall; external 'BarPrt.dll' name 'read_Str';
  Function Z4M_prt: boolean; stdcall; external 'BarPrt.dll' name 'Z4M_prt';
  Function hangulZpl(Txt: string; Xpos, Ypos, Xaxis, Yaxis :integer; Rotation : Boolean) : string;stdcall; external 'BarPrt.dll' name 'hangulZpl';
  Function RTS(State: boolean): boolean; stdcall; external 'BarPrt.dll' name 'RTS';
  Function bar_Close:integer; stdcall; external 'BarPrt.dll' name 'Close';



var
  Form1: TForm1;
  PI_Thread  : TPI_Thread;

implementation

{$R *.dfm}
procedure TPI_Thread.Execute;
Begin
    While (Not Terminated) Do Begin
        //Try
         //

         Application.ProcessMessages;
         Sleep(200);

        //Except
        //에러
        //end;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  S : String;
  i : Integer;
begin
   // If Send_PI(6,1,'1'+'000000')=false Then
  //  begin
  //     ShowMessage('err');
  //  end;
  //  getPiSts('000111',s);
   // If getPiSts('1111',s)=True then
   // Begin
    //end ;
    edit1.Text :=s;
    Exit;
    For i:= 1 to 10 Do Begin
       if Z4M_prt then
       begin
       S :=     '^XA';                                                     //인쇄 Format의 시작 (Open)       S := S + '~SD18';                                                   //프린터 명암조정 (DARKNESS : 0 ~ 30)
//       S := S + '^LL408';                                                //라벨의 길이 정의 3.4Cm (12 * 34)
       S := S + '^LH0,0';                                                  //인쇄기준점 Set, 80 : 1Cm
       S := S + '^PO^FS';                                                  //인쇄방지정 (현재 정방향기준)
       S := S + '^PRC^FS';                                                 //인쇄속도 A : 50.8mm/Sec
       S := s + '^MD18^FS';                                               //HEAD의 인쇄온도 (15 ~ 30)
       // 내용 인쇄 시작

//        S := S + '^FD' + hangulzpl('연습ABCDEFGHI',20,200,1,1,false)+'^FS';
        S := S + '^FO100,100^A0,40,30^FD' + '1234569898' + '^FS';

//       S := S + '^FO10,20^BY2,1,,^BCN,100,N,N^FD' + '12345' + '^FS';    //128
//       S := S + '^FO10,20^BY2,1,,^B3N,N,100,N,N^FD' + '12345' + '^FS';  //39
         S := S + '^FO10,20^BY3,1,,^B2N,100,N,N^FD' + '12345' + '^FS';    //itf : BTN

       S := S + '^PQ1';                                                           //인쇄수량
       S := S + '^XZ';                                                              //인쇄 Format의 끝   (End)



//       WriteLn(Lst, s);
       Write_Str(S,Length(s));
       end;
    End;
    Sleep(100);
    bar_Close;
//    CloseFile(Lst);


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    PI_Thread := TPI_Thread.Create(False);
    PI_Thread.Execute;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    Set_CRC(1);
   if bar_open('COM5','19200')=false then
   begin
     showMessage('에러');
   end;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
    //점멸
    //piid,단,모드,data
    Send_PI(6,1,'1'+'123456');

end;


procedure TForm1.Button5Click(Sender: TObject);
begin
  bar_Close;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
    If GetPiSts(6)=True Then
       ShowMessage('d');
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
    //소등
    //piid,단,모드,data
    Send_PI(6,1,'2'+'123456');

end;

procedure TForm1.Button8Click(Sender: TObject);
begin
    //점등
    //piid,단,모드,data
    Send_PI(6,1,'0'+'123456');

end;

procedure TForm1.Button9Click(Sender: TObject);
begin
    If getPiSts(strtoint(Edit2.Text))=False then Begin
        ShowMessage('on');
    End;
end;

end.
