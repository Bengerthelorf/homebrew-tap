class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.0"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.0/bcmr-aarch64-macos.tar.gz"
      sha256 "f414ee560f2c23a66c6c32ae7c7a2d00d5a22f39df942cdea28b5da6dc0eb0bb"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.0/bcmr-x86_64-macos.tar.gz"
      sha256 "a1ca7e2c35dac8b11b1ad2fc9b3d433bfa0f0072cd7de3ed379600174ad0d597"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.0/bcmr-x86_64-linux.tar.gz"
    sha256 "5ffa8a515a745a2788b06eafd88582c6ad8f96c7abeaa7378c2f330993659652"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
