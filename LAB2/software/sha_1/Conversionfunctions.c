/**
 * Conversionfunctions.c
 *
 *  Created on: 13 Nov 2022
 *  Author: Chaitreya Hegde and Girish Tabaraddi
 */

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

#ifndef uint32_t
    typedef unsigned long uint32_t; /**< \brief 0 .. 4294967295      */
#endif

/**
 * A function to convert given input string into Binary sequence.
 * @param [in] InputString - this is char type input to the function.
 * @return [out] Binary - the function returns input as a binary sequence.
 */
char* StringToBinary(char *InputString)
{
	//! If the entered input string is empty/null, then return 0.
	if (InputString == NULL)
		return 0;

	//! Calculate the Input String Length using strlen function.
	size_t InputStringLength = strlen(InputString);

	//! Each character of InputString is one byte (8 bits)
	//! So, we need to assign memory of that length* 8bits(char size)
	//! and + 1 at the end for null terminator.
	char *binary = malloc(InputStringLength * sizeof(char) + 1);

	binary[0] = '\0';

	//! For each character of the InputString, convert it to binary
	for (size_t i = 0; i < InputStringLength; ++i)
	{
		char ch = InputString[i];
		for (int j = 7; j >= 0; --j)
		{
			if (ch & (1 << j))
			{
				strcat(binary, "1");
			}
			else
			{
				strcat(binary, "0");
			}
		}
	}
	return binary;
}

uint32_t DecToBinary(uint32_t MessageLength, uint32_t ReturnBinaryValue[64])
{
	//! array to store binary number
	uint32_t BinaryNum[64];

	//! counter for binary array
	int i = 0;
	while (MessageLength > 0)
	{

		//! storing remainder in binary array
		BinaryNum[i] = MessageLength % 2;
		MessageLength = MessageLength / 2;
		i++;
	}
	for (int j = 0; j < i; j++)
	{
		ReturnBinaryValue[j] = BinaryNum[j];
	}
	return i;
}

uint32_t BinaryArraytoDec(unsigned short BinaryArray[32])
{
	uint32_t DecimalNumber=0;
	for(int i=31;i>=0;i--)
	{
		DecimalNumber=DecimalNumber+(pow(2,31-i)*BinaryArray[i]);
	}
	return DecimalNumber;

}
