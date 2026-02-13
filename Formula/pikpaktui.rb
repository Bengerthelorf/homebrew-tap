class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.20"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.20/pikpaktui-aarch64-macos.tar.gz"
      sha256 "e64d833ed90ff607cf20ddd4d6632c899803b1534eee482a7528792d7ee8449a"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.20/pikpaktui-x86_64-macos.tar.gz"
      sha256 "496657295a4e0ee61669eaf094eb3e54928f0ee39da1e673a3f9e66cff3b12e2"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.20/pikpaktui-x86_64-linux.tar.gz"
    sha256 "f0c343373fd63bee01e26127a4296a1761e08ff4543dbeb369e4563689e26ae7"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
