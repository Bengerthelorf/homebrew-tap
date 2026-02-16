class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.29"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.29/pikpaktui-aarch64-macos.tar.gz"
      sha256 "22f9bcd6e60547645d9c26268d9dc09a1db4c03a187ef92775542f2743bddea8"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.29/pikpaktui-x86_64-macos.tar.gz"
      sha256 "85807646d8bf539f42733628956118d2829169320b5381e5b1aa7a8f7de63199"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.29/pikpaktui-x86_64-linux.tar.gz"
    sha256 "44aab55205463cbab0b9806190b013222c92c0725175fee94d63e3ba58b60ca8"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
