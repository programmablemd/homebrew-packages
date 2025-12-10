class SpryAT01021 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.102.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.102.1/spry-macos.tar.gz"
      sha256 "a881cae349e28e79e8b14443877e95e214a3ab2b1c84fe402965a82630ae2e70"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.102.1/spry-macos.tar.gz"
      sha256 "a881cae349e28e79e8b14443877e95e214a3ab2b1c84fe402965a82630ae2e70"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.102.1/spry_0.102.1-ubuntu22.04u1_amd64.deb"
    sha256 "a881cae349e28e79e8b14443877e95e214a3ab2b1c84fe402965a82630ae2e70"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.102.1-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
