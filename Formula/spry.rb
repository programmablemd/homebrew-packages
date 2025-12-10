class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.102.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.102.0/spry-macos.tar.gz"
      sha256 "5201ae9d4a8b923ce630ea596ae1a2fa9712bac39ce1ca759b25b0318ccae39d"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.102.0/spry-macos.tar.gz"
      sha256 "5201ae9d4a8b923ce630ea596ae1a2fa9712bac39ce1ca759b25b0318ccae39d"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.102.0/spry_0.102.0-ubuntu22.04u1_amd64.deb"
    sha256 "58e167b06fd518dbc59adbd06b73935bec9f15dee2793596497ba71a3716cd6f"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.102.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

