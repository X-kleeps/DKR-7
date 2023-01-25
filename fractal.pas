unit fractal;
interface
uses GraphABC;
 var h,x,y:integer;
procedure lined(dx,dy:integer);
procedure lineUP;
procedure lineDO;
procedure lineRI;
procedure lineLE;
procedure PU(i: integer);
procedure PD(i: integer);
procedure PL(i: integer);
procedure PR(i: integer);

implementation

procedure lined(dx,dy:integer);
begin
x:=x+dx;
y:=y+dy;
lineto(x,y);
end;

procedure lineUP;
begin
lined (0,-h);
end;

procedure lineDO;
begin
lined (0,h);
end;

procedure lineRI;
begin
lined (h,0);
end;

procedure lineLE;
begin
lined (-h,0);
end;
procedure PU(i: integer);
begin
  if i > 0 then begin
    PR(i - 1);
    lineUP;
    PU(i - 1);
    lineRI;
    PU(i - 1);
    lineDO;
    PL(i - 1);
  end;
end;

procedure PD(i: integer);
begin
  if i > 0 then begin
    PL(i - 1);
    lineDO;
    PD(i - 1);
    lineLE;
    PD(i - 1);
    lineUP;
    PR(i - 1);
  end;
end;

procedure PL(i: integer);
begin
  if i > 0 then begin
    PD(i - 1);
    lineLE;
    PL(i - 1);
    lineDO;
    PL(i - 1);
    lineRI;
    PU(i - 1);
  end;
end;

procedure PR(i: integer);
begin
  if i > 0 then begin
    PU(i - 1);
    lineRI;
    PR(i - 1);
    lineUP;
    PR(i - 1);
    lineLE;
    PD(i - 1);
  end;
end;
end.