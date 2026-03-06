class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.48"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.48/pikpaktui-aarch64-macos.tar.gz"
      sha256 "f2145003e74ddf6fcf73e2546f8bd1a5b971a297ff38081a010a734cfcadab0a"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.48/pikpaktui-x86_64-macos.tar.gz"
      sha256 "fb10a09b206d7f48cba56ddfcb397958aa295b89691ebd70a7c2348a642b1831"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.48/pikpaktui-x86_64-linux.tar.gz"
    sha256 "ad19b435156605b50fb816babb608c80beb6fbe44a39690460b2bd634d82082e"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
