class Pikpaktui < Formula
  desc "TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.68/pikpaktui-aarch64-macos.tar.gz"
      sha256 "6b88ed3eae6734c161ceefa164a218947f21bc2142e2a240fcf01d5ba39cab97"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.68/pikpaktui-x86_64-macos.tar.gz"
      sha256 "b5bab4713486392f781731978741f7152ac056df31b69973d9d6d0e500c909ab"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.68/pikpaktui-aarch64-linux.tar.gz"
      sha256 "8c5b483789357187c73caa323ff7539c3c38f64c9a1b4396ccefe5bf0ad646a9"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.68/pikpaktui-x86_64-linux.tar.gz"
      sha256 "3473fcacddac225e07921c18cea93d27e2c0ac3636b283c0734cb15fac5a9d06"
    end
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pikpaktui --version")
  end
end
