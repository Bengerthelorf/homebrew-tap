class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.12"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.12/pikpaktui-aarch64-macos.tar.gz"
      sha256 "1486bd1befb0a6ecf3cdb8d411002e12fcc10e7c5d4fb72fb95f21840a263ad7"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.12/pikpaktui-x86_64-macos.tar.gz"
      sha256 "b876d2b4e84ebecc91c9c7e801b0b16fc1f5518874b073e36c57e85dcb231964"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.12/pikpaktui-x86_64-linux.tar.gz"
    sha256 "1ac53abb4b00e16f97420d332a73fb7a962ab021f5af3b873c458ae32245014c"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
