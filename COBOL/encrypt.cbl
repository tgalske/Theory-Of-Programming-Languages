       *> Tyler Galske
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENCRYPT.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 strIn PIC X(20) VALUE "the quick brown fox".
           01 strLength PIC 99.
           01 numShifts PIC 99 VALUE 5.
           01 i PIC 99.
           01 j PIC 99.
           01 MIN_CHAR PIC 99.
           01 MAX_CHAR PIC 99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY 'ENCRYPT'
           DISPLAY strIn

           MOVE 66 TO MIN_CHAR *> constant
           MOVE 91 TO MAX_CHAR *> constant


           Move Function Upper-case(strIn) to strIn
           Move FUNCTION LENGTH(strIn) to strLength

           MOVE ZERO TO i *> index of string
           MOVE ZERO to j *> temp helper variable

           INSPECT FUNCTION REVERSE ( strIn )
               TALLYING i
               FOR LEADING SPACE
           SUBTRACT i FROM LENGTH OF strIn GIVING strLength
           ADD 1 to strLength

           PERFORM VARYING i FROM 1 BY 1 UNTIL i = strLength
               MOVE FUNCTION ORD(strIn(i:1)) to j
               IF j >= MIN_CHAR AND j <= MAX_CHAR
                   ADD j to numShifts GIVING j
                   IF j > MAX_CHAR
                       SUBTRACT 26 FROM j
               END-IF
               MOVE FUNCTION CHAR(j) to strIn(i:1)
               MOVE ZERO TO j
           END-PERFORM
           DISPLAY strIn
           STOP RUN.
       END PROGRAM ENCRYPT.
