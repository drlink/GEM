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
    CheckBox1: TCheckBox;
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

    procedure CheckGroup1ItemClick(Sender: TObject; Index: integer);
    procedure FormShow(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup1SelectionChanged(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private

         function Calcula(Termo1:Integer; Termo2:Integer; Termo3:Integer):integer;
         function VerificaItens():Integer;

         procedure Limpacampos;


  public

  end;

var
  Form1: TForm1;
  SinalOp:Integer;
  QtdOp:Integer;
  PresiOp:Integer;

implementation

{$R *.frm}

//ToDo -oCezar 7: Funções
//==================================================================================================================

function TForm1.VerificaItens():Integer;
var
 count:Integer;
begin
  count:=0;

    // se CheckGroup1 indice 'x' for verdadeiro
    if CheckGroup1.Checked[0] or CheckGroup1.Checked[1] or CheckGroup1.Checked[2] or CheckGroup1.Checked[3] then
       begin
          count:=1
       end;


    // se radioGrup1 ItemIndex 'x' for verdadeiro
    if (RadioGroup1.ItemIndex = 0) or (RadioGroup1.ItemIndex = 1) then
       begin
          count:=count + 1;
       end ;


    // se trackBar1 position for diferente de 0
    if TrackBar1.Position <> 0 then
       begin
          count:=count + 1;
       end;


    //retorno
    if count <> 0 then
       begin
         //ShowMessage(IntToStr(count));
         Result:=count;
       end
    else
       begin
         Result:=0;
       end;



end;

//==================================================================================================================
 //Acresentar mais uma variavel para ler a quantidade de linhas
 //Acresentar a verificação de quais operações devemos executar estraindo do array
function TForm1.Calcula(Termo1:Integer; Termo2:Integer; Termo3:Integer):Integer;
var  //ToDo: Função Calcula
  ter1, ter2, Quant, num1, num2, i, verf, r1 :Integer;
  fnum1, fnum2, fr1 :Real;

begin

    verf:=VerificaItens();
     ter1:= Termo1;
     ter2:= Termo2;
    Quant:=Termo3;
    CheckBox1.Visible:=True;
    //StringGrid1.AutoSizeColumn(1);
    //StringGrid1.AutoSizeColumn(2);
    //StringGrid1.AutoSizeColumn(3);

    StringGrid1.RowCount:=Quant +1; // quantidade de linhas



    if verf = 3 then
       begin
           case (ter1) of

                1:begin
                       If ter2 = 1 then
                          begin
                                 for i:=1 to Quant do
                                     begin
                                          num1:=Random(200);
                                          num2:=Random(200);
                                          r1:=num1 + num2;
                                          StringGrid1.Cells[0,i]:=IntToStr(i);
                                          StringGrid1.Cells[1,i]:=IntToStr(num1)+' +';
                                          StringGrid1.Cells[2,i]:=IntToStr(num2)+'=';
                                          StringGrid1.Cells[3,i]:=IntToStr(r1);
                                          StringGrid1.Cells[4,i]:='???';
                                     end;
                          end
                       else
                          begin
                                 for i:=1 to Quant do
                                     begin
                                          fnum1:=Random(200) * 0.11;
                                          fnum2:=Random(200) * 0.10;
                                          fr1:=fnum1 + fnum2;
                                          StringGrid1.Cells[0,i]:=IntToStr(i);
                                          StringGrid1.Cells[1,i]:=FloatToStr(fnum1)+' +';
                                          StringGrid1.Cells[2,i]:=FloatToStr(fnum2)+'=';
                                          StringGrid1.Cells[3,i]:=FloatToStr(fr1);
                                          StringGrid1.Cells[4,i]:='???';
                                     end;
                          end;
                  end;

                2:begin
                       If ter2 = 1 then
                          begin
                                 for i:=1 to Quant do
                                     begin
                                          num1:=Random(200);
                                          num2:=Random(200);
                                          r1:=num1 - num2;
                                          StringGrid1.Cells[0,i]:=IntToStr(i);
                                          StringGrid1.Cells[1,i]:=IntToStr(num1)+' -';
                                          StringGrid1.Cells[2,i]:=IntToStr(num2)+'=';
                                          StringGrid1.Cells[3,i]:=IntToStr(r1);
                                          StringGrid1.Cells[4,i]:='???';
                                     end;
                          end
                       else
                          begin
                                 for i:=1 to Quant do
                                     begin
                                          fnum1:=Random(200) * 0.11;
                                          fnum2:=Random(200) * 0.10;
                                          fr1:=fnum1 - fnum2;
                                          StringGrid1.Cells[0,i]:=IntToStr(i);
                                          StringGrid1.Cells[1,i]:=FloatToStr(fnum1)+' -';
                                          StringGrid1.Cells[2,i]:=FloatToStr(fnum2)+'=';
                                          StringGrid1.Cells[3,i]:=FloatToStr(fr1);
                                          StringGrid1.Cells[4,i]:='???';
                                     end;
                          end;
                  end;

                3:begin
                       If ter2 = 1 then
                          begin
                                 for i:=1 to Quant do
                                     begin
                                          num1:=Random(200);
                                          num2:=Random(200);
                                          r1:=num1 * num2;
                                          StringGrid1.Cells[0,i]:=IntToStr(i);
                                          StringGrid1.Cells[1,i]:=IntToStr(num1)+' *';
                                          StringGrid1.Cells[2,i]:=IntToStr(num2)+'=';
                                          StringGrid1.Cells[3,i]:=IntToStr(r1);
                                          StringGrid1.Cells[4,i]:='???';
                                     end;
                          end
                       else
                          begin
                                 for i:=1 to Quant do
                                     begin
                                          fnum1:=Random(200) * 0.11;
                                          fnum2:=Random(200) * 0.10;
                                          fr1:=fnum1 * fnum2;
                                          StringGrid1.Cells[0,i]:=IntToStr(i);
                                          StringGrid1.Cells[1,i]:=FloatToStr(fnum1)+' *';
                                          StringGrid1.Cells[2,i]:=FloatToStr(fnum2)+'=';
                                          StringGrid1.Cells[3,i]:=FloatToStr(fr1);
                                          StringGrid1.Cells[4,i]:='???';
                                     end;
                          end;
                  end;

                4:begin
                       If ter2 = 1 then
                          begin
                                 for i:=1 to Quant do
                                     begin
                                          num1:=Random(200) * 3;
                                          num2:=Random(50);
                                          if (num2 = 0)then
                                             num2:= num2 +50;

                                          r1:= num1 div num2;
                                          if (r1 <= 0) then
                                             begin
                                               num1:=Random(400) * 3;
                                               num2:=Random(80);
                                               r1:= num1 div num2;


                                               //Calcula(ter1,ter2,QtdOp);
                                             end;

                                          StringGrid1.Cells[0,i]:=IntToStr(i);
                                          StringGrid1.Cells[1,i]:=IntToStr(num1)+' /';
                                          StringGrid1.Cells[2,i]:=IntToStr(num2)+'=';
                                          StringGrid1.Cells[3,i]:=IntToStr(r1);
                                          StringGrid1.Cells[4,i]:='???';
                                     end;
                          end
                       else
                          begin
                                 for i:=1 to Quant do
                                     begin
                                          fnum1:=Random(200) * 2.30;
                                          fnum2:=Random(200) * 0.10;
                                          if (Fnum1 = 0.0) then
                                             begin
                                               fnum1:=Random(200) * 3;
                                             end;
                                          fr1:=fnum1 / fnum2;

                                          StringGrid1.Cells[0,i]:=IntToStr(i);
                                          StringGrid1.Cells[1,i]:=FloatToStr(fnum1)+' /';
                                          StringGrid1.Cells[2,i]:=FloatToStr(fnum2)+'=';
                                          StringGrid1.Cells[3,i]:=FloatToStr(fr1);
                                          StringGrid1.Cells[4,i]:='???';
                                     end;
                          end;
                  end;




           end;


       end
    else
       begin
            ShowMessage('Selecioine as opções acima para gerar os exercicios');
       end;

 Result:=0;

end;



//=================================================================================================================

//=================================================================================================================
//Todo -oCezar 7: Procedimentos

procedure TForm1.Limpacampos;
begin
 // ToDo: Limpa Campos
     if VerificaItens() <> 0 then
        begin

             CheckGroup1.Checked[0]:=False;
             CheckGroup1.Checked[1]:=False;
             CheckGroup1.Checked[2]:=False;
             CheckGroup1.Checked[3]:=False;
             RadioGroup1.ItemIndex:=-1;
             TrackBar1.Position:=0;
             StringGrid1.Clean;
             CheckBox1.Visible:=False;


        end
     else
        begin
             ShowMessage('Não existe operação, precisão ou quantidade selecionados. Pressione OK e Selecione as 3 opções de acordo com suas necessidades');
             CheckGroup1.SetFocus;
        end;


 end;

{ TForm1 }

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin

end;

procedure TForm1.RadioGroup1SelectionChanged(Sender: TObject);
begin

  if RadioGroup1.ItemIndex = 0 then
     begin
          PresiOp:=1;
          //ShowMessage(IntToStr(PresiOp)+' inteiro');
     end
  else
     begin
          PresiOp:=2;
     end;

  if RadioGroup1.ItemIndex = 1 then
     begin
          PresiOp:=2;
          //ShowMessage(IntToStr(PresiOp)+' Decimal');
     end
  else
     begin
          PresiOp:=1;
     end;

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
  IF(CheckBox1.Checked)then
     begin
          StringGrid1.Columns.Items[3].Visible:=False;
          StringGrid1.Columns.Items[2].Visible:=True;
     end
  else
      begin
          StringGrid1.Columns.Items[3].Visible:=True;
          StringGrid1.Columns.Items[2].Visible:=False;
      end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  a:Integer;
begin
   a:= TrackBar1.Position;
  Calcula(QtdOp, PresiOp, a);
 // ToDo -oCezar -cDev 3: Este botao deve executar as 4 operações basica deacordo com o minimo selecionado nas caixas de operações.
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // ToDo -oCezar -cDev 3: Este botão deve limpar os campos de seleção
  Limpacampos;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  // ToDo -oCezar -cDev 3: Este botão deve cancelar a operação se precionado
  Close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  //ToDo -oCezar -cDev 3: Este botão deve gerar um pdf apos os exercicios serem gerados
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin

end;


procedure TForm1.CheckGroup1ItemClick(Sender: TObject; Index: integer);
begin
  //ToDo:Seleção de operação
  if CheckGroup1.Checked[0] then
     begin
         QtdOp:=1;
         //ShowMessage(IntToStr(QtdOp[0])+' '+IntToStr(QtdOp[1])+' '+IntToStr(QtdOp[2])+' '+IntToStr(QtdOp[3])+' mais');
     end;

  if CheckGroup1.Checked[1] then
     begin
          QtdOp:=2;
     end;

  if CheckGroup1.Checked[2] then
     begin
          QtdOp:=3;
     end;

  if CheckGroup1.Checked[3] then
     begin
          QtdOp:=4;
     end;




end;

procedure TForm1.FormShow(Sender: TObject);
begin
  //Todo: OnShow Uprinc inicialização
  Label2.Visible:=False;
  ProgressBar1.Visible:=False;
  BitBtn1.Visible:=False ;
  StringGrid1.Columns.Items[2].Visible:=False;
  CheckBox1.Visible:=False;


end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

end.

