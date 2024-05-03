unit uclientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ActnList,
  DBCtrls;

type

  { TFRMclientes }

  TFRMclientes = class(TForm)
    BTsair: TButton;
    BTprocurar: TButton;
    BTlimpar: TButton;
    BTatualizar: TButton;
    Excluir: TButton;
    confirmar: TButton;
    DSclientes: TDataSource;
    TDprocurar: TEdit;
    Label1: TLabel;
    TDnome: TEdit;
    TDendereco: TEdit;
    TDemail: TEdit;
    TDtelefone: TEdit;
    titulo: TLabel;
    nome: TLabel;
    endereco: TLabel;
    email: TLabel;
    telefone: TLabel;
    procedure BTatualizarClick(Sender: TObject);
    procedure BTsairClick(Sender: TObject);
    procedure BTprocurarClick(Sender: TObject);
    procedure BTlimparClick(Sender: TObject);
    procedure confirmarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure TDemailChange(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private

  public

  end;

var
  FRMclientes: TFRMclientes;

implementation

{$R *.lfm}

uses uDM;

{ TFRMclientes }

procedure TFRMclientes.confirmarClick(Sender: TObject);
var
  ultimoID: Integer;
begin
  if TDnome.Text = '' then
  begin
    ShowMessage('Informe o campo Nome!');
    TDnome.SetFocus;
    Exit;
  end;

  if TDendereco.Text = '' then
  begin
    ShowMessage('Informe o campo Endereço!');
    TDendereco.SetFocus;
    Exit;
  end;

  if TDemail.Text = '' then
  begin
    ShowMessage('Informe o campo Email!');
    TDemail.SetFocus;
    Exit;
  end;

  if TDtelefone.Text = '' then
  begin
    ShowMessage('Informe o campo Telefone!');
    TDtelefone.SetFocus;
    Exit;
  end;

  // Confirmação para criar uma nova conta
  if MessageDlg('Tem certeza que deseja criar uma nova conta?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     // Confirmação das informações
     if MessageDlg('As informações estão corretas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
          // Verifica se há registros existentes
          if not DM.ZQclientes.IsEmpty then
          begin
               ultimoID := DM.ZQclientes.Fields[0].AsInteger;
               ShowMessage('O último ID inserido foi: ' + IntToStr(ultimoID));
          end
          else
          begin
               // Insere novo registro
               DM.ZQclientes.Close;
               DM.ZQclientes.SQL.Clear;
               DM.ZQclientes.SQL.Add('insert into clientes (nome, endereco, email, telefone)');
               DM.ZQclientes.SQL.Add('values (:nome, :endereco, :email, :telefone)');
               DM.ZQclientes.ParamByName('nome').AsString := TDnome.Text;
               DM.ZQclientes.ParamByName('endereco').AsString := TDendereco.Text;
               DM.ZQclientes.ParamByName('email').AsString := TDemail.Text;
               DM.ZQclientes.ParamByName('telefone').AsString := TDtelefone.Text;
               DM.ZQclientes.ExecSQL;
          end;
      end;
    end;
  end;


procedure TFRMclientes.ExcluirClick(Sender: TObject);
begin
  if MessageDlg('Desejá excluir o registro?', mtWarning,[mbyes,mbno],0)= mryes then
  begin
       DM.ZQclientes.close;
       DM.ZQclientes.SQL.Clear;
       DM.ZQclientes.SQL.Add('DELETE FROM clientes WHERE codigo = :codigo');
       Dm.ZQclientes.ParamByName('codigo').AsInteger:= StrToInt(TDprocurar.Text);
       DM.ZQclientes.ExecSQL;
       ShowMessage('Excluido com sucesso!');
       BTlimpar.Click;
  end;
end;

procedure TFRMclientes.TDemailChange(Sender: TObject);
begin

end;

procedure TFRMclientes.BTsairClick(Sender: TObject);
begin
  if MessageDlg('QUER FINALIZAR O PROGRAMA?', mtCustom, [mbyes, mbno],0)= mryes then
  begin
    Application.Terminate;
  end;
end;

procedure TFRMclientes.BTatualizarClick(Sender: TObject);
begin
     if TDprocurar.Text = '' then
     begin
          ShowMessage('É OBRIGATÓRIO INFORMAR O CÓDIGO');
          TDprocurar.SetFocus;
          Exit;
     end;

     if TDnome.Text = '' then
     begin
          ShowMessage('Informe o campo Nome!');
          TDnome.SetFocus;
          exit;
     end;

     if TDendereco.Text = '' then
     begin
          ShowMessage('Informe o campo Endereço!');
          TDendereco.SetFocus;
          exit;
     end;

     if TDemail.Text = '' then
     begin
          ShowMessage('Informe o campo Email!');
          TDemail.SetFocus;
          exit;
     end;

     if TDtelefone.Text = '' then
     begin
          ShowMessage('Informe o campo Telefone!');
          TDtelefone.SetFocus;
          exit;
     end;

     if MessageDlg('Desejá atualizar o cadastro?', mtconfirmation,[mbyes,mbno],0)= mryes then
     begin
          DM.ZQclientes.Close;
          DM.ZQclientes.SQL.Clear;
          DM.ZQclientes.SQL.Add('UPDATE clientes SET nome = :nome, endereco = :endereco, email = :email, telefone = :telefone WHERE codigo = :codigo');
          DM.ZQclientes.ParamByName('nome').AsString := TDnome.Text;
          DM.ZQclientes.ParamByName('endereco').AsString := TDendereco.Text;
          DM.ZQclientes.ParamByName('email').AsString := TDemail.Text;
          DM.ZQclientes.ParamByName('telefone').AsString := TDtelefone.Text;
          DM.ZQclientes.ParamByName('codigo').AsInteger := StrToInt(TDprocurar.Text);
          DM.ZQclientes.ExecSQL;

          ShowMessage('Atualizado com sucesso!');
          TDnome.Text := '';
          TDendereco.Text := '';
          TDemail.Text := '';
          TDtelefone.Text := '';
          TDprocurar.Text := '';
     end;
end;

procedure TFRMclientes.BTprocurarClick(Sender: TObject);
begin
  if TDprocurar.Text = '' then
  begin
       ShowMessage('Informe o campo Código!');
       TDprocurar.SetFocus;
       Exit;
  end;
  DM.ZQclientes.close;
  DM.ZQclientes.SQL.clear;
  DM.ZQclientes.SQL.Add('select * from cliente where codigo = :codigo');
  DM.ZQclientes.ParamByName('codigo').AsInteger:=strToint(TDprocurar.Text);
  DM.ZQclientes.Open;
  if Dm.ZQclientes.IsEmpty then
  begin
       ShowMessage('Código de cliente não encontrado!');
       TDprocurar.SetFocus;
       exit;
  end;
  TDnome.Text:= DM.ZQclientes.FieldByName('nome').AsString;
  TDendereco.Text:= DM.ZQclientes.FieldByName('endereco').AsString;
  TDemail.Text:= DM.ZQclientes.FieldByName('email').AsString;
  TDtelefone.Text:= Dm.ZQclientes.FieldByName('telefone').AsString;
end;

procedure TFRMclientes.BTlimparClick(Sender: TObject);
begin
   TDprocurar.Text := '';
   TDnome.Text := '';
   TDendereco.Text := '';
   TDemail.Text := '';
   TDtelefone.Text := '';
end;

procedure TFRMclientes.ToggleBox1Change(Sender: TObject);
begin

end;

end.