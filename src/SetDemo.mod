MODULE SetDemo ;

FROM StrIO IMPORT WriteString, WriteLn ;

TYPE
   Day = (Mon, Tue, Wed, Thu, Fri, Sat, Sun) ;
   Days = SET OF Day ;

VAR
   weekdays, weekend, workFromHome, inOffice, off : Days ;
   d : Day ;

PROCEDURE WriteDayName (d: Day) ;
BEGIN
   CASE d OF
      Mon : WriteString ('Mon') |
      Tue : WriteString ('Tue') |
      Wed : WriteString ('Wed') |
      Thu : WriteString ('Thu') |
      Fri : WriteString ('Fri') |
      Sat : WriteString ('Sat') |
      Sun : WriteString ('Sun')
   END
END WriteDayName ;

PROCEDURE WriteDays (label: ARRAY OF CHAR; s: Days) ;
VAR
   d : Day ;
   first : BOOLEAN ;
BEGIN
   WriteString (label) ;
   WriteString (': {') ;
   first := TRUE ;
   FOR d := Mon TO Sun DO
      IF d IN s THEN
         IF NOT first THEN
            WriteString (', ')
         END ;
         WriteDayName (d) ;
         first := FALSE
      END
   END ;
   WriteString ('}') ;
   WriteLn
END WriteDays ;

BEGIN
   weekdays := Days {Mon, Tue, Wed, Thu, Fri} ;
   weekend := Days {Sat, Sun} ;
   workFromHome := Days {Mon, Fri} ;

   WriteDays ('Weekdays', weekdays) ;
   WriteDays ('Weekend', weekend) ;
   WriteDays ('Work from home', workFromHome) ;

   (* intersection: days in office = weekdays * (weekdays - workFromHome) *)
   inOffice := weekdays - workFromHome ;
   WriteDays ('In office', inOffice) ;

   (* union *)
   WriteDays ('All days (union)', weekdays + weekend) ;

   (* difference *)
   off := weekend + workFromHome ;
   WriteDays ('Not in office', off) ;

   (* symmetric difference *)
   WriteDays ('Weekdays XOR work-from-home', weekdays / workFromHome) ;

   (* INCL / EXCL *)
   INCL (inOffice, Sat) ;
   WriteDays ('In office after adding Sat', inOffice) ;
   EXCL (inOffice, Sat) ;
   WriteDays ('In office after removing Sat', inOffice) ;

   (* membership test *)
   WriteString ('Is Wed a weekday? ') ;
   IF Wed IN weekdays THEN
      WriteString ('yes')
   ELSE
      WriteString ('no')
   END ;
   WriteLn ;

   WriteString ('Is Sat a weekday? ') ;
   IF Sat IN weekdays THEN
      WriteString ('yes')
   ELSE
      WriteString ('no')
   END ;
   WriteLn
END SetDemo.
