class SpryAT01081 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.108.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.108.1/spry-macos.tar.gz"
      sha256 "bf5938d92be0afcb090d02c617355974519ec5651126778a6f7fd8339c759e17"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.108.1/spry-macos.tar.gz"
      sha256 "bf5938d92be0afcb090d02c617355974519ec5651126778a6f7fd8339c759e17"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.108.1/spry_0.108.1-ubuntu22.04u1_amd64.deb"
    sha256 "6ed085379d0f477a67e5b1ced7f48cb10dd77d743c096eb11e82060d57498111"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.108.1-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
