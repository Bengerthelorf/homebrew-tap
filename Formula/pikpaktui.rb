class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.10"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.10/pikpaktui-aarch64-macos.tar.gz"
      sha256 "0e5e30d2c85af756e45d046dfb144c6cde234cf7ca1128e4bd1f2f70875c5172"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.10/pikpaktui-x86_64-macos.tar.gz"
      sha256 "89df5319fb78ad10c13dfeb5c1eade992f69fb7fced744a172be036b6e83eb64"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.10/pikpaktui-x86_64-linux.tar.gz"
    sha256 "306d30420d8fe3ad1343656c97d4cc1b2c3ef6d3fc18ae9057330bde54c0dbc7"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
