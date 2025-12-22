class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.111.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.111.0/spry-macos.tar.gz"
      sha256 "2127a3d5f425c01e1117b6a86dac53f373d8b49d5f14e64548ee33aed4829cda"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.111.0/spry-macos.tar.gz"
      sha256 "2127a3d5f425c01e1117b6a86dac53f373d8b49d5f14e64548ee33aed4829cda"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.111.0/spry_0.111.0-ubuntu22.04u1_amd64.deb"
    sha256 "364d9aaf0fe562d86a5ad9d6c4ecac8272fc182328890f80b2ed61dfea87f3ec"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.111.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

