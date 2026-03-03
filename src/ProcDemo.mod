MODULE ProcDemo ;

FROM StrIO IMPORT WriteString, WriteLn ;
FROM NumberIO IMPORT WriteInt ;

TYPE
   IntOp = PROCEDURE (INTEGER) : INTEGER ;

VAR
   values : ARRAY [0..4] OF INTEGER ;
   i : CARDINAL ;

PROCEDURE Double (x: INTEGER) : INTEGER ;
BEGIN
   RETURN x * 2
END Double ;

PROCEDURE Square (x: INTEGER) : INTEGER ;
BEGIN
   RETURN x * x
END Square ;

PROCEDURE Negate (x: INTEGER) : INTEGER ;
BEGIN
   RETURN -x
END Negate ;

PROCEDURE ApplyAndPrint (label: ARRAY OF CHAR;
                         op: IntOp;
                         VAR arr: ARRAY OF INTEGER) ;
VAR
   i : CARDINAL ;
BEGIN
   WriteString (label) ;
   WriteString (': ') ;
   FOR i := 0 TO HIGH (arr) DO
      IF i > 0 THEN
         WriteString (', ')
      END ;
      WriteInt (op (arr[i]), 0)
   END ;
   WriteLn
END ApplyAndPrint ;

BEGIN
   values[0] := 1 ;
   values[1] := 2 ;
   values[2] := 3 ;
   values[3] := 4 ;
   values[4] := 5 ;

   WriteString ('Procedure variable demo') ; WriteLn ;
   WriteString ('Original: ') ;
   FOR i := 0 TO HIGH (values) DO
      IF i > 0 THEN
         WriteString (', ')
      END ;
      WriteInt (values[i], 0)
   END ;
   WriteLn ;

   ApplyAndPrint ('Double', Double, values) ;
   ApplyAndPrint ('Square', Square, values) ;
   ApplyAndPrint ('Negate', Negate, values)
END ProcDemo.
