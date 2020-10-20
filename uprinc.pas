unit Uprinc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ActnList, ExtCtrls, Buttons, Grids;

type

  { TForm1 }

  {ToDo -oCezar -cAnalizar 10: desenvolver  4 funções dividas em
         função de verificação de entrada de dados(exercicios)
         função para gerar de numeros aleatorios(exercicios)
         função que ira gerar os exercicios(relatorios, Grid)
                função ue ira verificar as exceções dos algoritimos ex verificação de divisão por 0
         função para gerar os relatorios em pdf(impressão)
         função que ira popular o grid
         Opcional (Função para alimentar um banco de dados para armazenar os exercicios)
  Lembrado que este projeto inicial e somente para as 4 operações basicas não fugir disso!!

  }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckGroup1: TCheckGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PageControl1: TPageControl;
    ProgressBar1: TProgressBar;
    RadioGroup1: TRadioGroup;
    StringGrid1: TStringGrid;
    TabSheet1: TTabSheet;
    TrackBar1: TTrackBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.frm}

{ TForm1 }

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin

end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  {Todo -oCezar -cDev 5: Este barra deve informar a quantiodade de exercicios a serem gerados limite de 100  exercicios e minimo de 1
         So deve gerar se a operação foi selecionada e se a precisão tambem foi selecionada e dividir a quantidade de
         exercicios pelo numero de operações selecionadas exemplo se tiver + e - selecionado dividir a quantidade de
         exercicios por 2 e assim por diante
  }
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label2.Visible:=true;
  ProgressBar1.Visible:=True;
  BitBtn1.Visible:=False;
 // ToDo -oCezar -cDev 3: Este botao deve executar as 4 operações basica deacordo com o minimo selecionado nas caixas de operações.
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // ToDo -oCezar -cDev 3: Este botão deve limpar os campos de seleção
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  // ToDo -oCezar -cDev 3: Este botão deve cancelar a operação se precionado
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  //ToDo -oCezar -cDev 3: Este botão deve gerar um pdf apos os exercicios serem gerados
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin

end;

procedure TForm1.CheckGroup1Click(Sender: TObject);
begin

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Label2.Visible:=False;
  ProgressBar1.Visible:=False;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

end.

