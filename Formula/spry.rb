class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.5.2"
  license "MIT"

  on_macos do
    url "https://github.com/programmablemd/packages/releases/download/v1.5.2/spry-macos.tar.gz"
    sha256 "3d0c67edb34fc2c6fa2f945bb11a9de5e8c2ed68c139af361295d2f742007dfe"
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.5.2/spry_1.5.2-ubuntu22.04u1_amd64.deb"
    sha256 "e8840991440c8c6fe7f99673c92316daa43b837e22355da13b71dbac301cbbad"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.5.2-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

