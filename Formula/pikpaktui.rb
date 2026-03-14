class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.53"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.53/pikpaktui-aarch64-macos.tar.gz"
      sha256 "e4a460cb086d22c70ae4ca1b1655632935dadb12632f78bd2e4e369b8a256b8d"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.53/pikpaktui-x86_64-macos.tar.gz"
      sha256 "8f6fc0d8ce07b482f4823593ff5bc91d49d81d721e2deeaa1942d39d4194d791"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.53/pikpaktui-x86_64-linux.tar.gz"
    sha256 "5d8430be1f88daac0fdaa37609ed43c4d2389cb64a65f3e59fa6d25326580b97"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
