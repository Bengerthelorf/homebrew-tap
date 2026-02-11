class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.6"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.6/pikpaktui-aarch64-macos.tar.gz"
      sha256 "0099c5d265ee00b647e6e81f618ecef8078860eee70c2c4b2ebc205585c3e3af"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.6/pikpaktui-x86_64-macos.tar.gz"
      sha256 "546920c90a33bfffff6bcbfbddc9783753ad7aca2c22aa6faed22bcce6ee5372"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.6/pikpaktui-x86_64-linux.tar.gz"
    sha256 "78eef0e1c936280742a7988ae2d7a7692cf6aa487a9488e3df38577241a2e311"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
