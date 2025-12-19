class SpryAT01092 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.109.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.109.2/spry-macos.tar.gz"
      sha256 "2d46913afd9bf06113ca530d5368b710519e45d22bdf931be87aa07a778cb9cc"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.109.2/spry-macos.tar.gz"
      sha256 "2d46913afd9bf06113ca530d5368b710519e45d22bdf931be87aa07a778cb9cc"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.109.2/spry_0.109.2-ubuntu22.04u1_amd64.deb"
    sha256 "0ffa0977a68fec28344c39da95c19ef9fe29bfafbaa8c0beff2e29c1f1edd5ba"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.109.2-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
