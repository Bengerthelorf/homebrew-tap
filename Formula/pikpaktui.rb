class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.37"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.37/pikpaktui-aarch64-macos.tar.gz"
      sha256 "fcd2e1763c430f1864d11cb72b5b0b9526215cd1099a78a23347c1b32a9b0d2d"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.37/pikpaktui-x86_64-macos.tar.gz"
      sha256 "91bc4dcbb2d18f7b9c3cf603aa2ec6327e68c7e6c7a85082615b495736687b6a"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.37/pikpaktui-x86_64-linux.tar.gz"
    sha256 "f3ce868ff9972ac8bc96b1f7fafb86052aad48eabacd013a298cdbf4b4c689c0"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
