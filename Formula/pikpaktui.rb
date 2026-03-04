class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.46"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.46/pikpaktui-aarch64-macos.tar.gz"
      sha256 "c4f82a3b82ef38379df21558e77d9283cb71526d9abcde1ad427ce2dae3ad22e"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.46/pikpaktui-x86_64-macos.tar.gz"
      sha256 "84127571f3749be941954b2abe2588aa0dee95f4e4d6e333ffdf9e72f9b40f53"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.46/pikpaktui-x86_64-linux.tar.gz"
    sha256 "0ec656d3bfa33c9d2230dec5e99629c5fb582bc61b4a73eac1dd5b38ff4366a6"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
