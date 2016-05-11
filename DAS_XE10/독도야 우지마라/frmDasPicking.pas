unit frmDasPicking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, RxGIF;

type
  TForm1 = class(TForm)
    Label3: TLabel;
    Label68: TLabel;
    dtPicker: TDateTimePicker;
    edtCatno: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtKancode: TEdit;
    Label10: TLabel;
    edtUnit: TEdit;
    Image1: TImage;
    prgStatus: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    LWorkerUnit1: TLabel;
    LWorkerUnit2: TLabel;
    LWorkerUnit1_qty: TLabel;
    LWorkerUnit2_qty: TLabel;
    RWorkerUnit1: TLabel;
    RWorkerUnit2: TLabel;
    RWorkerUnit1_qty: TLabel;
    RWorkerUnit2_qty: TLabel;
    TotalUnit1: TLabel;
    TotalUnit2: TLabel;
    TotalUnit1_qty: TLabel;
    TotalUnit2_qty: TLabel;
    N_L_1: TImage;
    W_L_1: TImage;
    F_L_1: TImage;
    lbL1_1Cust: TLabel;
    lbL1_1Cell: TLabel;
    lbL1_1Unit1: TLabel;
    lbL1_1Unit2: TLabel;
    lbL1_1Unit1_qty: TLabel;
    lbL1_1Unit2_qty: TLabel;
    Image2: TImage;
    Image3: TImage;
    N_L_2: TImage;
    Image5: TImage;
    W_L_2: TImage;
    F_L_2: TImage;
    lbL1_2Cust: TLabel;
    lbL1_2Unit1: TLabel;
    lbL1_2Unit1_qty: TLabel;
    lbL1_2Unit2_qty: TLabel;
    lbL1_2Unit2: TLabel;
    lbL1_2Cell: TLabel;
    N_L_3: TImage;
    W_L_3: TImage;
    F_L_3: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
