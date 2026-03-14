class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.54"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.54/pikpaktui-aarch64-macos.tar.gz"
      sha256 "6ebbb9ecfdddc70707b0384a2ffe0f44dc25d856a1d149e8569bda54d6231c4b"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.54/pikpaktui-x86_64-macos.tar.gz"
      sha256 "640d189542e48c971a43b413fc2ad313985db89963e525250c59e80173fd6659"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.54/pikpaktui-x86_64-linux.tar.gz"
    sha256 "35517fd0833fe5729b6f61146cb6f30e1a72a9e92b6ab758ae4a7f9b247a0805"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
