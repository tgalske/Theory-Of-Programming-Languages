fun shiftLetter(letter, numShift) = let
	val letterValue = Char.ord(Char.toUpper(letter))
	in
	if letterValue >= 65 andalso letterValue <= 90 then
        Char.chr( (letterValue - 65 + numShift) mod(26) + 65)
	else Char.chr(letterValue)
	end

fun encrypt (sentence, numShift) = (
	String.implode(map (fn letter => shiftLetter(letter, numShift) ) (String.explode(sentence)) )
)

fun decrypt (sentence, numShift) = encrypt (sentence, numShift * ~1);

fun solve(sentence, maxShift) = (
	print("Caesar " ^ Int.toString(maxShift) ^  ": " ^ encrypt(sentence, maxShift) ^ "\n");
	if maxShift > 0
	  then solve(sentence, maxShift - 1)
	else NONE
)

val sentenceToEncrypt = "Hello, world!";
val sentenceToDecrypt = "bagstwqqbeuq";
print(encrypt(sentenceToEncrypt, 3) ^ "\n");
print(decrypt(sentenceToDecrypt, 12) ^ "\n");
solve("HAL", 26);