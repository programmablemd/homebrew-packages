class SpryAT01031 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.103.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.103.1/spry-macos.tar.gz"
      sha256 "62e3214bb3dcd24d932017091c8b9e188d838e0cec8a300f7424fce05d93292b"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.103.1/spry-macos.tar.gz"
      sha256 "62e3214bb3dcd24d932017091c8b9e188d838e0cec8a300f7424fce05d93292b"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.103.1/spry_0.103.1-ubuntu22.04u1_amd64.deb"
    sha256 "a328a4465fc4e27f6571d0741aad540594c9b705b498430321130a206c7a899a"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.103.1-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
