MODULE StackDemo ;

FROM StrIO IMPORT WriteString, WriteLn ;
FROM NumberIO IMPORT WriteInt ;
FROM Stack IMPORT Stack, Create, Push, Pop, IsEmpty, Destroy ;

VAR
   s : Stack ;

BEGIN
   WriteString ('Stack demo: push 10, 20, 30 then pop all') ; WriteLn ;

   s := Create () ;
   Push (s, 10) ;
   Push (s, 20) ;
   Push (s, 30) ;

   WHILE NOT IsEmpty (s) DO
      WriteString ('  popped: ') ;
      WriteInt (Pop (s), 0) ;
      WriteLn
   END ;

   Destroy (s) ;
   WriteString ('done') ; WriteLn
END StackDemo.
