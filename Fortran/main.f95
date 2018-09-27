! Tyler Galske
program main
    ! variable declarations
    integer :: numberOfShifts, lengthOfString
    character(len=20) :: unencryptedString, encryptedString, decryptedString, toUpperCase, encrypt, decrypt

    ! encrypt
    print *, "ENCRYPT"
    unencryptedString = "Hello, world!"
    lengthOfString = len_trim(unencryptedString)
    print*, unencryptedString
    unencryptedString = toUpperCase(unencryptedString)
    numberOfShifts = 18
    encryptedString = encrypt(unencryptedString, numberOfShifts)
    print *, encryptedString(1:lengthOfString)


    ! decrypt
    print *, achar(10), "DECRYPT"
    encryptedString = "unc'b px hjwtnnb"
    lengthOfString = len_trim(encryptedString)
    print*, encryptedString
    encryptedString = toUpperCase(encryptedString)
    numberOfShifts = 9
    decryptedString = decrypt(encryptedString, numberOfShifts)
    print *, decryptedString(1:lengthOfString)

    ! solve
    print *, achar(10), "SOLVE"
    encryptedString = "hal"
    print *, encryptedString
    encryptedString = toUpperCase(encryptedString)
    numberOfShifts = 26
    call solve(encryptedString, numberOfShifts)
end program main

function encrypt(stringToEncrypt, numberOfShifts) result(encryptedString)
    implicit none
    ! variable declarations
    character(len=20), intent(in) :: stringToEncrypt
    character(len=20) :: encryptedString
    integer :: i, j, numberOfShifts
    integer :: LOWEST_CHAR, HIGHEST_CHAR
    LOWEST_CHAR = 65  ! constant
    HIGHEST_CHAR = 90 ! constant

    do i = 1, len_trim(stringToEncrypt)
        j = iachar(stringToEncrypt(i: i))
        ! apply shift only for letters, ignore punctuation
        if (j >= LOWEST_CHAR .and. j <= HIGHEST_CHAR) then
            j = j + numberOfShifts
            ! if shift goes past alphabet range, wrap back around
            if (j > HIGHEST_CHAR) then
                j = modulo(j, HIGHEST_CHAR) + LOWEST_CHAR - 1
            end if
        end if
        encryptedString(i:i) = achar(j)
    end do
end function encrypt

function decrypt(stringToDecrypt, numberOfShifts) result(decryptedString)
    implicit none
    !variable declarations
    character(len=20), intent(in) :: stringToDecrypt
    character(len=20) :: decryptedString
    integer :: i, j, numberOfShifts, LOWEST_CHAR, HIGHEST_CHAR
    LOWEST_CHAR = 65    ! constant
    HIGHEST_CHAR = 90   ! constant

    do i = 1, len_trim(stringToDecrypt)
        j = iachar(stringToDecrypt(i:i))
        ! apply shift only for letters, ignore punctuation
        if (j >= LOWEST_CHAR .and. j <= HIGHEST_CHAR) then
            j = j - numberOfShifts
            ! if shift goes past alphabet range, wrap back around
            if (j < LOWEST_CHAR) then
                j = j + 26
            end if
        end if
        decryptedString(i:i) = achar(j)
    end do
end function decrypt

subroutine solve(stringToSolve, maxShiftValue)
    implicit none
    !variable declarations
    character(len=20), intent(in) :: stringToSolve
    character(len=20) :: decryptedString
    integer :: i, j, maxShiftValue, LOWEST_CHAR, HIGHEST_CHAR, lengthOfString
    LOWEST_CHAR = 65    ! constant
    HIGHEST_CHAR = 90   ! constant
    lengthOfString = len_trim(stringToSolve)

    do while (maxShiftValue > -1)
        do i = 1, len_trim(stringToSolve)
        j = iachar(stringToSolve(i:i))
        ! apply shift only for letters, ignore punctuation
        if (j >= LOWEST_CHAR .and. j <= HIGHEST_CHAR) then
            j = j + maxShiftValue
            ! if shift goes past alphabet range, wrap back around
            if (j > HIGHEST_CHAR) then
                j = j - 26
            end if
        end if
        decryptedString(i:i) = achar(j)
        end do
        print *, "Caesar ",maxShiftValue,":",decryptedString(1:lengthOfString)
        maxShiftValue = maxShiftValue - 1
    enddo
    return
end subroutine solve

function toUpperCase(strIn) result(strOut)
    implicit none

    ! variable declarations
    character(len=20), intent(in) :: strIn
    character(len=len(strIn)) :: strOut
    integer :: i,j

    do i = 1, len(strIn)
        j = iachar(strIn(i:i))
        if (j>= iachar("a") .and. j<=iachar("z") ) then
            strOut(i:i) = achar(iachar(strIn(i:i))-32)
        else
            strOut(i:i) = strIn(i:i)
        end if
    end do
end function toUpperCase
