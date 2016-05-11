object fmAbout: TfmAbout
  Left = 192
  Top = 114
  Width = 347
  Height = 358
  BorderIcons = [biSystemMenu]
  Caption = #51221#48372
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object pnlNORMAL: TPanel
    Left = 10
    Top = 10
    Width = 314
    Height = 267
    Alignment = taLeftJustify
    BevelOuter = bvNone
    TabOrder = 0
    object pnlNORTEXT: TPanel
      Left = 3
      Top = 4
      Width = 111
      Height = 25
      BevelInner = bvLowered
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pcSYSTEM: TPageControl
      Left = 3
      Top = 32
      Width = 311
      Height = 235
      ActivePage = tsDEVLOPER
      TabIndex = 1
      TabOrder = 1
      object tsSYSTEM: TTabSheet
        Caption = #49884#49828#53596' '#51221#48372
        object lblCORP: TLabel
          Left = 8
          Top = 16
          Width = 68
          Height = 12
          Caption = #54924'   '#49324'   '#47749' :'
        end
        object lblPJNAME: TLabel
          Left = 8
          Top = 40
          Width = 68
          Height = 12
          Caption = #54532#47196#51229#53944#47749' :'
        end
        object lblVERSION: TLabel
          Left = 8
          Top = 64
          Width = 68
          Height = 12
          Caption = #48260'         '#51204' :'
        end
        object lblEDTDATE: TLabel
          Left = 8
          Top = 88
          Width = 68
          Height = 12
          Caption = #49688' '#51221' '#51068' '#51088' :'
        end
        object lblLOGOIMG: TLabel
          Left = 8
          Top = 112
          Width = 68
          Height = 12
          Caption = #54924' '#49324' '#47196' '#44256' :'
        end
        object lblLBLIMG: TLabel
          Left = 8
          Top = 136
          Width = 68
          Height = 12
          Caption = #46972' '#48296' '#44536' '#47548' :'
        end
        object lblCOPYRIGHT: TLabel
          Left = 8
          Top = 184
          Width = 66
          Height = 12
          Caption = 'Copyright  :'
        end
        object lblICON: TLabel
          Left = 8
          Top = 160
          Width = 68
          Height = 12
          Caption = #50500'   '#51060'   '#53080' :'
        end
        object edtCORP: TEdit
          Left = 84
          Top = 12
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 0
        end
        object edtPJNAME: TEdit
          Left = 84
          Top = 36
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 1
        end
        object edtVERSION: TEdit
          Left = 84
          Top = 60
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 2
        end
        object edtEDTDATE: TEdit
          Left = 84
          Top = 84
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 3
        end
        object edtLOGOIMG: TEdit
          Left = 84
          Top = 108
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 4
        end
        object edtLBLIMG: TEdit
          Left = 84
          Top = 132
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 5
        end
        object edtCOPYRIGHT: TEdit
          Left = 84
          Top = 180
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 7
        end
        object edtICON: TEdit
          Left = 84
          Top = 156
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 6
        end
      end
      object tsDEVLOPER: TTabSheet
        Caption = #44060#48156' '#51221#48372
        ImageIndex = 1
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 68
          Height = 12
          Caption = #54532#47196#44536#47000#47672' :'
        end
        object Label2: TLabel
          Left = 8
          Top = 40
          Width = 53
          Height = 12
          Caption = #50868#50689' OS :'
        end
        object Label3: TLabel
          Left = 8
          Top = 64
          Width = 56
          Height = 12
          Caption = #49444#52824#50948#52824' :'
        end
        object Label4: TLabel
          Left = 8
          Top = 88
          Width = 44
          Height = 12
          Caption = #51228#51089#53812' :'
        end
        object Edit1: TEdit
          Left = 84
          Top = 12
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 0
          Text = 'PTS '#49324#50629#48512
        end
        object Edit2: TEdit
          Left = 84
          Top = 36
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 1
          Text = #50952#46020#50864'98/2000/XP'
        end
        object Edit3: TEdit
          Left = 84
          Top = 60
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 2
        end
        object Edit4: TEdit
          Left = 84
          Top = 84
          Width = 209
          Height = 20
          Enabled = False
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 3
          Text = 'Delphi 6.0'
        end
      end
    end
  end
  object btnOK: TButton
    Left = 235
    Top = 288
    Width = 89
    Height = 25
    Caption = #54869#51064'(&O)'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnClick = btnOKClick
  end
end
