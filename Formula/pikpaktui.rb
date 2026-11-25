class Pikpaktui < Formula
  desc "TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.67/pikpaktui-aarch64-macos.tar.gz"
      sha256 "6dc4645c090fc39ab6ab8b2588d0204cf657d60558a879772867cf5a8a33f0cb"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.67/pikpaktui-x86_64-macos.tar.gz"
      sha256 "79f7b567f02ea61494f3802cdc750bbaa8f242b39eb1196f3a3f7f29d15d53d6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.67/pikpaktui-aarch64-linux.tar.gz"
      sha256 "efe4dba7a87b58fc37729876bea16580f4a193f27903e8d76efd5c1448b040e8"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.67/pikpaktui-x86_64-linux.tar.gz"
      sha256 "01a2a11e2054f5ea54895278d378f4c68fc442aa442d529fd2521879784bd215"
    end
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pikpaktui --version")
  end
end
