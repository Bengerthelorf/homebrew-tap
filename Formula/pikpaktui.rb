class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.24"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.24/pikpaktui-aarch64-macos.tar.gz"
      sha256 "69df45568c793fd70bb7e5c9a3725ecb1b89ba494ea23478db89117343c61cb5"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.24/pikpaktui-x86_64-macos.tar.gz"
      sha256 "9e94b26c4ddd95663827baf7ec3dc035696155712f9ca6c0ec68d0c4e84200e1"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.24/pikpaktui-x86_64-linux.tar.gz"
    sha256 "636e12b213250efdd16e5f2c072c45a045ccdaf7d7746e2c520c4440869f8efa"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
