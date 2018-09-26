       IDENTIFICATION DIVISION.
       PROGRAM-ID. SOLVE.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 strIn PIC X(20) VALUE "HAL".
           01 strLength PIC 99.
           01 maxShiftValue PIC 99 VALUE 26.
           01 realShiftValue PIC 99.
           01 i PIC 99.
           01 j PIC 99.
           01 MIN_CHAR PIC 99.
           01 MAX_CHAR PIC 99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           MOVE 66 TO MIN_CHAR *> constant
           MOVE 91 TO MAX_CHAR *> constant

           ADD 1 TO maxShiftValue GIVING realShiftValue

           Move Function Upper-case(strIn) to strIn
           Move FUNCTION LENGTH(strIn) to strLength

           MOVE ZERO TO i *> index of string
           MOVE ZERO to j *> temp helper variable

           INSPECT FUNCTION REVERSE ( strIn )
               TALLYING i
               FOR LEADING SPACE
           SUBTRACT i FROM LENGTH OF strIn GIVING strLength
           ADD 1 to strLength

           PERFORM UNTIL realShiftValue = 0
               DISPLAY 'Caesar ' maxShiftValue ': ' strIn
               PERFORM VARYING i FROM 1 BY 1 UNTIL i = strLength
                   MOVE FUNCTION ORD(strIn(i:1)) to j
                   IF j >= MIN_CHAR AND j <= MAX_CHAR
                       SUBTRACT 1 FROM j
                       IF j < MIN_CHAR
                           ADD 26 to j
                   END-IF
                   MOVE FUNCTION CHAR(j) to strIn(i:1)
                   MOVE ZERO TO j
               END-PERFORM
               SUBTRACT 1 FROM realShiftValue
               SUBTRACT 1 FROM maxShiftValue
           END-PERFORM
           STOP RUN.
       END PROGRAM SOLVE.
