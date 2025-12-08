class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.100.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/vv0.100.7/spry-macos.tar.gz"
      sha256 "39c5f443cd5d674e3daf7d1b46c859debf00ad6201415a0275a3c53a6a8835f8"
    else
      url "https://github.com/programmablemd/packages/releases/download/vv0.100.7/spry-macos.tar.gz"
      sha256 "452e879cb8b2040b09d9bf40a47b49ceeb9d9dcf14ddbe15d9298c960eb452fc"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/vv0.100.7/spry-sqlpage_0.100.7-ubuntu22.04u1_amd64.deb"
    sha256 "8fc97288dbc5259e30b48fe25438993698f8e834fd9904f7f191248d91e23de1"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry-sqlpage_0.100.7-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

