/**
 * SecureHash.c
 *
 *  Created on: 13 Nov 2022
 *  Author: Chaitreya Hegde and Girish Tabaraddi
 */
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#include "Conversionfunctions.h"

#ifndef uint32_t
    typedef unsigned long uint32_t; /**< \brief 0 .. 4294967295      */
#endif

#define WordSize 32

unsigned short* CircularShiftArray(unsigned short InputWordArray[WordSize],
		uint32_t RotationValue)
{
	unsigned short static StaticInputWordArray[WordSize];
	//!Rotate the given array by RotationValue times toward left
	for (int i = 0; i < RotationValue; i++)
	{
		int j, first;
		//! Stores the first element of the InputWordArray
		first = InputWordArray[0];
		printf("First element of array%d\n", first);
		for (j = 0; j < WordSize - 1; j++)
		{
			//! Shift element of array by one
			InputWordArray[j] = InputWordArray[j + 1];
		}
		//! First element of InputWordArray will be added to the end
		InputWordArray[j] = first;
	}

	for (int i = 0; i < WordSize; i++)
	{
		StaticInputWordArray[i] = InputWordArray[i];

	}
	return StaticInputWordArray;

}

uint32_t CircularShiftHex(uint32_t InputHex, uint32_t RotationValue)
{
	//!Rotate the given array by RotationValue times toward left
	uint32_t HexShift;
	HexShift = (InputHex << RotationValue)
			| (InputHex >> (WordSize - RotationValue));
	return HexShift;
}

uint32_t LogicalFunction(uint32_t i, uint32_t B, uint32_t C, uint32_t D)
{
	//!	f(i;B,C,D) = (B & C) | ((~B)&D) 			for  0<=i<=19
	//!	f(i;B,C,D) = B ^ C ^ D 						for  20<=i<=39
	//!	f(i;B,C,D) = (B & C) | (B & D) | (C & D) 	for  40<=i<=59
	//!	f(i;B,C,D) = B ^ C ^ D						for  60<=i<=79.

	uint32_t logicalF;
	if (i >= 0 && i <= 19)
	{
		logicalF = (B & C) | ((~B) & D);
	}
	else if ((i >= 20 && i <= 39) || (i >= 60 && i <= 79))
	{
		logicalF = B ^ C ^ D;
	}
	else if (i >= 40 && i <= 59)
	{
		logicalF = (B & C) | (B & D) | (C & D);
	}

	return logicalF;
}

uint32_t constantK(uint32_t i)
{
	//!	A sequence of constant words in hex is used in the formulas.
	uint32_t K;

	if (i >= 0 && i <= 19)
	{
		K = 0x5A827999;
	}
	else if (i >= 20 && i <= 39)
	{
		K = 0x6ED9EBA1;
	}
	else if (i >= 40 && i <= 59)
	{
		K = 0x8F1BBCDC;
	}
	else if (i >= 60 && i <= 79)
	{
		K = 0xCA62C1D6;
	}

	return K;
}

uint32_t* sha1(const uint32_t *m_ptr, const uint32_t *prev_hash)
{
	unsigned short WordArray[16][WordSize];
	uint32_t DecWordArray[80];

	for (int i = 0; i < 16; i++)
	{
		for (int j = 0; j < 32; j++)
		{
			WordArray[i][j] = m_ptr[i * 32 + j];
		}
	}

//	printf("printing the first 16 words\n");
//	for (int i = 0; i < 16; i++)
//	{
//		printf("WordArray[%d]= ", i);
//		for (int j = 0; j < 32; j++)
//		{
//			printf("%d", WordArray[i][j]);
//		}
//		printf("\n");
//	}

	for (int i = 0; i < 16; i++)
	{
		DecWordArray[i] = BinaryArraytoDec(WordArray[i]);
//		printf(" Decimal Array[%d]=%lu\n", i, DecWordArray[i]);
	}

	//! This loop is performing XOR operation on the WordArray by using the below formula#
	//!	W(i)=S1(W(i-3) XOR W(i-ˆ’8) XOR W(i-ˆ’14) XOR W(i-ˆ’16))
	for (int i = 16; i < 80; i++)
	{
		//! Call the circular shift function and left shift the word array from 16 to 79 by 1 bit.
		DecWordArray[i] = CircularShiftHex(
				DecWordArray[i - 3] ^ DecWordArray[i - 8] ^ DecWordArray[i - 14]
						^ DecWordArray[i - 16], 1);
	}

//	printf("\nCircular shift operated array:\n");
//	for (int i = 16; i < 80; i++)
//	{
//		printf("DecWordarray[%d]= %lX\n", i, DecWordArray[i]);
//	}

	//!  Initialize five random strings of hex characters that will serve as part of the hash function (shown in hex):
	uint32_t TEMP[80], H0, H1, H2, H3, H4, A, B, C, D, E;

	H0 = 0x67452301; //! A = 1,732,584,193
	H1 = 0xEFCDAB89; //! B = 4,023,233,417
	H2 = 0x98BADCFE; //! C = 2,562,383,102
	H3 = 0x10325476; //! D = 271,733,878
	H4 = 0xC3D2E1F0; //! E = 3,285,377,520

	//! store the hash values defined in step 1 in the following variables.
	A = H0;
	B = H1;
	C = H2;
	D = H3;
	E = H4;
	printf("\n\t    A\t   B\t     C\t      D\t      E\n");
	for (int i = 0; i < 80; i++)
	{
		//! 6) For 80 iterations, where 0<= i <= 79, compute
		//! TEMP = S^5 *(A) + x(i) + E + W(i) + K(i).
		//! x(i) = f(i; B, C, D) - this is logic function call
		//! Here we are type casting the values after adding them because they are in uint32_t
		//! and the obtained result should be assigned to TEMP which is uint64_t.

		TEMP[i] = ((CircularShiftHex(A, 5) + LogicalFunction(i, B, C, D))
				+ (E + DecWordArray[i] + constantK(i)));

		//! Reassign the variables as per the hasÂ´h algorithm formula.
		E = D;
		D = C;
		C = CircularShiftHex(B, 30);
		B = A;
		A = TEMP[i];

		printf("t= %d:\t%lX %lX %lX %lX %lX\n", i, A, B, C, D, E);
	}

	//!Store the result of the chunk€™s hash to the overall hash value of all chunks.
	H0 = H0 + A;
	H1 = H1 + B;
	H2 = H2 + C;
	H3 = H3 + D;
	H4 = H4 + E;

	//! As a final step, when all the chunks have been processed,
	//! the message digest is represented as the 160-bit string.

	static uint32_t FinalHash[5];
	FinalHash[0] = H0;
	FinalHash[1] = H1;
	FinalHash[2] = H2;
	FinalHash[3] = H3;
	FinalHash[4] = H4;
	return FinalHash;
}

