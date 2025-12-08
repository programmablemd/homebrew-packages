class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "vv0.100.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/vv0.100.7/spry-macos.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
      url "https://github.com/programmablemd/packages/releases/download/vv0.100.7/spry-macos.tar.gz"
      sha256 "452e879cb8b2040b09d9bf40a47b49ceeb9d9dcf14ddbe15d9298c960eb452fc"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/vv0.100.7/spry-sqlpage_v0.100.7-ubuntu22.04u1_amd64.deb"
    sha256 "8fc97288dbc5259e30b48fe25438993698f8e834fd9904f7f191248d91e23de1"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry-sqlpage_v0.100.7-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

