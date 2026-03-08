class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.2"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.2/bcmr-aarch64-macos.tar.gz"
      sha256 "7f2b68725e9a3e5a9a43858400d8c2359b919f254fb4c6f97eb0566fde0db9d2"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.2/bcmr-x86_64-macos.tar.gz"
      sha256 "5875b13d35fc3acb9e4acc8d85e0f677cc60aac6aa0e0e1fe20163f7d5e95729"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.2/bcmr-x86_64-linux.tar.gz"
    sha256 "f3cef9768fb9cd25b1efa386d5200d6b6df89c6a71e74fa8156e6d9c4f7c616c"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
