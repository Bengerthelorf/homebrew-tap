class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.63"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.63/pikpaktui-aarch64-macos.tar.gz"
      sha256 "2a115ffe23c527f1a450142abc3d8c52f412eba77b0074c33b6efb84be9623c5"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.63/pikpaktui-x86_64-macos.tar.gz"
      sha256 "ad30907d78bd554d5af62273ce03ae11492b3a0255eb7a7fbd307c1066ee4636"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.63/pikpaktui-aarch64-linux.tar.gz"
      sha256 "c147c5a1b5181adc7e784006bc461136e80ac062bbfa332ff82c8c3610565846"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.63/pikpaktui-x86_64-linux.tar.gz"
      sha256 "265d5ff61e4c398691e170780ab14823926caff1b8afe571726d4bcd0c6d215d"
    end
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
