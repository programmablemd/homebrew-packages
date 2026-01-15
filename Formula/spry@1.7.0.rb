class SpryAT170 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.7.0"
  license "MIT"

  url "https://github.com/programmablemd/packages/releases/download/v1.7.0/spry-macos.tar.gz"
  sha256 "45226e3c3bbeaad28dd1d57ab1a090633bce062a144d23f822f1b1118920846c"

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.7.0/spry_1.7.0-ubuntu22.04u1_amd64.deb"
    sha256 "32e6544a1cfd532b456f5e51de02c3267cf6ab6d21f19084fa635c72181aa7ba"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.7.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
