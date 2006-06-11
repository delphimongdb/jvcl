{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvChrono.PAS, released on 2001-02-28.

The Initial Developer of the Original Code is S�bastien Buysse [sbuysse@buypin.com]
Portions created by S�bastien Buysse are Copyright (C) 2001 S�bastien Buysse.
All Rights Reserved.

Contributor(s): Michael Beck [mbeck@bigfoot.com].

Last Modified: 2000-02-28

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$I JEDI.INC}

unit JvChrono;

{$OBJEXPORTALL On}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, JvComponent;

type
  TJvChrono = class(TJvComponent)
  private
    FStart: TTime;
    FStop: TTime;
    FPause: TTime;
  published
    procedure StartTimer;
    function StopTimer: TTime;
    procedure Pause;
    procedure UnPause;
    function GetElapsed: TTime;
  end;

implementation

{***********************************************}

procedure TJvChrono.StartTimer;
begin
  FPause := 0;
  Fstart := Time;
end;

{***********************************************}

procedure TJvChrono.Pause;
begin
  FPause := Time;
end;

{***********************************************}

procedure TJvChrono.UnPause;
begin
  FStart := FStart + (Time - FPause);
end;

{***********************************************}

function TJvChrono.StopTimer: TTime;
begin
  FStop := Time;
  Result := FStop - FStart;
end;

{***********************************************}

function TJvChrono.GetElapsed: TTime;
begin
  Result := Time - FStart;
end;

end.