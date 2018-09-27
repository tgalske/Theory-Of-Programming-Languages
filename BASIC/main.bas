' Tyler Galske
Function encrypt(strIn As String, numShifts As Integer) As String
    dim i As Integer
    Const MIN_CHAR As Integer = 65, MAX_CHAR As Integer = 90
    strIn = UCase(strIn)
    Print "ENCRYPT"
    Print strIn
    
    for i = 0 to len(strIn)
        if strIn[i] >= MIN_CHAR And strIn[i] <= MAX_CHAR then
            strIn[i] = strIn[i] + numShifts
            if strIn[i] > MAX_CHAR then
                strIn[i] = strIn[i] - 26
            end if
        end if
    next
    Return strIn
End Function

Function decrypt(strIn As String, numShifts As Integer) As String
    dim i As Integer
    Const MIN_CHAR As Integer = 65, MAX_CHAR As Integer = 90
    strIn = UCase(strIn)
    Print "DECRYPT"
    Print strIn
    
    for i = 0 to len(strIn)
        if strIn[i] >= MIN_CHAR And strIn[i] <= MAX_CHAR then
            strIn[i] = strIn[i] - numShifts
            if strIn[i] < MIN_CHAR then
                strIn[i] = strIn[i] + 26
            end if
        end if
    next
    Return strIn
End Function

Sub solve(strIn As String, maxShiftAmount As Integer)
    dim i As Integer
    Const MIN_CHAR As Integer = 65, MAX_CHAR As Integer = 90
    strIn = UCase(strIn)
    Print "SOLVE"
    Print strIn
    
    Do  
        Print "Caesar " + str$(maxShiftAmount) + ": " + strIn
        for i = 0 to len(strIn)
            if strIn[i] >= MIN_CHAR And strIn[i] <= MAX_CHAR then
                strIn[i] = strIn[i] - 1
                if strIn[i] < MIN_CHAR then
                    strIn[i] = strIn[i] + 26
                end if
            end if
        next
        maxShiftAmount = maxShiftAmount - 1
    Loop While maxShiftAmount > -1
End Sub

dim strIn As String = "Hello, world!"
Print encrypt(strIn, 3)
strIn = "ow givsmma!"
Print decrypt(strIn, 8)
solve("hal", 26)
Sleep