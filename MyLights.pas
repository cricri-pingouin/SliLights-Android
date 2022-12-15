unit MyLights;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls.Presentation,
  FMX.Objects, FMX.StdCtrls, FMX.Forms, FMX.Controls;

  type
  THeaderFooterForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    btnRestart: TButton;
    lblLevel: TLabel;
    trbarLevel: TTrackBar;
    btnRandom: TButton;
    lblRandom: TLabel;
    trbarRandom: TTrackBar;
    btnExit: TButton;
    //Rectangle clicks
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    Rectangle19: TRectangle;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    Rectangle23: TRectangle;
    Rectangle24: TRectangle;
    Rectangle25: TRectangle;
    //*********
    procedure CheckWin;
    procedure ClearAll;
    procedure RestartLevel;
    procedure Invert(Index: Integer);
    procedure Press(Index: Integer);
    procedure UserPress(Index: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btnRestartClick(Sender: TObject);
    procedure trbarLevelChange(Sender: TObject);
    procedure btnRandomClick(Sender: TObject);
    procedure trbarRandomChange(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    //Rectangle clicks
    procedure Rectangle1Click(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Rectangle4Click(Sender: TObject);
    procedure Rectangle5Click(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
    procedure Rectangle7Click(Sender: TObject);
    procedure Rectangle8Click(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
    procedure Rectangle10Click(Sender: TObject);
    procedure Rectangle11Click(Sender: TObject);
    procedure Rectangle12Click(Sender: TObject);
    procedure Rectangle13Click(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
    procedure Rectangle15Click(Sender: TObject);
    procedure Rectangle16Click(Sender: TObject);
    procedure Rectangle17Click(Sender: TObject);
    procedure Rectangle18Click(Sender: TObject);
    procedure Rectangle19Click(Sender: TObject);
    procedure Rectangle20Click(Sender: TObject);
    procedure Rectangle21Click(Sender: TObject);
    procedure Rectangle22Click(Sender: TObject);
    procedure Rectangle23Click(Sender: TObject);
    procedure Rectangle24Click(Sender: TObject);
    procedure Rectangle25Click(Sender: TObject);
    //*********
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  Level = array[0..4] of Integer;
  Levels = array[0..99] of Level;

var
  HeaderFooterForm: THeaderFooterForm;
  Lights: array[0..24] of Boolean;
  WinGame, IsRandom: Boolean;
  Clicks, RandomDefault, CurrentLevel: Integer;
  ColourOn, ColourOff: Int64;

const
  TheseLevels: Levels = ((0, 0, 21, 0, 0), (21, 21, 0, 21, 21), (10, 27, 27, 27, 10), (0, 27, 0, 17, 27), (15, 23, 23, 24, 27), (0, 0, 21, 21, 14), (15, 17, 17, 17, 15), (0, 4, 10, 21, 10), (10, 31, 14, 26, 7), (14, 14, 14, 0, 0), (21, 21, 21, 21, 14), (31, 10, 27, 14, 10), (8, 20, 10, 5, 2), (0, 0, 2, 2, 2), (0, 2, 0, 2, 0), (1, 1, 1, 1, 31), (0, 0, 4, 14, 31), (4, 10, 21, 10, 4), (21, 0, 21, 0, 21), (0, 0, 17, 0, 0), (30, 2, 14, 2, 2), (14, 17, 17, 17, 14), (0, 0, 28, 12, 4), (0, 0, 17, 31, 18), (1, 3, 7,
    15, 30), (17, 17, 31, 17, 17), (4, 14, 4, 4, 4), (0, 0, 28, 28, 28), (0, 2, 0, 0, 0), (0, 0, 4, 0, 0), (17, 19, 21, 25, 17), (31, 8, 4, 2, 31), (8, 8, 21, 17, 25), (20, 17, 17, 22, 30), (24, 10, 17, 21, 0), (4, 10, 17, 31, 17), (0, 14, 14, 14, 0), (21, 10, 21, 10, 21), (10, 1, 3, 12, 10), (0, 0, 10, 0, 0), (17, 10, 4, 4, 4), (7, 9, 7, 9, 7), (17, 11, 7, 2, 14), (0, 27, 31, 4, 14), (14, 5, 28, 15, 21), (4, 14, 31, 14, 4), (4, 31, 5, 18, 16), (0, 17, 4, 17, 0), (17, 10, 4, 10, 17), (31, 31, 31, 31, 31), (27,
    0, 27, 0, 27), (31, 4, 0, 4, 31), (31, 10, 4, 10, 31), (10, 17, 0, 27, 17), (4, 6, 27, 12, 4), (10, 31, 21, 31, 10), (21, 17, 27, 17, 21), (0, 0, 14, 2, 0), (16, 8, 4, 6, 5), (0, 21, 17, 21, 17), (31, 14, 14, 14, 31), (17, 10, 0, 10, 17), (14, 10, 14, 8, 14), (15, 9, 15, 7, 9), (21, 21, 21, 21, 14), (14, 2, 14, 8, 14), (31, 17, 21, 17, 31), (21, 0, 21, 0, 21), (10, 21, 14, 21, 10), (21, 0, 0, 0, 21), (31, 29, 27, 23, 31), (31, 4, 31, 17, 17), (27, 10, 27, 10, 27), (4, 10, 31, 17, 31), (17, 27, 21, 17,
    17), (31, 21, 31, 21, 31), (14, 4, 4, 4, 14), (14, 10, 31, 14, 27), (0, 0, 4, 0, 0), (17, 0, 4, 0, 17), (27, 27, 0, 27, 27), (10, 0, 17, 14, 4), (21, 14, 27, 14, 21), (17, 19, 21, 25, 17), (21, 21, 27, 21, 21), (4, 4, 14, 21, 21), (21, 21, 21, 21, 31), (0, 14, 14, 14, 0), (4, 10, 17, 31, 17), (21, 10, 21, 10, 21), (17, 14, 10, 14, 17), (4, 10, 17, 10, 4), (21, 0, 10, 0, 21), (10, 31, 10, 31, 10), (31, 21, 31, 29, 31), (17, 10, 4, 10, 17), (31, 4, 31, 4, 31), (31, 14, 4, 14, 31), (4, 21, 31, 21, 4), (31, 31, 31, 31, 31));

implementation

{$R *.fmx}

//Game

procedure THeaderFooterForm.CheckWin;
var
  i: Integer;
begin
  WinGame := True;
  for i := 0 to 24 do
    if Lights[i] then
      begin
        WinGame := False;
        Break;
      end;
  Inc(Clicks);
  if isRandom then
    HeaderLabel.Text := 'Random level, Click(s): ' + IntToStr(Clicks)
  else
    HeaderLabel.Text := 'Level: ' + IntToStr(CurrentLevel) + ', Click(s): ' + IntToStr(Clicks);
  if WinGame then
  begin
    if IsRandom then
      RestartLevel()
    else
      begin
        if CurrentLevel < 100 then
          inc(CurrentLevel);
        trbarLevel.Value := CurrentLevel;
        RestartLevel();
      end;
  end;
end;

procedure THeaderFooterForm.ClearAll;
var
  i: Integer;
  component: TComponent;
begin
  for i := 0 to 24 do
    Lights[i] := False;
  for component in HeaderFooterForm do
    if (component is TRectangle) then
      TRectangle(component).Fill.Color := ColourOff;
  WinGame := False;
  Clicks := 0;
end;

procedure THeaderFooterForm.RestartLevel;
var
  Row, Col: Integer;
begin
  ClearAll();
  for Row := 0 to 4 do
    for Col := 0 to 4 do
      if (TheseLevels[CurrentLevel - 1][Row] and (1 shl Col)) = (1 shl Col) then
        Invert(Row * 5 + Col);
  IsRandom := False;
  HeaderLabel.Text := 'Level: ' + IntToStr(CurrentLevel) + ', Click(s): 0';
end;

procedure THeaderFooterForm.Invert(Index: Integer);
var
  LightColour, i: Integer;
  component: TComponent;
begin
  Lights[Index] := not Lights[Index];
  if Lights[Index] then
    LightColour := ColourOn
  else
    LightColour := ColourOff;
  i := 0;
  for component in HeaderFooterForm do
    if (component is TRectangle) then
      begin
        if (Index = i) then
          begin
            TRectangle(component).Fill.Color := LightColour;
            Break;
          end;
        Inc(i);
      end;
end;

procedure THeaderFooterForm.Press(Index: Integer);
begin
  Invert(Index);
  if Index > 4 then
    Invert(Index - 5);
  if Index < 20 then
    Invert(Index + 5);
  if (Index mod 5) <> 0 then
    Invert(Index - 1);
  if (Index mod 5) <> 4 then
    Invert(Index + 1);
end;

procedure THeaderFooterForm.UserPress(Index: Integer);
begin
  Press(Index);
  CheckWin;
end;

//Form

procedure THeaderFooterForm.FormCreate(Sender: TObject);
begin
  ColourOn := $FFE761DD;
  ColourOff := $FF670A71;
  CurrentLevel := Round(trbarLevel.Value);
  RandomDefault := Round(trbarRandom.Value);
  lblRandom.Text := 'Random click(s): ' + IntToStr(RandomDefault);
  RestartLevel();
end;

//Controls

procedure THeaderFooterForm.btnRestartClick(Sender: TObject);
begin
  RestartLevel();
end;

procedure THeaderFooterForm.btnRandomClick(Sender: TObject);
var
  i: Integer;
begin
  ClearAll();
  Randomize;
  for i := 1 to RandomDefault do
    Press(Random(25));
  HeaderLabel.Text := 'Random level, Click(s): 0';
  IsRandom := True;
end;

procedure THeaderFooterForm.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure THeaderFooterForm.trbarRandomChange(Sender: TObject);
begin
  RandomDefault := Round(trbarRandom.Value);
  lblRandom.Text := 'Random click(s): ' + IntToStr(RandomDefault);
end;

procedure THeaderFooterForm.trbarLevelChange(Sender: TObject);
begin
  CurrentLevel := Round(trbarLevel.Value);
  lblLevel.Text := 'Level: ' + IntToStr(CurrentLevel);
end;

//Rectangle clicks

procedure THeaderFooterForm.Rectangle1Click(Sender: TObject);
begin
UserPress(0);
end;

procedure THeaderFooterForm.Rectangle2Click(Sender: TObject);
begin
  UserPress(1);
end;

procedure THeaderFooterForm.Rectangle3Click(Sender: TObject);
begin
  UserPress(2);
end;

procedure THeaderFooterForm.Rectangle4Click(Sender: TObject);
begin
  UserPress(3);
end;

procedure THeaderFooterForm.Rectangle5Click(Sender: TObject);
begin
  UserPress(4);
end;

procedure THeaderFooterForm.Rectangle6Click(Sender: TObject);
begin
  UserPress(5);
end;

procedure THeaderFooterForm.Rectangle7Click(Sender: TObject);
begin
  UserPress(6);
end;

procedure THeaderFooterForm.Rectangle8Click(Sender: TObject);
begin
  UserPress(7);
end;

procedure THeaderFooterForm.Rectangle9Click(Sender: TObject);
begin
  UserPress(8);
end;

procedure THeaderFooterForm.Rectangle10Click(Sender: TObject);
begin
  UserPress(9);
end;

procedure THeaderFooterForm.Rectangle11Click(Sender: TObject);
begin
  UserPress(10);
end;

procedure THeaderFooterForm.Rectangle12Click(Sender: TObject);
begin
  UserPress(11);
end;

procedure THeaderFooterForm.Rectangle13Click(Sender: TObject);
begin
  UserPress(12);
end;

procedure THeaderFooterForm.Rectangle14Click(Sender: TObject);
begin
  UserPress(13);
end;

procedure THeaderFooterForm.Rectangle15Click(Sender: TObject);
begin
  UserPress(14);
end;

procedure THeaderFooterForm.Rectangle16Click(Sender: TObject);
begin
  UserPress(15);
end;

procedure THeaderFooterForm.Rectangle17Click(Sender: TObject);
begin
  UserPress(16);
end;

procedure THeaderFooterForm.Rectangle18Click(Sender: TObject);
begin
  UserPress(17);
end;

procedure THeaderFooterForm.Rectangle19Click(Sender: TObject);
begin
  UserPress(18);
end;

procedure THeaderFooterForm.Rectangle20Click(Sender: TObject);
begin
  UserPress(19);
end;

procedure THeaderFooterForm.Rectangle21Click(Sender: TObject);
begin
  UserPress(20);
end;

procedure THeaderFooterForm.Rectangle22Click(Sender: TObject);
begin
  UserPress(21);
end;

procedure THeaderFooterForm.Rectangle23Click(Sender: TObject);
begin
  UserPress(22);
end;

procedure THeaderFooterForm.Rectangle24Click(Sender: TObject);
begin
  UserPress(23);
end;

procedure THeaderFooterForm.Rectangle25Click(Sender: TObject);
begin
  UserPress(24);
end;

end.
