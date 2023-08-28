/**
 * SHA.c
 *
 *  Created on: 8 Nov 2022
 *  Author: Chaitreya Hegde and Girish Tabaraddi
 */
#include "system.h"
#include "sys/alt_stdio.h"
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#include "SecureHash.h"
#include "Conversionfunctions.h"

#define LED (*((volatile unsigned int *) 0x80011030 ))
volatile unsigned long delay = 0;

#ifndef uint32_t
    typedef unsigned long uint32_t; /**< \brief 0 .. 4294967295      */
#endif

int main()
{
	//setvbuf( stdout, NULL, _IONBF, 0);

//	 The Input String is FSOC 2022/23 is fun!.
	char Input_string[512] = "FSOC22/23 is fun!";
	printf("Input String: %s\n", Input_string);

	char *Output;
//	int OriginalMessageLength=strlen(Input_string);

	Output = (char*) malloc(64 * sizeof(char)); //! 512 bits for the output string
	Output = StringToBinary(Input_string);

	//! Calculate the length of the Output String. Here we have 136 bits output.
	int OutputBits = strlen(Output);
	uint32_t OriginalMessageLength = OutputBits;

//	printf("Binary Output:\n%s\n", Output);
//	printf("String length of Binary Output(stringformat): %d\n", OutputBits);

	int ZerosToAppend;
	uint32_t OutputBitsInteger[512];

	//!Obtained Output is in string format, we need to convert this into Integer format.
	for (int i = 0; Output[i] != 0; i++)
	{
		OutputBitsInteger[i] = Output[i] - '0';
	}
//	printf("\nOutput array in Integer format:\n");
//	for (int i = 0; i < OutputBits; i++)
//	{
//		printf("%lu", OutputBitsInteger[i]);
//	}

	//! Here 447 is obtained by removing 64 bits for Message length and 1 bit as magic number from 512 bits.
	//! Further we need 0s to append after the magic number 1 bit, to make the block to 512 bits
	ZerosToAppend = 447 - OutputBits;
//	printf("\nPadding zeroes length: %d\n", ZerosToAppend);

	OutputBitsInteger[OutputBits] = 1;
	OutputBits = OutputBits + 1;

	int j;
	for (j = 0; j < ZerosToAppend; j++)
	{
		OutputBitsInteger[OutputBits + j] = 0;

	}
	OutputBits = OutputBits + j;

	uint32_t BinaryMessageLength[64];
	for (int i = 0; i < 64; i++)
	{
		BinaryMessageLength[i] = 0;
	}

//	printf("\nOriginal message length=%lu\n", OriginalMessageLength);
	int OutputLength = DecToBinary(OriginalMessageLength, BinaryMessageLength);

	for (int i = 0; i < OutputLength; i++)
	{
		BinaryMessageLength[64 - OutputLength + i] = BinaryMessageLength[i];
		BinaryMessageLength[i] = 0;
	}

	int temp;
	for (int i = (64 - OutputLength), j = 0; i < 64 - (OutputLength / 2);
			i++, j++)
	{
		temp = BinaryMessageLength[i];
		BinaryMessageLength[i] = BinaryMessageLength[63 - j];
		BinaryMessageLength[63 - j] = temp;
	}

	for (int i = OutputBits, j = 0; i < 512; i++, j++)
	{

		OutputBitsInteger[i] = BinaryMessageLength[j];

	}
	uint32_t *FinalHash;

//! Passing the Output of the pre-processing (512 bits) to the sha1 function.
//! The previous hash to the sha1 is given as NULL/0.
	FinalHash=sha1(OutputBitsInteger, 0);

	printf("\nMessage Digest is=\n");
	for(int i=0;i<5;i++)
	{
		//! Optional Program: Transmitting computed Hash to the JTAG UART console on the PC.
		alt_printf("%x\t",FinalHash[i]);
	}

	static char hash_array[] = {"44877bf4379e5486f63c89fd2e89188a341b5df6\0"};
	printf("\nInitial Saved Hash: %s", hash_array);
	char buffer[20];
	char FinalHash_Array[33] = "\0";
	for(int i=0; i<5; i++)
	{
		itoa(FinalHash[i], buffer, 16);
		strcat(FinalHash_Array, buffer);
	}
	printf("\nFinal Hash: %s",FinalHash_Array);

	//! Mandatory: Turn on all eight LEDs when the computed hash matches the anticipated one.
	LED = 0xFF; //Initially the LEDs are off
	if(strcmp(hash_array, FinalHash_Array) == 0)
	{
		LED = 0x00;
		printf("\nHash values are same");
	}
	else
	{
		LED = 0xFF;
		printf("\nHash values are mismatching!!");
	}
	return 0;

}

