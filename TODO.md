<!-- vim: set ft=markdown ts=4 sw=4 tw=0 expandtab colorcolumn=80 :         -->
<!-- SPDX-License-Identifier: BSD-2-Clause                                  -->
<!--                                                                        -->
<!-- Copyright (c) 2022 Jeffrey H. Johnson <trnsz@pobox.com>                -->
<!--                                                                        -->
<!-- Redistribution and use in source and binary forms, with or without     -->
<!-- modification, are permitted provided that the following conditions are -->
<!-- met:                                                                   -->
<!--                                                                        -->
<!--   1. Redistributions of source code must retain the relevant copyright -->
<!--      notice, this list of conditions and the following disclaimer.     -->
<!--                                                                        -->
<!--   2. Redistributions in binary form must reproduce the relevant        -->
<!--      copyright notice, this list of conditions and the following       -->
<!--      disclaimer in the documentation and/or other materials provided   -->
<!--      with the distribution.                                            -->
<!--                                                                        -->
<!-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    -->
<!-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      -->
<!-- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  -->
<!-- A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   -->
<!-- OWNERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, -->
<!-- SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       -->
<!-- LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  -->
<!-- DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  -->
<!-- THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    -->
<!-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  -->
<!-- OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   -->
<!--                                                                        -->
* TODO: Run the CSL and PSL REDUCE test suites and benchmarks
* TODO: Use libfaketime (already in Homebrew) to set the build date to the revision release date.
* TODO: REDUCE doesn't like Homebrew gnuplot:
  ```
  gnuplot> if(strstrt(GPVAL_TERMINALS,"aqua")!=0)set terminal aqua;;    set term x11;
  line 0: unknown or ambiguous terminal type; type just 'set terminal' for a list
  WARNING: Plotting with an 'unknown' terminal.
  No output will be generated. Please select a terminal with 'set terminal'.
  ```
* TODO: Test the Emacs REDUCE IDE
* TODO: Test the GNU TeXmacs plugin
* TODO: The default browser for GUI CSL REDUCE should be "/usr/bin/open" and not "firefox"
* TODO: The installed documentation path must be taught to GUI CSL REDUCE / Redfront
* TODO: Install rlsmt with the package
* TODO: Need to rebuild the breduce.pdf from LaTeX sources
* TODO: Include rbench and the regular test suite and benchmarks in the package?
* TODO: Build libreduce (as a separate dependant package?)
* TODO: Build qreduce (as a separate dependant package?)
* TODO: Build VSL and it's documentation (even if just for fun? as a separate package?)
* TODO: Check and normalize file permissions
* TODO: Support Homebrew on Linux
