class SpryAT170 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.7.0"
  license "MIT"

  url "https://github.com/programmablemd/packages/releases/download/v1.7.0/spry-macos.tar.gz"
  sha256 "a2a251f158635b1028a8c6d7ec5d4a80bd4fd346f481a57225b988d6d1be900b"

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.7.0/spry_1.7.0-ubuntu22.04u1_amd64.deb"
    sha256 "0965da082a909721cddacdc530001f864363b20e3f043e622e647ad35682d0dd"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.7.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
