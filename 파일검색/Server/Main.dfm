�
 TRECVFORM 0�  TPF0	TRecvFormRecvFormLeft�Top� BorderIconsbiSystemMenu
biMinimize BorderStylebsSingleCaption;Server: MsgCommunicator Demo. (c) 2004-2009 AidAim SoftwareClientHeightuClientWidthaColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel8LeftKTop� Width0HeightCaption
LocalPort:  TPageControlPagesLeft Top WidthaHeightu
ActivePageControlAlignalClientTabOrder 
OnChangingPagesChanging 	TTabSheetControlCaptionControl TLabelLabel6Left[TopWidth3HeightCaption
LocalHost:  TLabelLabel9Left� TopWidth0HeightCaption
LocalPort:  TLabelLabel11Left TopWidth0HeightCaption
ServerID:   TButtonServerStartLeft"TopWidth}HeightCaptionStartTabOrder OnClickServerStartClick  TButton
ServerStopLeft� TopWidth}HeightCaptionStopTabOrderOnClickServerStopClick  TEdit	LocalPortLeftTopWidth%HeightTabOrder  	TRichEditServerSettingsLeftTop;WidthXHeightFont.CharsetHANGEUL_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	
ScrollBars
ssVerticalTabOrderZoomd  TEdit	LocalHostLeft� TopWidthIHeightTabOrder  TEditServerIDLeft.TopWidthHeightTabOrder  TButtonButton1Left"Top:Width� HeightCaption   ���Ɛ��0�T�TabOrderOnClickButton1Click  TButtonButton2Left� Top:Width[HeightCaptionFor TestTabOrderOnClickButton2Click   	TTabSheetUsersCaptionUsers
ImageIndex TLabelLabel5LeftTopGWidth$HeightCaptionUserID:  TLabel	UserCountLeftTopWidthHeightCaptionUsers:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameDefault
Font.PitchfpFixed
Font.Style 
ParentFont  TLabelOnLineCountLeftTopWidth%HeightCaptionOnLine:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameDefault
Font.PitchfpFixed
Font.Style 
ParentFont  TLabel
GuestCountLeftTop0Width(HeightCaptionGuests: Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameDefault
Font.PitchfpFixed
Font.Style 
ParentFont  TStringGrid
sgAllUsersLeftTopEWidthSHeight�ColCountDefaultRowHeight	FixedCols RowCount	FixedRows OptionsgoFixedVertLinegoFixedHorzLine
goVertLine
goHorzLinegoRangeSelectgoColSizing TabOrder OnSelectCellsgAllUsersSelectCell	ColWidths
7dK   TEditSelectedUserIDLeftGTopCWidth;HeightTabOrder  TButton
DeleteUserLeft� TopCWidthOHeightCaptionDeleteTabOrderOnClickDeleteUserClick  TButtonDisconnectUserLeft� TopCWidthOHeightCaption
DisconnectTabOrderOnClickDisconnectUserClick  	TGroupBox	GroupBox1Left� Top Width� Height?CaptionUpdateTabOrder TLabelLabel7Left� TopWidthHeightCaptionmsec  	TCheckBox	cbOnTimerLeftTopWidth4HeightCaptionTimerChecked	State	cbCheckedTabOrder   	TCheckBoxcbConnectedLeftTopWidthTHeightCaption	ConnectedTabOrder  	TCheckBoxcbLoggedLeftTop,WidthPHeightCaptionLoggedTabOrder  	TCheckBoxcbRegistrationLeft[TopWidthOHeightCaptionRegistrationTabOrder  	TCheckBoxcbInfoChangedLeft[Top,WidthTHeightCaptionInfo changedTabOrder  TEditIntervalLeft:TopWidthOHeightAutoSizeBiDiModebdLeftToRightParentBiDiModeTabOrderText5000OnChangeIntervalChange    	TTabSheetSendCaptionSend
ImageIndex TLabelLabel10LeftTopWidthIHeightCaptionEnter message:  TLabelLabel2LeftTopWWidthUHeightCaptionConnected Users:  TLabelLabel3Left� TopWWidth$HeightCaptionUserID:  TStringGridsgConnectedUsersLeftTopfWidthHeight�ColCountDefaultRowHeight	FixedCols RowCount	FixedRows OptionsgoFixedVertLinegoFixedHorzLine
goVertLine
goHorzLinegoRangeSelectgoColSizing TabOrder OnSelectCellsgConnectedUsersSelectCell	ColWidths*�    TButton
ServerSendLeft Top� Width6HeightCaptionSendTabOrderOnClickServerSendClick  TEdit
ServerToIDLeft TopfWidth6HeightTabOrder  	TRichEdit	ServerMsgLeftTopWidthSHeightCFont.CharsetHANGEUL_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Lines.StringsHi User,I'm Server! 
ParentFont
ScrollBars
ssVerticalTabOrderZoomd   	TTabSheetIncomingCaptionIncoming
ImageIndex TLabelLabel1Left TopWidth� HeightCaption#Messages being sent to this server:  	TRichEditServerIncomingLeft�TopWidthZHeightGFont.CharsetHANGEUL_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	
ScrollBars
ssVerticalTabOrder Zoomd   	TTabSheetSentCaptionSent
ImageIndex TLabelLabel4Left TopWidth� HeightCaption%Messages being sent from this server:  	TRichEdit
ServerSentLeft�TopWidthZHeightGFont.CharsetHANGEUL_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	
ScrollBars
ssVerticalTabOrder Zoomd    
TMsgServer
MsgServer1CurrentVersion8.00 OnReceiveTextMessageMsgServer1ReceiveTextMessageOnReceiveUnicodeTextMessage#MsgServer1ReceiveUnicodeTextMessageMaxConnectionsActiveConfigFileNameMsgServer.iniDataPath.\Data\ConnectionParams.LocalPort�.-ConnectionParams.CryptoParams.CryptoAlgorithmcraNone(ConnectionParams.CryptoParams.CryptoModeacmCTS%ConnectionParams.CryptoParams.KeySize8&ConnectionParams.CryptoParams.PasswordMsgpassword+ConnectionParams.CryptoParams.UseInitVector,ConnectionParams.CryptoParams.InitVectorSize AfterServerStartMsgServer1AfterServerStartBeforeServerStopMsgServer1BeforeServerStopAfterConnectMsgServer1AfterConnectAfterDisconnectMsgServer1AfterDisconnectBeforeDisconnectMsgServer1BeforeDisconnectServerID StoreMessageHistory		MinUserIDUseConfigFileOnUserRegisteredMsgServer1UserRegisteredOnUserInfoChangedMsgServer1UserInfoChangedOnUserLogonMsgServer1UserLogonOnUserLogoffMsgServer1UserLogoffLeft(Top�   TTimerTimer1EnabledInterval�OnTimerTimer1TimerLeft,Top�   	TUniQueryuqryVDI
ConnectionDM_ORACLE.UniConnection1Left,Topx  
TFtpServer
FtpServer1	IcsLogger
IcsLogger1Addr0.0.0.0SocketFamilysfIPv4Port30003ListenBackLogMultiListenSockets Banner220 ICS FTP Server ready.UserData 
MaxClients PasvPortRangeStart PasvPortRangeSize OptionsftpsCwdCheckftpsCdupHomeftpsSiteXmlsd MD5UseThreadFileSize TimeoutSecsLogin<TimeoutSecsIdle TimeoutSecsXfer ZlibMinLevelZlibMaxLevel	ZlibNoCompExt:.zip;.rar;.7z;.cab;.lzh;.gz;.avi;.wmv;.mpg;.mp3;.jpg;.png;AlloExtraSpace@B ZlibMinSpace���ZlibMaxSize e�CodePage LanguageEN*MaxAttemptsBandwidthLimit BandwidthSampling�Left,Top  TWSocketWSocket1LineMode	LineEnd
Addr0.0.0.0Port30001Prototcp	LocalAddr0.0.0.0
LocalAddr6::	LocalPort0KeepAliveOnOffwsKeepAliveOnSystem
SocksLevel5ComponentOptions OnSessionAvailableWSocket1SessionAvailableLeft,TopH  
TIcsLogger
IcsLogger1TimeStampFormatStringhh:nn:ss:zzzTimeStampSeparator LogFileOption	lfoAppendLogFileEncodinglfeUtf8LogFileName.\Ftplog.log
LogOptions Left� Top   