<!-- vim: set ft=markdown ts=4 sw=4 tw=0 expandtab colorcolumn=80 :         -->
<!-- SPDX-License-Identifier: BSD-2-Clause                                  -->
<!--                                                                        -->
<!-- Copyright (c) 2023 Jeffrey H. Johnson <trnsz@pobox.com>                -->
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

* A [Homebrew](https://brew.sh/) [tap](https://docs.brew.sh/Taps) for
  the [**REDUCE**](https://reduce-algebra.sourceforge.io/) portable
  general-purpose computer algebra system, and related packages.

## Table of Contents

<!-- toc -->
- [Overview](#overview)
- [Availability](#availability)
- [Stable Packge](#stable-packges)
- [Current Package](#current-packages)
<!-- tocstop -->

## Overview

* [**REDUCE**](https://reduce-algebra.sourceforge.io/) is a freely available
  open source system for general algebraic computations, of interest to
  mathematicians, scientists, and engineers. It can be used interactively for
  simple calculations, but also provides a flexible and expressive user
  programming language. **REDUCE** has a long and distinguished place in the
  history of computer algebra systems.
<!--
* [**Run-REDUCE**](https://fjwright.github.io/Run-REDUCE/) is a
  [JavaFX](https://openjfx.io/)-based graphical user interface for running the
  **REDUCE** computer algebra system. It provides a consistent cross-platform
  user experience across all implementations of **REDUCE**.-->

## Availability

* Only **macOS** systems are supported at this time.

## Stable Packge

* The **stable** package is based on the most recent
  [stable snapshot](https://sourceforge.net/projects/reduce-algebra/files/).
* These releases are produced upstream approximately **5 times per year**.

### REDUCE

* The most recent stable *`reduce`* package is revision **6547**, released
  **2023-03-08**.

```sh
brew tap johnsonjh/reduce-algebra
brew install -q reduce
```
<!--
### Run-REDUCE

* The most recent *`run-reduce`* package is version **3.0**, released
  **2021-03-20**.
* **Run-REDUCE** requires
  [BellSoft Liberica LTS](https://bell-sw.com/pages/libericajdk/) and the
  [DejaVu font distribution](https://dejavu-fonts.github.io/).

```sh
brew tap bell-sw/liberica
brew install -q --cask liberica-jre17-full
brew tap homebrew/cask-fonts
brew install -q --cask font-dejavu
brew tap johnsonjh/reduce-algebra
brew install -q run-reduce
```-->

## Current Package

* The **current** package is based on the unreleased (and *potentially*
  *unstable*)
  [SVN](https://sourceforge.net/p/reduce-algebra/code/commit_browser)
  code.

### REDUCE

* The most recent *`reduce-current`* package is revision **6550**, updated
  **2023-03-11**.

```sh
brew tap johnsonjh/reduce-algebra
brew install -q reduce-current
```
<!--
### Run-REDUCE

* The most recent *`run-reduce-current`* package is version **3.0+gc25162**,
  updated **2021-04-19**.
* **Run-REDUCE** requires
  [BellSoft Liberica](https://bell-sw.com/pages/libericajdk/) and the
  [DejaVu font distribution](https://dejavu-fonts.github.io/).

```sh
brew tap bell-sw/liberica
brew install -q --cask liberica-jre18-full
brew tap homebrew/cask-fonts
brew install -q --cask font-dejavu
brew tap johnsonjh/reduce-algebra
brew install -q run-reduce-current
```-->
