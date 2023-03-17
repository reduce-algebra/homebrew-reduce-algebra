class Reduce < Formula
  # vim: set ft=ruby ts=2 sw=2 tw=0 expandtab colorcolumn=118:
  desc "Portable general-purpose interactive computer algebra system (stable release)"
  homepage "https://reduce-algebra.sourceforge.io"
  url "https://downloads.sourceforge.net/project/reduce-algebra/snapshot_2023-03-08/Reduce-svn6547-src.tar.gz"
  version "6547"
  sha256 "2890beac30d8c497c58bd7c73f6c507ecabe318ace28e85d9c5a15e7884ea5a8"
  # SPDX-License-Identifier: BSD-2-Clause
  license "BSD-2-Clause"

  # The following copyright statement applies to this Homebrew formula:
  # Copyright (c) 2009-present, Homebrew contributors

  livecheck do
    url "https://sourceforge.net/projects/reduce-algebra/rss?path=/"
    # regex(/Reduce-svn?(\d+)-src\.tar\.gz/i)
  end

  bottle do
    root_url "https://github.com/reduce-algebra/homebrew-reduce-algebra/releases/download/reduce-6547"
    sha256 cellar: :any, ventura: "a0978fcd1fd536633342c3119cb16c5fa10ef39678fd371c6bcaa1c9ac94e5c1"
  end

  depends_on "autoconf"  => :build
  depends_on "automake"  => :build
  depends_on "ccache"    => :build
  depends_on "coreutils" => :build
  depends_on "libtool"   => :build
  depends_on "make"      => :build
  depends_on "perl"      => :build
  depends_on "texlive"   => :build

  depends_on "brotli"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "gettext"
  depends_on "gnuplot"
  depends_on "libpng"
  depends_on "libx11"
  depends_on "libxau"
  depends_on "libxcb"
  depends_on "libxcursor"
  depends_on "libxdmcp"
  depends_on "libxext"
  depends_on "libxfixes"
  depends_on "libxft"
  depends_on "libxi"
  depends_on "libxrandr"
  depends_on "libxrender"
  depends_on :macos

  uses_from_macos "bzip2"
  uses_from_macos "expat"
  uses_from_macos "groff"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  on_macos do
    depends_on "gnu-sed"  => [:build, :test]
    depends_on "gnu-tar"  => [:build, :test]
    depends_on "gnu-time" => [:build, :test]
    depends_on "libiconv"
  end

  # > inreplace should be used instead of patches when patching something that will never be accepted upstream, e.g.
  # > making the software’s build system respect Homebrew’s installation hierarchy. If it’s something that affects
  # > both Homebrew and MacPorts (i.e. macOS specific) it should be turned into an upstream submitted patch instead.
  #
  # The inreplace patching done by this formula override upstream values that are hard-coded to work exclusively with
  # MacPorts. The patching as done below is preferred by the upstream, as they cannot maintain alternative recipes for
  # packaging systems beyond MacPorts, but in no way intend to limit the availability of REDUCE only to MacPorts users
  # (or pre-compiled binaries):
  #
  # > The eccentric code that "insists" that you use [only] the "macports" versions of many libraries, and links with
  # > the .a files, not the .dyld ones, is so that our resulting executable is easier to distribute.
  #
  # > Since CSL and REDUCE are provided under an open source license [package maintainers] OF COURSE have the right
  # > to [...] re-link against any alternative versions of any of the libraries. The [hard-coded] linking paths
  # > [and linking] against the .a rather than the .dylib versions is only to make our distribution here simpler, and
  # > not to try to lock anybody in (or out) of anything.

  conflicts_with "reduce-current", because: "both install the same binaries"

  def install
    # Configuration: Use `gnubin` for GNU sed/tar/time on macOS
    if OS.mac?
      ENV.prepend_path "PATH", Formula["gnu-sed"].opt_libexec/"gnubin"
      ENV.prepend_path "PATH", Formula["gnu-tar"].opt_libexec/"gnubin"
      ENV.prepend_path "PATH", Formula["gnu-time"].opt_libexec/"gnubin"
    end

    # Configuration: Rewrite CSL hard-coded paths to use system provided libraries
    inreplace "csl/cslbase/configure.ac", "$LL/libbz2.a",    "-lbz2"
    inreplace "csl/cslbase/configure.ac", "$LL/libcurses.a", "-lncurses"
    inreplace "csl/cslbase/configure.ac", "$LL/libexpat.a",  "-lexpat"
    inreplace "csl/cslbase/configure.ac", "$LL/libiconv.a",  "-liconv"
    inreplace "csl/cslbase/configure.ac", "$LL/libz.a",      "-lz"

    # Configuration: Rewrite FOX hard-coded paths to use Homebrew provided libraries
    inreplace "csl/fox/configure.ac", "-I/usr/local/include ", " "
    inreplace "csl/fox/configure.ac", "-I/usr/include/freetype2",
                                      "-I#{Formula["freetype"].opt_include}/freetype2"
    inreplace "csl/fox/configure.ac", "-I/usr/local/include/freetype2",
                                      "-I#{Formula["freetype"].opt_include}/freetype2"
    inreplace "csl/fox/configure.ac", "-I/opt/local/include/freetype2",
                                      "-I#{Formula["freetype"].opt_include}/freetype2"

    # Configuration: Rewrite CSL hard-coded paths to use Homebrew provided libraries
    inreplace "csl/cslbase/configure.ac", "-I/opt/local/include/freetype2",
                                          "-I#{Formula["freetype"].opt_include}/freetype2"
    inreplace "csl/cslbase/configure.ac", "$LL/libbrotlicommon-static.a",
                                          "-L#{Formula["brotli"].opt_lib} -lbrotlicommon"
    inreplace "csl/cslbase/configure.ac", "$LL/libbrotlidec-static.a",
                                          "-L#{Formula["brotli"].opt_lib} -lbrotlidec"
    inreplace "csl/cslbase/configure.ac", "$LL/libfontconfig.a",
                                          "-L#{Formula["fontconfig"].opt_lib} -lfontconfig"
    inreplace "csl/cslbase/configure.ac", "$LL/libfreetype.a",
                                          "-L#{Formula["freetype"].opt_lib} -lfreetype"
    inreplace "csl/cslbase/configure.ac", "$LL/libintl.a",
                                          "-L#{Formula["gettext"].opt_lib} -lintl"
    inreplace "csl/cslbase/configure.ac", "$LL/libpng.a",
                                          "-L#{Formula["libpng"].opt_lib} -lpng"
    inreplace "csl/cslbase/configure.ac", "$LL/libX11.a",
                                          "-L#{Formula["libx11"].opt_lib} -lX11"
    inreplace "csl/cslbase/configure.ac", "$LL/libXau.a",
                                          "-L#{Formula["libxau"].opt_lib} -lXau"
    inreplace "csl/cslbase/configure.ac", "$LL/libxcb.a",
                                          "-L#{Formula["libxcb"].opt_lib} -lxcb"
    inreplace "csl/cslbase/configure.ac", "$LL/libXcursor.a",
                                          "-L#{Formula["libxcursor"].opt_lib} -lXcursor"
    inreplace "csl/cslbase/configure.ac", "$LL/libXdmcp.a",
                                          "-L#{Formula["libxdmcp"].opt_lib} -lXdmcp"
    inreplace "csl/cslbase/configure.ac", "$LL/libXext.a",
                                          "-L#{Formula["libxext"].opt_lib} -lXext"
    inreplace "csl/cslbase/configure.ac", "$LL/libXfixes.a",
                                          "-L#{Formula["libxfixes"].opt_lib} -lXfixes"
    inreplace "csl/cslbase/configure.ac", "$LL/libXft.a",
                                          "-L#{Formula["libxft"].opt_lib} -lXft"
    inreplace "csl/cslbase/configure.ac", "$LL/libXrandr.a",
                                          "-L#{Formula["libxrandr"].opt_lib} -lXrandr"
    inreplace "csl/cslbase/configure.ac", "$LL/libXrender.a",
                                          "-L#{Formula["libxrender"].opt_lib} -lXrender"

    # Configuration: Rewrite CSL hard-coded paths to avoid polluting the build environment
    inreplace "csl/cslbase/configure.ac", "$HOME/ports", "/dev/null"
    inreplace "csl/cslbase/configure.ac", "/opt/local",  "/dev/null"
    inreplace "csl/cslbase/configure.ac", "/opt/X11",    "/dev/null"

    # Configuration: Remove the unnecessary `-fno-common` usage which reduces optimization
    # NOTE: Upstream notes this is to remain as "insurance" to avoid potential issues.
    inreplace "csl/cslbase/configure.ac", " -fno-common", " "

    # Configuration: Modify the hard-coded path used in the breduce man page to match the Homebrew path.
    inreplace "generic/breduce/breduce.1", "/usr/share/doc/reduce-addons/breduce.pdf", "#{doc}/breduce.pdf"

    # Configuration: Execute LaTeX builds in unattended non-stop mode (non-interactive)
    inreplace "csl/cslbase/Makefile",     "pdflatex ", "pdflatex -interaction=nonstopmode "
    inreplace "doc/manual/mkpdf.sh",      "pdflatex ", "pdflatex -interaction=nonstopmode "
    inreplace "doc/misc/mkpdf.sh",        "pdflatex ", "pdflatex -interaction=nonstopmode "
    inreplace "psl/dist/manual/mkpdf.sh", "pdflatex ", "pdflatex -interaction=nonstopmode "

    # Configuration: Modify the `copyfiles.sh` script to ease Homebrew build usage.
    inreplace "macbuild/copyfiles.sh", "cp -r ", "cp -pR "
    inreplace "macbuild/copyfiles.sh", "cp README.for.distribution distrib/README", " "
    inreplace "macbuild/copyfiles.sh", "cp Reduce-source_$2.tar.bz2 distrib/Reduce-source_$2.tar.bz2", " "
    inreplace "macbuild/copyfiles.sh", "cp $1/doc/manual/manual.pdf distrib/reduce-manual.pdf", " "

    # Configuration: Generate configure scripts for both CSL and PSL REDUCE
    system "./autogen.sh", "--fast", *std_configure_args, "--with-csl", "--with-psl"

    # Configuration: Configure to do a (one-shot) release build of both CSL and PSL REDUCE
    system "./configure", "-C", *std_configure_args,
                                "--disable-libtool-lock",
                                "--disable-option-checking",
                                "--with-ccache",
                                "--with-csl",
                                "--with-lto",
                                "--with-psl",
                                "--without-autogen"

    # Build libs: Build the local prerequisite components for CSL REDUCE
    system "sh", "-c", 'make -C "cslbuild/$(scripts/findhost.sh $(./config.guess))/fox"'
    system "sh", "-c", 'make -C "cslbuild/$(scripts/findhost.sh $(./config.guess))/crlibm"'
    system "sh", "-c", 'make -C "cslbuild/$(scripts/findhost.sh $(./config.guess))/softfloat"'
    system "sh", "-c", 'make -C "cslbuild/$(scripts/findhost.sh $(./config.guess))/libedit"'
    system "sh", "-c", 'make -C "cslbuild/$(scripts/findhost.sh $(./config.guess))/libffi"'

    # Build redcsl: Build CSL (Codemist Standard Lisp) REDUCE
    system "sh", "-c", 'make -C "cslbuild/$(scripts/findhost.sh $(./config.guess))/csl"'
    system "sh", "-c", 'make -C "cslbuild/$(scripts/findhost.sh $(./config.guess))/"'
    touch "csl.stamp"

    # Build redpsl: Build PSL (Portable Standard Lisp) REDUCE
    system "sh", "-c", 'make -C "pslbuild/$(scripts/findhost.sh $(./config.guess))"'
    touch "psl.stamp"

    # Build casefold: Build the case modification and normalization utility for REDUCE
    system "make", "-C", "generic/casefold", "casefold"
    touch "casefold.stamp"

    # Build texmacs: Build (decompress) the TeXmacs support to allow easy user utilization
    mkdir "generic/texmacs/texmacs"
    system "sh", "-c", "cd generic/texmacs && tar zxvf texmacs-plugin.tgz --no-same-owner -C texmacs"
    # NOTE: This removes unused temporary files that exist in some versions of the REDUCE distribution
    system "sh", "-c", "{ cd generic/texmacs/texmacs/reduce/progs && rm -f ./*~ 2> /dev/null || true ; }"

    # Build doc: Build the miscellaneous documentation and REDUCE manual
    system "make", "-C", "doc/misc",   "clean"
    system "make", "-C", "doc/misc",   "primer.pdf"
    system "make", "-C", "doc/misc",   "sl.pdf"
    system "make", "-C", "doc/manual", "clean"
    system "make", "-C", "doc/manual", "manual.pdf"
    system "make", "-C", "doc/manual", "index.html"
    system "make", "-C", "doc/manual", "rmtmpfiles"
    rm "doc/manual/Makefile"
    rm "doc/manual/README"
    rm Dir["doc/manual/*.bbl"]
    rm Dir["doc/manual/*.bib"]
    rm Dir["doc/manual/*.blg"]
    rm Dir["doc/manual/*.cfg"]
    rm Dir["doc/manual/*.dvi"]
    rm Dir["doc/manual/*.env"]
    rm Dir["doc/manual/*.eps"]
    rm Dir["doc/manual/*.htf"]
    rm Dir["doc/manual/*.ilg"]
    rm Dir["doc/manual/*.ind"]
    rm Dir["doc/manual/*.ist"]
    rm Dir["doc/manual/*.lg"]
    rm Dir["doc/manual/*.log"]
    rm Dir["doc/manual/*.sh"]
    rm Dir["doc/manual/*.tex"]
    rm Dir["doc/manual/turtleeg*"]
    mv "doc/manual/manual.pdf", "reduce-manual.pdf"
    mv "doc/manual", "doc/html"
    touch "doc.stamp"

    # Done with building.
    touch ".stamp"

    # Installation: Create initial installation using copyfiles script.
    system "sh", "-c", 'cd macbuild && ./copyfiles.sh "$(realpath ..)" "release"'
    cp "generic/casefold/casefold", "macbuild/distrib/casefold"

    # Installation: Finalize installation and arrange things to be where Homebrew expects
    prefix.install_metafiles
    cd "macbuild/distrib" do
      prefix.install_metafiles
      bin.mkpath
      bin.install "casefold"
      libexec.mkpath
      libexec.install "csl"
      libexec.install "psl"
      (bin/"csl").write <<~EOS
        #!/usr/bin/env sh
        { cd "#{libexec}/csl" && exec ./csl "${@}"; }
      EOS
      (bin/"redcsl").write <<~EOS
        #!/usr/bin/env sh
        { cd "#{libexec}/csl" && exec ./redcsl "${@}"; }
      EOS
      (bin/"rfcsl").write <<~EOS
        #!/usr/bin/env sh
        { cd "#{libexec}/csl" && exec ./rfcsl "${@}"; }
      EOS
      (bin/"bootstrapreduce").write <<~EOS
        #!/usr/bin/env sh
        { cd "#{libexec}/csl" && exec ./bootstrapreduce "${@}"; }
      EOS
      (bin/"rfpsl").write <<~EOS
        #!/usr/bin/env sh
        { cd "#{libexec}/psl" && exec ./rfpsl "${@}"; }
      EOS
      (bin/"redpsl").write <<~EOS
        #!/usr/bin/env sh
        { cd "#{libexec}/psl" && exec ./redpsl "${@}"; }
      EOS
    end
    doc.mkpath
    doc.install "reduce-manual.pdf"
    doc.install "doc/html"
    share.mkpath
    share.install "contrib"
    man.mkpath
    cd "generic/breduce" do
      bin.install "breduce"
      man1.install "breduce.1"
      chmod "-x", "breduce.pdf"
      doc.install "breduce.pdf"
    end
    mkdir_p share/"casefold"
    cd "generic/casefold" do
      (share/"casefold").install "caseclash.list"
      (share/"casefold").install "caseclash.red"
      (share/"casefold").install "trycase.sh"
      (share/"casefold").install "trycase.tst"
      (share/"casefold").install "trycase1.tst"
      (share/"casefold").install "README"
    end
    share.install "generic/emacs"
    share.install "generic/texmacs/texmacs"
    cd "doc/misc" do
      doc.install "primer.pdf"
      doc.install "sl.pdf"
    end
    cd "debianbuild/reduce/debian" do
      man1.install "csl.1"
      man1.install "redcsl.1"
      man1.install "redpsl.1"
    end
    man1.install "generic/newfront/redfront.1"
    ln_s bin/"redcsl", bin/"reduce"
    ln_s bin/"rfpsl", bin/"redfront"
    ln_s man1/"redcsl.1", man1/"reduce.1"
    ln_s man1/"redfront.1", man1/"rfcsl.1"
    ln_s man1/"redfront.1", man1/"rfpsl.1"
    chmod 0644, man1/"breduce.1"
    chmod 0644, man1/"csl.1"
    chmod 0644, man1/"redcsl.1"
    chmod 0644, man1/"redfront.1"
    chmod 0644, man1/"redpsl.1"
    chmod 0755, bin/"bootstrapreduce"
    chmod 0755, bin/"csl"
    chmod 0755, bin/"redcsl"
    chmod 0755, bin/"redfront"
    chmod 0755, bin/"redpsl"
    chmod 0755, bin/"reduce"
    chmod 0755, bin/"rfcsl"
    chmod 0755, bin/"rfpsl"
  end

  def caveats
    <<~EOS
      A GUI for REDUCE has been installed, requiring the X Window System.
        XQuartz is a freely available version of the X Window System for
        macOS available as a Homebrew Cask. To install XQuartz:
          brew install --cask xquartz

      A GNU TeXmacs plugin has been installed.
        To enable this plugin for your user, execute from a shell prompt:
          mkdir -p "$HOME/.TeXmacs/plugins" && \\
          rm -f "$HOME/.TeXmacs/plugins/reduce" && \\
          ln -s "#{share}/texmacs/reduce" "$HOME/.TeXmacs/plugins"

      REDUCE IDE, a GNU Emacs package providing an integrated development
        environment for REDUCE consisting of major modes for editing REDUCE
        code and for running REDUCE in an Emacs window has been installed.
        To enable this package for your user, execute from within GNU Emacs:
          package-install-file "#{share}/emacs/reduce-mode.el"
          package-install-file "#{share}/emacs/reduce-run.el"

      REDUCE manuals and reference documentation has been installed.
        To access this documentation, browse to the directory:
          "#{doc}"

      REDUCE documentation in HTML format has been installed.
        To make REDUCE aware of the HTML documentation, add the following
        line your "$HOME/.profile" or equivalent shell configuration file:
          REDUCE_HELP="#{doc}/html"
    EOS
  end

  test do
    system "sh", "-c", "printf '%s\\n' 'quit;' | #{bin}/reduce -v"
    system "sh", "-c", "printf '%s\\n' 'quit;' | #{bin}/redcsl -v"
    system "sh", "-c", "printf '%s\\n' 'quit;' | #{bin}/redpsl -v"
  end
end
