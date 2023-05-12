/* 
Tyler Spring
2/21/23
Project 3
This is the symbols values header class. Here the operators are defined along with
the functions for evaluating in the values.cc file. Here I added MULITPY, EXPON, DIVIDE, BOOL, MINUS, GREAT, LESSEQ, NOTEQ, GREATEQ, EQUAL.
*/
typedef char* CharPtr;
enum Operators {LESS, ADD, MULTIPLY, EXPON, DIVIDE, BOOL, MINUS, GREAT, LESSEQ, NOTEQ, GREATEQ, EQUAL};

int evaluateReduction(Operators operator_, int head, int tail);
int evaluateRelational(int left, Operators operator_, int right);
int evaluateArithmetic(int left, Operators operator_, int right);

