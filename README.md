# SHA1_HardwareAccelerator

Design and Implementation of a SHA-1 Hardware Accelerator using System Verilog and C on NIOS II

## Laboratory Assignment Part #1

This assignment represents the first part of our journey towards implementing an FPGA based SHA-1 hardware accelerator. It is subdivided in a practical and theoretical section. The practical task is about implementing the SHA-1 algorithm in C.

## Laboratory Assignment Part #2

The first lab assignment was about implementing the SHA-1 algorithm in ANSI C on an x86/GNU Linux target. The aim of the second lab assignment is now to run this code on an FPGA-based embedded softcore processor as a bare-metal application.

## Laboratory Assignment Part #3

SHA-1 is a cryptographic hash function developed by the United States National Security Agency (NSA) and is specified in the Secure Hash Standard (SHS) published by the National Institute of Standards and Technology (NIST). It was originally published in 1995 and was one of the most widely used hashing methods for creating digital signatures and verifying file integrity.

The basic idea behind the algorithm is to take the input data and perform a series of mathematical operations on it to produce a unique fixed-size output (the 'hash'). The operations include bitwise operations, modular additions, and logical functions. The input data is processed in 512-bit blocks, and the output of each block is used as input for the next block, making it a 'hash chain'.

This third lab assignment is now about implementing the SHA-1 algorithm in SystemVerilog. The result should represent a one-to-one hardware equivalent of the previously developed software implementation. As it was the case in the previous assignments, our implementation only operates on a single pre-processed 512-bit block rather than a message that is made-up of multiple blocks.