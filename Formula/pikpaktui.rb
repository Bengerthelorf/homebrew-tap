class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.14"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.14/pikpaktui-aarch64-macos.tar.gz"
      sha256 "ced88a0661733a58b1de7c6db749dda5b0878d0d2ac709d777f2588608f3151a"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.14/pikpaktui-x86_64-macos.tar.gz"
      sha256 "57c62476a1c353bf8f5ed7b337116f712244b513ec57c174579019332dcc4745"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.14/pikpaktui-x86_64-linux.tar.gz"
    sha256 "422feb6ebcb56478b80d513c69ea36ed1bf9755e650df2b3e0f75ddbaab93042"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
