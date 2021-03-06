class Strace < Formula
  desc "Diagnostic, instructional, and debugging tool for the Linux kernel"
  homepage "https://strace.io/"
  url "https://downloads.sourceforge.net/project/strace/strace/4.18/strace-4.18.tar.xz"
  sha256 "89ad887c1e6226bdbca8da31d589cadea4be0744b142eb47b768086c937fca08"

  bottle do
    sha256 "4ceb8a2b4c14e0dec4e07e8b2684d3f08bb9d134b9de1158d8f493ff4f393efd" => :x86_64_linux
  end

  head do
    url "https://github.com/strace/strace.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  depends_on "linux-headers"

  def install
    system "./bootstrap" if build.head?
    system "./configure",
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    out = `"strace" "true" 2>&1` # strace the true command, redirect stderr to output
    assert_match "execve(", out
    assert_match "+++ exited with 0 +++", out
  end
end
