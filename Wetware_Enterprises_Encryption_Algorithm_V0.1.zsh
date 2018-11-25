#!/bin/zsh
# Encryption Algorithm for use by Wetware Enterprises Employees ONLY.
# Don't produce the correct reply to it's authentication checks and it will
# be bad for you. (Yes, you can CTRL+C it, but that means you're not
# decrypting anything either, now does it?)

# Maintainer; red0myr/und0myr (zubriket@gmail.com)
# https://www.github.com/Undomyr/GRAPEVINE.git
# Code distributed under the MIT License as follow;
# Copyright (c) 2018 Undomyr
#------------------------------------------------------------------------------#
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\#
#------------------------------------------------------------------------------#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#------------------------------------------------------------------------------#
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\#
#------------------------------------------------------------------------------#
# Use it at your own risk. . .

# This script requires you use ZSH as your shell, not BASH. (It might run
# when executed by Bash, it might not. Bash it at your own peril!)
#
# TO DO; <Function Description -> Function Name [ENUMERATOR]
# * Input function (file or direct text-string via CLI) -> "He" [|]
# * Authentication By N-Way Handshake -> "Ne" [||]
# * Pre-processor / Salt generator -> "Ar" [-|-]
# * PRNG based on [REDACHTED] for initial cipher -> "Kr" [-||-]
# * Fragmentation Function -> "Xe" [|-|-|]
# * Stage-I Encryption (Precise Sequence Not Public) -> "Rn" [|-+-|]
# * XOR-pass 1 -> "F" [+|-|+]
# * Stage-II Encryption -> "Cl" [=|+|=]
# * XOR-pass 2 -> "Br" [==-==]
# * Stage-III Encryption -> "I" [=|-||-|=]
# * Reassembler Function -> "At" [+=|-|=+]
# * Printer/Save Function -> "O" [|-|=+=|-|]

# Additional Functions/Algo's - PURPOSE AND DESIGN INTENTIONALLY NOT INCLUDED!
# 	<Name - Tag>
# * VISCOUNT - {*E*}
# * DVORYANICH - {=R=}
# * SEBASTOKRATOR - {-B-}

# Version : 0.1 (Pre-Alpha)
#------------------------------------------------------------------------------#
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\#
#------------------------------------------------------------------------------#
# REGEX used to locate Enumerators. These are "hooks" for recursive-execution.
# REGEX  matches are not printed to Standard Output but directly used in a
# If/Then/Else code-block that determines if the algorithm has been
# Executing in the correct order and to locate the next fragment.
# Every function adds it's own enumerator to the string upon exiting of the
# function. This Enumerator-tag is used by the reassembler to find the
# fragments of the original text/string to put the ciphertext back in the
# correct sequence upon decryption.
# Enumerators are not added as plain text, but rather are themselves encrypted
# via a hashing function that generates both a ciphertext-enumerator and
# a checksum. This checksum is used by the reassembler to verify that it has,
# indeed, put the ciphertext back in the correct order before passing it
# on to the decryption stages.
#
# CAUTION! Putting one of the enumerators in your input text will lead to
# encryption failure. The various functions checking for the presence of the
# enumerators will find them too early, leading to parts of text not being
# processes correctly, incorrect sequencing or rejection of the input and
# triggering the execution of VISCOUNT
#
# Helium Routine : Input of text voa CLI or plaintext file for encryption.
