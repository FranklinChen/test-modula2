IMPLEMENTATION MODULE Stack ;

FROM Storage IMPORT ALLOCATE, DEALLOCATE ;

TYPE
   Node = POINTER TO NodeRec ;
   NodeRec = RECORD
      value : INTEGER ;
      next  : Node
   END ;

   Stack = POINTER TO StackRec ;
   StackRec = RECORD
      top : Node
   END ;

PROCEDURE Create () : Stack ;
VAR
   s : Stack ;
BEGIN
   NEW (s) ;
   s^.top := NIL ;
   RETURN s
END Create ;

PROCEDURE Push (s: Stack; value: INTEGER) ;
VAR
   n : Node ;
BEGIN
   NEW (n) ;
   n^.value := value ;
   n^.next := s^.top ;
   s^.top := n
END Push ;

PROCEDURE Pop (s: Stack) : INTEGER ;
VAR
   n : Node ;
   v : INTEGER ;
BEGIN
   n := s^.top ;
   v := n^.value ;
   s^.top := n^.next ;
   DISPOSE (n) ;
   RETURN v
END Pop ;

PROCEDURE IsEmpty (s: Stack) : BOOLEAN ;
BEGIN
   RETURN s^.top = NIL
END IsEmpty ;

PROCEDURE Destroy (VAR s: Stack) ;
VAR
   n, next : Node ;
BEGIN
   n := s^.top ;
   WHILE n # NIL DO
      next := n^.next ;
      DISPOSE (n) ;
      n := next
   END ;
   DISPOSE (s) ;
   s := NIL
END Destroy ;

END Stack.
