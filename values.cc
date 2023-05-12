/* 
Tyler Spring
2/21/23
Project 3
This is the values file. Here are the functions that are used in the parser to perform
the calculations needed when found in the input file.
*/

#include <string>
#include <vector>
#include <cmath>

using namespace std;

#include "values.h"
#include "listing.h"
#include "tokens.h"
/*Reduction seemed pretty straightforward so left it alone.*/
int evaluateReduction(Operators operator_, int head, int tail)
{
	if (operator_ == ADD)
		return head + tail;
	return head * tail;
}

/*Added NOT, GREAT, GREATEQ, LESSEQ, EQUAL*/
int evaluateRelational(int left, Operators operator_, int right)
{
	int result;
	switch (operator_)
	{
		case LESS:
			result = left < right;
			break;
		case NOT:
			result = left /= right;
			break;
		case GREAT:
			result = left > right;
			break;
		case GREATEQ:
			result = left >= right;
			break;
		case LESSEQ:
			result = left <= right;
			break;
		case EQUAL:
			result = left = right;
			break;
	}
	return result;
}
/*added MULTIPLY, EXPON, DIVIDE, MINUS*/
int evaluateArithmetic(int left, Operators operator_, int right)
{
	int result;
	switch (operator_)
	{
		case ADD:
			result = left + right;
			break;
		case MULTIPLY:
			result = left * right;
			break;
		case EXPON:
			result = left ^ right;
			break;
		case DIVIDE:
			result = left / right;
			break;
		case MINUS:
			result = left - right;
			break;
	}
	return result;
}

