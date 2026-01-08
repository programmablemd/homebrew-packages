class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.0.3"
  license "MIT"

  on_macos do
    url "https://github.com/programmablemd/packages/releases/download/v1.0.3/spry-macos.tar.gz"
    sha256 "2e485e3e3ec0d6d1a1bbe86a3fd126fd8cf1b548fe2f9ad16b6ac9f57a94c149"
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.0.3/spry_1.0.3-ubuntu22.04u1_amd64.deb"
    sha256 "7c51ae43abc3df9ba916274c6711a9b46a7cb1bf7992c136aed84c7dcdf24f37"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.0.3-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

