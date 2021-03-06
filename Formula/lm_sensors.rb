class LmSensors < Formula
  desc "Tools for monitoring the temperatures, voltages, and fans"
  homepage "https://github.com/groeck/lm-sensors"
  url "https://ftp.gwdg.de/pub/linux/misc/lm-sensors/lm_sensors-3.4.0.tar.bz2"
  mirror "ftp://ftp.gwdg.de/pub/linux/misc/lm-sensors/lm_sensors-3.4.0.tar.bz2"
  sha256 "e0579016081a262dd23eafe1d22b41ebde78921e73a1dcef71e05e424340061f"

  bottle do
    sha256 "cc4ce6897b9200d05ad1990beb44d166afa0d2a3e93c7db0a2f370f26cd4ef6f" => :x86_64_linux
  end

  depends_on "bison" => :build
  depends_on "flex" => :build

  def install
    args = %W[
      PREFIX=#{prefix}
      BUILD_STATIC_LIB=0
      MANDIR=#{man}
      ETCDIR=#{prefix}/etc
    ]
    system "make", *args
    system "make", *args, "install"
  end
end
