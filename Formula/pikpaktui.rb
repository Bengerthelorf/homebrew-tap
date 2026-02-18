class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.36"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.36/pikpaktui-aarch64-macos.tar.gz"
      sha256 "63d2087d1b4f0c1b03828d78b10850b83929e01f347db440778a187ab6a1fafd"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.36/pikpaktui-x86_64-macos.tar.gz"
      sha256 "b4944d32235b72f293c549261ed861c4296fb661b050694de0af27bfa06140e2"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.36/pikpaktui-x86_64-linux.tar.gz"
    sha256 "c52f470954e6e8fd2cd7ae74c2f4f844ca63f14b33f24a38d702fbcd50fb3718"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
