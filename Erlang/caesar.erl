-module(caesar). 
-import(lists,[reverse/1]). 
-export([start/0,shiftLetter/2,encrypt/2,decrypt/2,solve/2]).

shiftLetter(Letter, NumShift)  ->
	GetLetterValue = fun([Character]) -> Character end,
	LetterValue = GetLetterValue(Letter),
	if
	    LetterValue >= 65 ->
	        if
	            LetterValue =< 90 ->
	                (((GetLetterValue(Letter) - 65 + NumShift) rem (26) + 26) rem 26) + 65;
	            true ->
	                Letter
            end;
	    true ->
	        Letter
	end.

encrypt(Sentence, NumShift) ->
    Shifted = lists:map(fun(Letter) -> shiftLetter([Letter], NumShift) end, string:to_upper(Sentence)),
	io:format("~s", [Shifted]).
	
decrypt(Sentence, NumShift) -> encrypt(Sentence, NumShift * -1).

solve(Sentence, MaxShift) -> 
   Numbers = lists:seq(0, MaxShift),
   lists:foreach(fun(MaxShift) ->
		io:fwrite("\nCaesar ~p: ", [MaxShift]),
		decrypt(Sentence, MaxShift * -1) end, reverse(Numbers)).

start() ->
	encrypt("Hello, world!", 3),
	io:fwrite("\n"),
	decrypt("jkraixan", 22),
	io:fwrite("\n"),
	solve("hal", 26).
	