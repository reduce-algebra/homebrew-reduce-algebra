class Reduce < Formula
  desc "Portable general-purpose interactive computer algebra system"
  homepage "https://reduce-algebra.sourceforge.io"
  url "https://downloads.sourceforge.net/project/reduce-algebra/snapshot_2022-06-17/Reduce-svn6339-src.tar.gz"
  version "6339"
  sha256 "fba8567372126431bd60a14d780dc584e4677eb3275af351a5109552e7a62d4a"
  license "BSD-2-Clause"
  head "https://svn.code.sf.net/p/reduce-algebra/code/trunk"

  # Supports REDUCE builds from stable release snapshots or Subversion HEAD.

  bottle do
    root_url "https://github.com/johnsonjh/homebrew-reduce-algebra/releases/download/reduce-6339"
    sha256 monterey: "763bc5a262c8691034cdf4ec3dd31bc76ba168d34af4ec485020c8ff7edc21aa"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "ccache" => :build
  depends_on "coreutils" => :build
  depends_on "libtool" => :build
  depends_on "make" => :build
  depends_on "perl" => :build
  depends_on "texlive" => :build

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
    depends_on "gnu-sed" => [:build, :test]
    depends_on "gnu-time" => [:build, :test]
    depends_on "libiconv"
  end

  # Regarding inreplace patching:
  #
  # > inreplace should be used instead of patches when patching something that will
  # > never be accepted upstream, e.g. making the software’s build system respect
  # > Homebrew’s installation hierarchy. If it’s something that affects both Homebrew
  # > and MacPorts (i.e. macOS specific) it should be turned into an upstream submitted
  # > patch instead.
  #
  # The inreplace patching done by this formula override upstream values that are
  # hard-coded to work exclusively with MacPorts. The patching as done below is
  # preferred by the upstream, as they cannot maintain alternative recipes for
  # packaging systems beyond MacPorts, but in no way intend to limit the availability
  # of REDUCE only to MacPorts users (or pre-compiled binaries):
  #
  # > The eccentric code that "insists" that you use [only] the "macports" versions of
  # > many libraries, and links with the .a files, not the .dyld ones, is so that our
  # > resulting executable is easier to distribute.
  #
  # > Since CSL and REDUCE are provided under an open source license [package
  # > maintainers] OF COURSE have the right to [...] re-link against any alternative
  # > versions of any of the libraries.
  #
  # > The [hard-coded] linking paths [and linking] against the .a rather than the
  # > .dylib versions is only to make our distribution here simpler, and not to
  # > try to lock anybody in (or out) of anything.
  #
  # I'm working with the upstream to see if a more robust solution can be implemented.

  def install
    # Configuration: Use `gnubin` for GNU sed and GNU time on macOS
    if OS.mac?
      ENV.prepend_path "PATH", Formula["gnu-sed"].opt_libexec/"gnubin"
      ENV.prepend_path "PATH", Formula["gnu-time"].opt_libexec/"gnubin"
    end

    # Configuration: Rewrite CSL hard-coded paths to use system provided libraries
    inreplace "csl/cslbase/configure.ac", "$LL/libbz2.a",
                                          "-lbz2"
    inreplace "csl/cslbase/configure.ac", "$LL/libcurses.a",
                                          "-lncurses"
    inreplace "csl/cslbase/configure.ac", "$LL/libexpat.a",
                                          "-lexpat"
    inreplace "csl/cslbase/configure.ac", "$LL/libiconv.a",
                                          "-liconv"
    inreplace "csl/cslbase/configure.ac", "$LL/libz.a",
                                          "-lz"

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
    inreplace "csl/cslbase/configure.ac", "$HOME/ports",
                                          "/dev/null"
    inreplace "csl/cslbase/configure.ac", "/opt/local",
                                          "/dev/null"
    inreplace "csl/cslbase/configure.ac", "/opt/X11",
                                          "/dev/null"

    # Configuration: Remove the unnecessary `-fno-common` usage which reduces optimization
    # NOTE: Upstream notes this is to remain there as "insurance" to avoid support issues.
    inreplace "csl/cslbase/configure.ac", " -fno-common", " "

    # Configuration: Execute LaTeX builds in unattended non-stop mode (non-interactive)
    inreplace "csl/cslbase/Makefile",     "pdflatex ",
                                          "pdflatex -interaction=nonstopmode "
    inreplace "doc/manual/mkpdf.sh",      "pdflatex ",
                                          "pdflatex -interaction=nonstopmode "
    inreplace "doc/misc/mkpdf.sh",        "pdflatex ",
                                          "pdflatex -interaction=nonstopmode "
    inreplace "psl/dist/manual/mkpdf.sh", "pdflatex ",
                                          "pdflatex -interaction=nonstopmode "

    # Configuration: Skip LaTeX -> HTML documentation generation
    # XXX: Skipped because the HTML generation requires pressing Return (interactively)
    # inreplace "doc/manual/mkhtml.sh",      "#!/bin/sh", "exit 0"
    # inreplace "psl/dist/manual/mkhtml.sh", "#!/bin/sh", "exit 0"

    # Configuration: Generate configure scripts for both CSL and PSL REDUCE
    system "./autogen.sh", "--fast", *std_configure_args,
                                     "--with-csl",
                                     "--with-psl"

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

    # Build doc: Build the miscellaneous documentation and REDUCE manual
    system "make", "-C", "doc/misc"
    system "make", "-C", "doc/manual"
    touch "doc.stamp"

    # TODO: Build and/or install libreduce, qreduce, rbench, rlsmt
    touch ".stamp"

    # Installation: Create initial installation (excluding source archive and associated README)
    mkdir "macbuild/distrib"
    touch "macbuild/Reduce-source_release.tar.bz2"
    touch "macbuild/README.for.distribution"
    system "sh", "-c", 'cd macbuild && ./copyfiles.sh "$(realpath ..)" "release"'
    rm "macbuild/distrib/Reduce-source_release.tar.bz2"
    rm "macbuild/distrib/README"
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
      doc.mkpath
      doc.install "reduce-manual.pdf"
    end
    share.mkpath
    share.install "contrib"
    man.mkpath
    cd "generic/breduce" do
      bin.install "breduce"
      man.install "breduce.1"
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
    cd "generic" do
      share.install "emacs"
      share.install "texmacs"
    end
    cd "doc/primers" do
      doc.install "insidereduce.pdf"
      doc.install "primer.pdf"
      doc.install "sl.pdf"
    end
    cd "debianbuild/reduce/debian" do
      man.install "csl.1"
      man.install "redcsl.1"
      man.install "redpsl.1"
    end
    man.install "generic/newfront/redfront.1"
    ln_s bin/"redcsl", bin/"reduce"
    doc.install "ACN-projects.doc"
    doc.install "BUGS"
    doc.install "doc/projects.txt"

    # XXX explicit fail for debugging
    false
  end

  test do
    # TODO: Run the CSL and PSL REDUCE test suites and benchmarks
    system "sh", "-c", "printf '%s\n' 'quit;' | #{bin}/reduce -v"
    system "sh", "-c", "printf '%s\n' 'quit;' | #{bin}/redcsl -v"
    system "sh", "-c", "printf '%s\n' 'quit;' | #{bin}/redpsl -v"
  end
end
