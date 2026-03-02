class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.44"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.44/pikpaktui-aarch64-macos.tar.gz"
      sha256 "7b2e32bf5b4375fa5204a3c85580db03a2dc364ac4d8dcf5dda6738857313526"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.44/pikpaktui-x86_64-macos.tar.gz"
      sha256 "502a0f8df066b3a3854e65d5da50d070b86ee17a34b3ebea49593a2a42a66185"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.44/pikpaktui-x86_64-linux.tar.gz"
    sha256 "9a571db7eba0ef9f6bf6a9394acac45883f03059403f6397275a479f8587c176"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
