MODULE VariantDemo ;

FROM StrIO IMPORT WriteString, WriteLn ;
FROM NumberIO IMPORT WriteInt ;

TYPE
   ShapeKind = (Circle, Rectangle, Triangle) ;

   Shape = RECORD
      CASE kind : ShapeKind OF
         Circle :
            radius : INTEGER |
         Rectangle :
            width, height : INTEGER |
         Triangle :
            sideA, sideB, sideC : INTEGER
      END
   END ;

VAR
   c, r, t : Shape ;

PROCEDURE Describe (s: Shape) ;
BEGIN
   CASE s.kind OF
      Circle :
         WriteString ('Circle with radius ') ;
         WriteInt (s.radius, 0) |
      Rectangle :
         WriteString ('Rectangle ') ;
         WriteInt (s.width, 0) ;
         WriteString (' x ') ;
         WriteInt (s.height, 0) |
      Triangle :
         WriteString ('Triangle with sides ') ;
         WriteInt (s.sideA, 0) ;
         WriteString (', ') ;
         WriteInt (s.sideB, 0) ;
         WriteString (', ') ;
         WriteInt (s.sideC, 0)
   END ;
   WriteLn
END Describe ;

PROCEDURE Perimeter (s: Shape) : INTEGER ;
BEGIN
   CASE s.kind OF
      Circle :
         (* approximate: 2 * pi * r, using 2 * 3 * r = 6r as integer approx *)
         RETURN 6 * s.radius |
      Rectangle :
         RETURN 2 * (s.width + s.height) |
      Triangle :
         RETURN s.sideA + s.sideB + s.sideC
   END
END Perimeter ;

PROCEDURE WriteShapeInfo (s: Shape) ;
BEGIN
   WriteString ('  ') ;
   Describe (s) ;
   WriteString ('  Perimeter: ') ;
   WriteInt (Perimeter (s), 0) ;
   WriteLn
END WriteShapeInfo ;

BEGIN
   WriteString ('Variant record demo') ; WriteLn ;
   WriteLn ;

   c.kind := Circle ;
   c.radius := 5 ;

   r.kind := Rectangle ;
   r.width := 4 ;
   r.height := 7 ;

   t.kind := Triangle ;
   t.sideA := 3 ;
   t.sideB := 4 ;
   t.sideC := 5 ;

   WriteShapeInfo (c) ;
   WriteShapeInfo (r) ;
   WriteShapeInfo (t)
END VariantDemo.
