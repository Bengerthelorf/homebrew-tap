class Pikpaktui < Formula
  desc "TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.65/pikpaktui-aarch64-macos.tar.gz"
      sha256 "ea8faba33a3d14258388eede9a6481accff24ad0e71a60d20a7f595f9eaeb992"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.65/pikpaktui-x86_64-macos.tar.gz"
      sha256 "29d7dbc9cee5624ffdb4cc13d1c05ea9d40c5b40fb1981bfb0f3330c9e38231f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.65/pikpaktui-aarch64-linux.tar.gz"
      sha256 "9f801610e436c9e9716953fd3d881d956eb728e0a60fdf1dae24119e1c1bbfac"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.65/pikpaktui-x86_64-linux.tar.gz"
      sha256 "6712f59baad684074dcbf67b60f70f15687f4922b1b585e20238b5c8a3665e8c"
    end
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pikpaktui --version")
  end
end
