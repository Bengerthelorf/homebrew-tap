class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.42"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.42/pikpaktui-aarch64-macos.tar.gz"
      sha256 "3e8b084c4bbb29a959727ccaa56ca247965a53b5fdc1a487af3d52008b010e04"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.42/pikpaktui-x86_64-macos.tar.gz"
      sha256 "43ea0b32aa9a599878354911d4cdbc3fab189e16152c52c1b10cabf1fca5b386"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.42/pikpaktui-x86_64-linux.tar.gz"
    sha256 "3488d2c811dae3ca2356efeaefcd345d8e99668ef14369a7c07bc8d0d8f7b81e"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
