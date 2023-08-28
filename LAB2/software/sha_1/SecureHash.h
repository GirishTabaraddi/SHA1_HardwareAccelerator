/**
 * SecureHash.h
 *
 *  Created on: 13 Nov 2022
 *  Author: Chaitreya Hegde and Girish Tabaraddi
 */

#ifndef SECUREHASH_H_
#define SECUREHASH_H_

#ifndef uint32_t
    typedef unsigned long uint32_t; /**< \brief 0 .. 4294967295      */
#endif


/**
 * This SHA1 function takes two arguments, message pointer and previous hash and calculates the Final Hash depending on the compression formulas.
 * @param m_ptr
 * @param prev_hash
 * @return Final Hash of 160 bit in 5 chunks of 32 bit each.
 */
uint32_t * sha1(const uint32_t * m_ptr, const uint32_t * prev_hash);

/**
 * The CicularShiftArray function takes the input word array and circular shifts the bits.
 *
 * @param InputWord
 * @param RotationValue
 * @return It returns the an array which has the circular shifted bits.
 */
unsigned short* CircularShiftArray(unsigned short InputWord[32], uint32_t RotationValue);

/**
 * this function shifts the Input Hex value depending on the Rotation value argument.
 * @param InputHex
 * @param RotationValue
 * @return returns the Hex shifted value
 */
unsigned long int  CircularShiftHex(unsigned long int InputHex, unsigned long int RotationValue);

/**
 * A Standard Logic function of the SHA1 algorithm.
 * @return
 */
uint32_t LogicalFunction();

/**
 * A Standard Logic function of the SHA1 algorithm.
 * @param i
 * @return constant hex values defined by SHA1 algorithm.
 */
uint32_t constantK(int i);

#endif /* SECUREHASH_H_ */
