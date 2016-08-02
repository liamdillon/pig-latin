Pig Latin translator

Tested using ruby version 2.2.0

pig_latin_test.rb contains MiniTest cases.

To use the translator as a script, run pig_latin.rb with a double quoted string argument.  You can give it multiple unquoted arguments, but it will lose single quotes.

To use the translator in another ruby script, import the PigLatin module and invoke the "translate" method with your string as the argument.

Example:

ruby pig_latin.rb "The quick brown fox!"
>Ethay ickquay ownbray oxfay!

---

include PigLatin

str = translate("The quick brown fox!")

puts str

---

output:
>Ethay ickquay ownbray oxfay!
