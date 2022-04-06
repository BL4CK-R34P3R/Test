1) Simulate a DFA for a regular language L={awb| w ∈ {a, b} }.
a) by writing a C program manually.
b) by Lex/Flex tool.
2) Using Lex/Flex , write a program to identify some keywords, identifiers, integers and real numbers from
a simple C program. Input/output streams may be files.
3) Using Lex/Flex , write a program to count number of lines, words, visible characters, total characters.
Input/output streams may be files.
4) Using Lex/Flex , write a program to append line number before each
(i) lines(empty/non-empty). (
n-empty lines
Input/output streams may be files.
5) a) Lex program to copy a file by replacing multiple sequences of white spaces with a single white space. [
blanks/tab => blank, more than one “ \n” => “ \n”].
b) Also add removal of comments in above program.
6) Lex program to copy a C program by replacing each instance of the keyword float by double.
7) Write a Lex program that converts a file to “Pig Latin”. Specifically, assume the file is sequence of English
words (group of letters) separated by white space. Every time a word is encountered:
1. If the first letter is consonant, move it to the end of the word and then add ay.
2. If the first letter is a vowel, just add ay to the end of the word.
8) Using Lex/Flex , write a program to encode and decode. [Exact problem statements are to be provided.]
9) Using Lex/Flex , write a program to (i) identify the Roman numbers (dd 2 Roman numbers.
10) Create a recursive predictive parser for a grammar(as given in lab class).
11) Create a non-recursive predictive parser(LL parser) for a grammar(as given inlab class).
12) Using Flex and Bison tools, create a calculator program that support addition, subtraction, multiplication,
division, power operations on numbers and variables.
13) Using Flex and Bison tools create a translator to convert a simple programwritten in arbitrary language to
a program in C language.
14) Using Flex and Bison tools, create a program to convert a simple assignmentexpression into intermediate
code.
Ex:-input: z = ‐(a+b‐c)
output:
t1 = a + b
t2 = t1 – c
t3 = ‐ t2
z = t3
