class SpryAT01001 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.100.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.100.1/spry-macos.tar.gz"
      sha256 "01a46159993a24c85a364d2dd1a076d2f1ec2af3e9c250128a8d1f8cb9e48737"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.100.1/spry-macos.tar.gz"
      sha256 "01a46159993a24c85a364d2dd1a076d2f1ec2af3e9c250128a8d1f8cb9e48737"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.100.1/spry_0.100.1-ubuntu22.04u1_amd64.deb"
    sha256 "1656d9b01cad66c185a3c1832d50ba960648f2d5166911b3a6cc4b9354dc411a"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.100.1-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
