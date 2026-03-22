class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.55"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.55/pikpaktui-aarch64-macos.tar.gz"
      sha256 "530654550f9542bc8d8a6acc2d4fc6552bdf827b938ef7a79b5261db906cfddd"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.55/pikpaktui-x86_64-macos.tar.gz"
      sha256 "5e5b43d8fe25e0da8489493bf029fcc73409a4fb9e10c10e957c8596a98da791"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.55/pikpaktui-x86_64-linux.tar.gz"
    sha256 "1124a76e1c7c902d47da3ea8cdb651bee6558b630d8e553bf7f7f2ec50b5a119"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
