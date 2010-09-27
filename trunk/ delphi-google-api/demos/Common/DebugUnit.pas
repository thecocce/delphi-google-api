unit DebugUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,XMLDoc,XMLIntf, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmDebug = class(TForm)
    Panel5: TPanel;
    Button13: TButton;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    Memo1: TMemo;
    procedure Button13Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure Debug(const Msg:string; const pXmlDoc:IXMLDocument);
  public
    { Public declarations }
  end;

var
  frmDebug: TfrmDebug;

implementation

uses GGlobal;

procedure InitDebug;
begin
     with TFrmDebug.Create(application) do begin
          GGDebug:=Debug;
          show;
     end;
end;

{$R *.dfm}


//==========================================================================
procedure XMLToTreeview(const pTitle:string; DataTree: TTreeView; const XMLDocument: IXMLDocument);
//==========================================================================

  procedure AddNode(ParentNode: TTreeNode; const Node: IXMLNode);
  const
    MaxTextLen = 150;
  var
    I: Integer;
    NodeText: string;
    NewNode: TTreeNode;
  begin
    case Node.NodeType of
      ntCData: NodeText:=Node.NodeValue;
      ntText, ntComment:
        begin
          // Here you may want to retrieve the value
          // of the id attribute instead of Node.Text
          ParentNode.Text:=parentnode.text+' = '+Node.Text;
          exit;
{          NodeText := Node.Text;
          if NodeText = '' then
            NodeText := Node.LocalName + ' (empty text)';}
        end;
      ntDocType:
        NodeText := Node.DOMNode.nodeName;
      else
        NodeText := Node.NodeName;
    end;


    NewNode := DataTree.Items.AddChildObject(ParentNode,
                        Copy(NodeText, 1, MaxTextLen),
                        Pointer(Node));

    NewNode.ImageIndex := Ord(Node.nodeType);

    for I := 0 to Node.AttributeNodes.Count - 1 do
      with Node.AttributeNodes[I] do begin
        NodeText := Format('@%s=%s', [NodeName, NodeValue]);
        if Node.AttributeNodes.Count=1 then
           NewNode.Text:=NewNode.text+'  '+NodeText
        else
            DataTree.Items.AddChildObject(NewNode,
                        Copy(NodeText, 1, MaxTextLen),
                        Pointer(Node.AttributeNodes[I]));

      end;


    for I := 0 to Node.ChildNodes.Count - 1 do
      AddNode(NewNode, Node.ChildNodes[I]);
  end;

var
  I: Integer;
  x:TTreeNode;
begin
  DataTree.Items.BeginUpdate;
  try
    x:=DataTree.Items.AddChild(nil,pTitle);
    if XMLDocument=nil then exit;

    with XMLDocument do begin
         if IsEmptyDoc then
            Exit;
         for I := 0 to ChildNodes.Count - 1 do
             AddNode(x, ChildNodes[I]);

    end;    // with

  finally
    DataTree.Items.EndUpdate;
  end;
end;


{ TfrmDebug }

procedure TfrmDebug.Debug(const Msg: string; const pXmlDoc: IXMLDocument);
begin
     if pXMLDoc=nil then
        memo1.lines.add(msg)
     else
         XMLToTreeview(Msg,TreeView1,pXmlDoc);
end;

procedure TfrmDebug.Button13Click(Sender: TObject);
begin
     TreeView1.items.clear;
     memo1.lines.clear;
end;

procedure TfrmDebug.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     canclose:=Application.Terminated;
end;

initialization
InitDebug;

end.
