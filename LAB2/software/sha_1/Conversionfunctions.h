/**
 * Conversionfunctions.h
 *
 *  Created on: 13 Nov 2022
 *  Author: Chaitreya Hegde and Girish Tabaraddi
 */

#ifndef CONVERSIONFUNCTIONS_H_
#define CONVERSIONFUNCTIONS_H_

#ifndef uint32_t
    typedef unsigned long uint32_t; /**< \brief 0 .. 4294967295      */
#endif

/**
 * This function takes the input string and converts into Binary
 * @param InputString
 * @return
 */
char* StringToBinary(char *InputString);

/**
 * This function converts the messagelength in Decimal to Binary value
 * It is used to append at the last of the input string - 64 bits.
 * @param MessageLength
 * @param ReturnBinaryValue
 * @return
 */
uint32_t DecToBinary(uint32_t MessageLength, uint32_t ReturnBinaryValue[64]);

/**
 * The function is used to return a decimal number by converting the binary array
 * Used to convert the word array (0-15) which is in binary to decimal values.
 * @param BinaryArray
 * @return
 */
uint32_t BinaryArraytoDec(unsigned short BinaryArray[32]);


#endif /* CONVERSIONFUNCTIONS_H_ */
