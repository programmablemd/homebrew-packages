class SpryAT01084 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.108.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.108.4/spry-macos.tar.gz"
      sha256 "22579a8e3dfbfeb410b942e3633d081901052e9b5a6f3566485a52f9567e7f3b"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.108.4/spry-macos.tar.gz"
      sha256 "22579a8e3dfbfeb410b942e3633d081901052e9b5a6f3566485a52f9567e7f3b"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.108.4/spry_0.108.4-ubuntu22.04u1_amd64.deb"
    sha256 "e0bbb5c78a29f687bad43da55b801000be22d546680d830ea74324556a0a6c18"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.108.4-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
