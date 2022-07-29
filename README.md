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

---

<p align="center">
  <b><font size="+3">
    WARNING: These packages are a WORK IN PROGRESS and NOT production ready!
    <br>
    See the [TODO](/TODO.md) for current status.
  </font size="+3"></b>
</p>

---

* A [Homebrew](https://brew.sh/) [tap](https://docs.brew.sh/Taps) for
  the [**REDUCE**](https://reduce-algebra.sourceforge.io/) portable
  general-purpose computer algebra system, and related packages.

## Table of Contents

<!-- toc -->
- [Overview](#overview)
- [Availability](#availability)
- [Stable Packges](#stable-packges)
  * [REDUCE](#reduce)
  * [Run-REDUCE](#run-reduce)
- [Current Packages](#current-packages)
  * [REDUCE](#reduce-1)
  * [Run-REDUCE](#run-reduce-1)
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

## Stable Packges

* The **stable** packages are based primarily on
  [released code snapshots](https://sourceforge.net/projects/reduce-algebra/files/).
* These snapshots are released upstream approximately **5 times per year**.
* Most users should use these stable packages.

### REDUCE

* The most recent *`reduce`* package is revision **6339**, released
  **2022-06-17**.

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

## Current Packages

* The **current** packages are based on unreleased (and *potentially*
  *unstable*)
  [SVN](https://sourceforge.net/p/reduce-algebra/code/commit_browser)
  code.
* These packages are updated approximately **once per week**.

### REDUCE

* The most recent *`reduce-current`* package is revision **6357**, updated
  **2022-07-25**.

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
