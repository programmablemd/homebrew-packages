class SpryAT176 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.7.6"
  license "MIT"

  url "https://github.com/programmablemd/packages/releases/download/v1.7.6/spry-macos.tar.gz"
  sha256 "60f75675426822abf1b8b2caa4e80ea19f396044b681e32367686180b8cd663d"

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.7.6/spry_1.7.6-ubuntu22.04u1_amd64.deb"
    sha256 "3abfdc03c52ba95948c0e32bb651c53212fa737125e9b890246eafbdeb43c6bf"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.7.6-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
