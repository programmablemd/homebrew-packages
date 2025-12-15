class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.106.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.106.0/spry-macos.tar.gz"
      sha256 "5a46cfc257a5c4798787af8385e52ca03ccc3947e0cf8dca7e9a7138eda50863"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.106.0/spry-macos.tar.gz"
      sha256 "5a46cfc257a5c4798787af8385e52ca03ccc3947e0cf8dca7e9a7138eda50863"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.106.0/spry_0.106.0-ubuntu22.04u1_amd64.deb"
    sha256 "2ed177de92ce102f2d7b5d5a3d7816b74b78f4875996df33c7792656719275e0"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.106.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

