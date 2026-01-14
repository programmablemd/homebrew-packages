class SpryAT160 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.6.0"
  license "MIT"

  url "https://github.com/programmablemd/packages/releases/download/v1.6.0/spry-macos.tar.gz"
  sha256 "e1cb31723c8bece2743d4cc725922130f8e4fe47df6e753ab0a3194a88410cdf"

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.6.0/spry_1.6.0-ubuntu22.04u1_amd64.deb"
    sha256 "8fde394264aab9fe77dd2fb5223c8914b23772422d1d15caf8a933b73a05f8c2"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.6.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
