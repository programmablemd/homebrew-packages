class SpryAT177 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.7.7"
  license "MIT"

  url "https://github.com/programmablemd/packages/releases/download/v1.7.7/spry-macos.tar.gz"
  sha256 "1fcf1fd597a143473c0a4b02f808e637f85808e35297810f48d8147893f56525"

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.7.7/spry_1.7.7-ubuntu22.04u1_amd64.deb"
    sha256 "19dbe992c657bd07bed154747cfc1f1146735d203a51a71a284742dee86959ad"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.7.7-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
