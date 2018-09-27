object Main extends  App{
  var MIN_CHAR = 65
  var MAX_CHAR = 90
  var strIn = "This is a test string from Alan"
  var numShifts = 8
  encrypt(strIn, numShifts)

  strIn = "BPQA QA I BMAB ABZQVO NZWU ITIV"
  decrypt(strIn, numShifts)

  strIn = "hal"
  numShifts = 26
  solve(strIn, numShifts)

  def encrypt (strIn:String, numShifts:Int) : Unit = {
    var letters = strIn.toUpperCase.toCharArray
    var i = 0
    while (i < letters.length()) {
      var j = letters(i).toInt
      if (j >= MIN_CHAR && j <= MAX_CHAR) {
        j = if (j + numShifts > MAX_CHAR) j + numShifts - 26 else j + numShifts
      }
      letters(i) = j.toChar
      i = i + 1
    }
    println(letters.mkString)
  }

  def decrypt (strIn:String, numShifts:Int) : Unit = {
    var letters = strIn.toUpperCase.toCharArray
    var i = 0
    while (i < letters.length()) {
      var j = letters(i).toInt
      if (j >= MIN_CHAR && j <= MAX_CHAR) {
        j = if (j - numShifts < MIN_CHAR) j - numShifts + 26 else j - numShifts
      }
      letters(i) = j.toChar
      i = i + 1
    }
    println(letters.mkString)
  }

  def solve (strIn:String, maxShiftValue:Int) : Unit = {
    var shiftValue = maxShiftValue
    val letters = strIn.toUpperCase.toCharArray
    var i = 0

    while (shiftValue > -1) {
      println("Caesar " + shiftValue + ": " + letters.mkString)
      while (i < letters.length()) {
        var j = letters(i).toInt
        if (j >= MIN_CHAR && j <= MAX_CHAR) {
          j = j - 1
          if (j < MIN_CHAR) {
            j = j + 26
          }
        }
        letters(i) = j.toChar
        i = i + 1
      }
      i = 0
      shiftValue = shiftValue - 1
    }
  }
}


