class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.15"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.15/pikpaktui-aarch64-macos.tar.gz"
      sha256 "688723028f06fa2e3aa253923758af327e31f0b12feb24b337c2902e321706a6"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.15/pikpaktui-x86_64-macos.tar.gz"
      sha256 "92b7a1954e74a370ba4b7e5afc3c8f417a0095a51720bb5e194c3c8464d5d927"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.15/pikpaktui-x86_64-linux.tar.gz"
    sha256 "5faf6e216b2571733904f8a70742a1f9e0460ce38a970764d5053813fb168832"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
