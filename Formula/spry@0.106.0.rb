class SpryAT01060 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.106.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.106.0/spry-macos.tar.gz"
      sha256 "1d446eb7ab576b633dbc5382b736943a1d862ffedaac7ca2e0f4c6d4b1586824"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.106.0/spry-macos.tar.gz"
      sha256 "1d446eb7ab576b633dbc5382b736943a1d862ffedaac7ca2e0f4c6d4b1586824"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.106.0/spry_0.106.0-ubuntu22.04u1_amd64.deb"
    sha256 "07fd2685a538f9dab81af6cc720b039a3f44dd7ce2508e62bb70b4556bf1ce8f"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.106.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
