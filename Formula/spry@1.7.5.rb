class SpryAT175 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.7.5"
  license "MIT"

  url "https://github.com/programmablemd/packages/releases/download/v1.7.5/spry-macos.tar.gz"
  sha256 "1d3a29ceddb8ce54c81cc3a00ec1b44304509dac5ec9932730df0daed1a3e885"

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.7.5/spry_1.7.5-ubuntu22.04u1_amd64.deb"
    sha256 "c1dfc0ffaaef3a23a6c39ef0afdbdff5e9e50ec6a0b0bfafab6a91971543ee93"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.7.5-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
