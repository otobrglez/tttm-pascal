program TTTMServer;

{$mode objfpc}{$H+}

uses
  {$ifdef UNIX}
  cthreads, cmem,
  {$endif}
  fphttpapp, httpdefs, httproute;

procedure route1(aReq: TRequest; aResp: TResponse);
begin
  WriteLn('Hellooooo from route1');
  aResp.Content:='<html><body><h1>Route 1 The Default</h1></body></html>';
end;

procedure route2(aReq: TRequest; aResp: TResponse);
begin
  aResp.Content:='<html><body><h1>Route 2</h1></body></html>';
end;

begin
  WriteLn('Booting at 19999');	
  HTTPRouter.RegisterRoute('/', @route1);
  HTTPRouter.RegisterRoute('/2', @route2);
  Application.Port := 1999;
  Application.Threaded := true;
  Application.Initialize;
  Application.Run;
end.

