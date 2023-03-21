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
# REDUCE

* [Homebrew](https://brew.sh/) [tap](https://docs.brew.sh/Taps) for
  the [**REDUCE**](https://reduce-algebra.sourceforge.io/) portable
  general-purpose computer algebra system.

## Table of Contents

<!-- toc -->
- [Overview](#overview)
- [Stable Packge](#stable-packge)
- [Current Package](#current-package)
- [Distribution Builder](#distribution-builder)
- [External Links](#external-links)
<!-- tocstop -->

## Overview

* [**REDUCE**](https://reduce-algebra.sourceforge.io/) is a freely available
  open-source system for general algebraic computations, of interest to
  mathematicians, scientists, and engineers. It can be used interactively for
  simple calculations, but also provides a flexible and expressive user
  programming language. **REDUCE** has a long and distinguished place in the
  history of computer algebra systems.

* Only macOS is supported at this time.  Linux support is planned for a
  future update.

## Stable Packge

* The **stable** macOS package is based on the most recent
  [stable snapshot](https://sourceforge.net/projects/reduce-algebra/files/).
* These **stable** releases are produced approximately **5 times per year**.
[]()
* The most recent **stable** *`reduce`* package is revision **6547**, released
  **2023-03-08**.
  []()
  &nbsp;
  []()
  &nbsp;
  ```sh
  brew tap reduce-algebra/reduce-algebra
  brew install reduce --verbose
  ```

## Current Package

* The **current** macOS package is based on a recent
  [Subversion](https://sourceforge.net/p/reduce-algebra/code/commit_browser)
  repository checkout.
[]()
* The most recent *`reduce-current`* package is revision **6550**, updated
  **2023-03-11**.
  []()
  &nbsp;
  []()
  &nbsp;
  ```sh
  brew tap reduce-algebra/reduce-algebra
  brew install reduce-current --verbose
  ```

## Distribution Builder

* The **distribution builder** (*`reduce-static`*) is a special-purpose formula
  to help package maintainers build distributable binary packages.
* These packages are *statically linked* so they work without external
  dependencies and do not require Homebrew to use.
* The stable version is built by default.  The `--HEAD` argument may be
  specified to build from the most recent Subversion commit.
  []()&nbsp;
  &nbsp;
  []()&nbsp;
  &nbsp;
  ```sh
  brew tap reduce-algebra/reduce-algebra
  brew install reduce-static --only-dependencies --verbose
  brew install reduce-static --build-bottle --verbose
  package-reduce.sh
  ```

## External Links

* [REDUCE Computer Algebra System](https://reduce-algebra.sourceforge.io/)
* [localbrew](https://github.com/johnsonjh/localbrew) - `virtualenv`-like
  Homebrew environments.
