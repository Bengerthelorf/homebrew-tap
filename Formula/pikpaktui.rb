class Pikpaktui < Formula
  desc "TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.64/pikpaktui-aarch64-macos.tar.gz"
      sha256 "dea98e56765fbe27d6f20fbf53b202986f2f13c4bc4b7ac933cff5ace8e93376"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.64/pikpaktui-x86_64-macos.tar.gz"
      sha256 "a8aacb3f994c748744e3f79dbefc3a01a21282a9b2b8ba02b491a2278c0b26bb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.64/pikpaktui-aarch64-linux.tar.gz"
      sha256 "9f9593094f81d3518d08b6679064b9ca3f577c7c63e4dee21ff2b986d3987d1e"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.64/pikpaktui-x86_64-linux.tar.gz"
      sha256 "b172684ad1070adc311b82f9224cd718589674e4c17edf3b17b1a35fea8f2c0b"
    end
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pikpaktui --version")
  end
end
