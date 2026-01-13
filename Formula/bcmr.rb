class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.24"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.24/bcmr-aarch64-macos.tar.gz"
      sha256 "d9c0d2f83fd98611ed7ff2e2f61edeedc0b03e24068a8cbb39f4383cec0819aa"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.24/bcmr-x86_64-macos.tar.gz"
      sha256 "1b4737f9012bbb6c887beab3dec8eb32e30e5a9e15fe713cb52eccebcbafd317"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.24/bcmr-x86_64-linux.tar.gz"
    sha256 "93ecba5cfe1b7599862ac67c4f4e7d7019061191d69894a7d56802f48adb0639"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
