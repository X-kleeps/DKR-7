uses GraphABC;
var n,h,x,y,x1,y1:integer;
procedure PU(i:integer); forward;
procedure PD(i:integer); forward;
procedure PR(i:integer); forward;
procedure PL(i:integer); forward;

////////////////////////////ЛИНИИ////////////////////////////

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
////////////////////////////////////////////////////////////

procedure PU(i:integer);
begin
if i>0 then begin
PR(i-1);
lineUP;
PU(i-1);
lineRI;
PU(i-1);
lineDO;
PL(i-1);
end;
end;

procedure PD(i:integer);
begin
if i>0 then begin
PL(i-1);
lineDO;
PD(i-1);
lineLE;
PD(i-1);
lineUP;
PR(i-1);
end;
end;

procedure PL(i:integer);
begin
if i>0 then begin
PD(i-1);
lineLE;
PL(i-1);
lineDO;
PL(i-1);
lineRI;
PU(i-1);
end;
end;

procedure PR(i:integer);
begin
if i>0 then begin
PU(i-1);
lineRI;
PR(i-1);
lineUP;
PR(i-1);
lineLE;
PD(i-1);
end;
end;
///////////////////////////////////////////////////////

procedure KeyDown(key: integer);
begin
x := windowwidth div 2;
y := windowheight div 2;
  case key of
    VK_Up: begin y1 := y1 - 50;  end;
    VK_Down: begin y1 += 50;  end;
    VK_Left: begin x1 := x1 - 50;  end;
    VK_Right: begin x1 := x1 + 50;  end;
    VK_H:  n -= 1;
    VK_J:  n += 1;
    VK_Y:  h -= 10;
    VK_U:  h += 10;
  end;
x:=x+x1;
y:=y+y1;
  Window.Clear;
  moveto(x,y);
  PL(n);
  redraw;
end;


begin
MaximizeWindow;
x := windowwidth div 2;
y := windowheight div 2;
n:=5;
h:=5;
moveto(x,y);
PL(n);
redraw;
onKeyDown += keydown;
end.