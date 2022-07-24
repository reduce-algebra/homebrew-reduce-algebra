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
# REDUCE for Homebrew

[![license](https://img.shields.io/github/license/johnsonjh/homebrew-reduce-algebra.svg?color=blue)](/LICENSE)
[![updated](https://img.shields.io/github/last-commit/johnsonjh/homebrew-reduce-algebra.svg?color=blue&label=updated)](https://github.com/johnsonjh/homebrew-reduce-algebra/commits/master)

A [Homebrew](https://brew.sh/) [tap](https://docs.brew.sh/Taps) for
[**REDUCE**](https://reduce-algebra.sourceforge.io/), a portable
general-purpose computer algebra system.

## Overview

**REDUCE** is a freely available open-source interactive system for general
algebraic computations, of interest to mathematicians, scientists, and
engineers.

## Availability

* Only **macOS** systems are supported.

## Installation

### Stable

* The *`reduce`* package is built from the most recently released code, and
  updated 5 times per year (on average).
* The most recent *`reduce`* package is revision **6339** (2022-06-17).

It can be installed using:

```sh
brew tap johnsonjh/reduce-algebra
brew install reduce
```

---

### Current

* The *`reduce-current`* package is built from **unreleased** SVN code, and
  updated **5 times per week** (on average).
* The most recent *`reduce-current`* package is revision **6355** (2022-07-22).

It can be installed using:

```sh
brew tap johnsonjh/reduce-algebra
brew install reduce-current
```

---
