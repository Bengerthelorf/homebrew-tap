class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.25"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.25/pikpaktui-aarch64-macos.tar.gz"
      sha256 "194d442f8bf558fa210de70fa0c50bfacffd6931193be07181b5e7cc59784707"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.25/pikpaktui-x86_64-macos.tar.gz"
      sha256 "f6425f4b5a513d49772ceaed0e332714d65197bffb329056f160aa3761b12db2"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.25/pikpaktui-x86_64-linux.tar.gz"
    sha256 "71c9f7e72252bd4fe75312a692cf4f81923d3cd30c84699739e68c21ddab9b99"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
