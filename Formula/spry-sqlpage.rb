class SprySqlpage < Formula
  desc "Spry SQLPage CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.80.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.80.0/spry-sqlpage-macos.tar.gz"
      sha256 "c37e5835d8b3e1dc58638eb69b8052d4a7336b3a1820e0b124f8fcb3dfd5211e"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.80.0/spry-sqlpage-macos.tar.gz"
      sha256 "c37e5835d8b3e1dc58638eb69b8052d4a7336b3a1820e0b124f8fcb3dfd5211e"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.80.0/spry-sqlpage_0.80.0-ubuntu22.04u1_amd64.deb"
    sha256 "7723b98c6bba6b09b04379b916380c0be0887ad9c2309fe34301673a4315d5f4"
  end

  def install
    if OS.mac?
      bin.install "spry-sqlpage-macos" => "spry-sqlpage"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry-sqlpage_0.80.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry-sqlpage"
    end
  end

  test do
    system "#{bin}/spry-sqlpage", "--version"
  end
end

