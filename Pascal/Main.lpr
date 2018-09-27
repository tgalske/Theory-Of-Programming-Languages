{ Tyler Galske }
program Main;
Uses sysutils;

var
  strIn: string;
  numShifts, MIN_CHAR, MAX_CHAR : integer;

procedure encrypt(strIn: string; numShifts: integer);
var
  i: integer;
begin
   strIn := AnsiUpperCase(strIn);
   writeln('ENCRYPT');
   writeln(strIn);
   for i := 0 to Length(strIn) do
       if (ord(strIn[i]) >= MIN_CHAR) and (ord(strIn[i]) <= MAX_CHAR) then
          begin
               strIn[i] := chr(ord(strIn[i]) + numShifts);
               if (ord(strIn[i]) > MAX_CHAR) then
                  begin
                       strIn[i] := chr(ord(strIn[i]) - 26);
                  end;
          end;
   writeln(strIn);
end;

procedure decrypt(strIn: string; numShifts: integer);
var
  i: integer;
begin
   strIn := AnsiUpperCase(strIn);
   writeln('DECRYPT');
   writeln(strIn);

   for i := 0 to Length(strIn) do
       begin
         if (ord(strIn[i]) >= MIN_CHAR) and (ord(strIn[i]) <= MAX_CHAR) then
         begin
              strIn[i] := chr(ord(strIn[i]) - numShifts);
              if (ord(strIn[i]) < MIN_CHAR) then
              begin
                   strIn[i] := chr(ord(strIn[i]) + 26);
              end;
            end;
       end;
   writeln(strIn);
end;

procedure solve(strIn: string; maxShiftValue: integer);
var
  i: integer;
begin
   strIn := AnsiUpperCase(strIn);
   writeln('SOLVE');
   writeln(strIn);

   while maxShiftValue > -1 do
   begin
        writeln('Caesar ', maxShiftValue, ': ', strIn);
        for i := 0 to Length(strIn) do
        begin
           if (ord(strIn[i]) >= MIN_CHAR) and (ord(strIn[i]) <= MAX_CHAR) then
           begin
                strIn[i] := chr(ord(strIn[i]) - 1);
                if (ord(strIn[i]) < MIN_CHAR) then
                begin
                     strIn[i] := chr(ord(strIn[i]) + 26);
                end;
           end;
        end;
   maxShiftValue := maxShiftValue -1;
   end;
end;


begin
   MIN_CHAR := 65;
   MAX_CHAR := 90;

   strIn := 'the quick brown fox jumped over the lazy dog';
   numShifts := 15;
   encrypt(strIn, numShifts);

   numShifts := 12;
   strIn := 'xqfe sa kmzwqqe';
   decrypt(strIn, numShifts);

   numShifts := 26;
   strIn := 'hal';
   solve(strIn, numShifts);

   readln()
end.
