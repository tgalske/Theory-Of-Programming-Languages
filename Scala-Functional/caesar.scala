object Caesar {
    def main(args: Array[String]) {
        var sentence: String = "Hello, world!"
        var numShift: Int = 3
        print(encrypt(sentence, numShift) + "\n")
        sentence = "axeeh, phkew"
        numShift = 19
        print(decrypt(sentence, numShift))
        solve("hal", 26)
    }
    
    def encrypt(sentence: String, numShift: Int) : String = {
        return sentence.toUpperCase().map(letter => shiftLetter(letter, numShift % 26))
    }
    
        def shiftLetter(letter: Char, numShift: Int) : Char = {
        if (letter.toInt >= 65 && letter.toInt <= 90) {
            return ((letter.toInt - 65 + numShift + 26) % 26 + 65).toChar
        } else {
            return letter
        }
    }
    
    def decrypt(sentence: String, numShift: Int) : String = {
        return encrypt(sentence, numShift * -1)
    }
    
    def solve(sentence: String, maxShift: Int) : Unit = {
        print("\nCaesar " + maxShift + ": " + encrypt(sentence, maxShift))
        if (maxShift >= 1) {
            solve(sentence, maxShift -1)
        }
    }
    
}