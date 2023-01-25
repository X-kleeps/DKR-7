uses GraphABC, fractal;
var y1,x1,n:integer;
procedure KeyDown(key: integer);
begin
  x := windowwidth div 2;
  y := windowheight div 2;
  case key of
    VK_Up: begin y1 := y1 - 50; end;
    VK_Down: begin y1 += 50; end;
    VK_Left: begin x1 := x1 - 50; end;
    VK_Right: begin x1 := x1 + 50; end;
    VK_H: if n>1 then n -= 1;
    VK_J: n += 1;
    VK_Y: if h>5 then h -= 5;
    VK_U: h += 5;
  end;
  x := x + x1;
  y := y + y1;
  clearwindow;
  moveto(x, y);
  PL(n);
  redraw;
end;


begin
  MaximizeWindow;
  x := windowwidth div 2;
  y := windowheight div 2;
  n := 5;
  h:=5;
  moveto(x, y);
  PL(n);
  redraw;
  onKeyDown += keydown;
end.