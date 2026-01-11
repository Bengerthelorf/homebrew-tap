class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.19"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.19/bcmr-aarch64-macos.tar.gz"
      sha256 "7bb11f25171b3fc43f620c7bb3522f25e745819812f4be1b20a3b428f606e36e"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.19/bcmr-x86_64-macos.tar.gz"
      sha256 "34c3cd018c39e0f87b7aab46880e792aba58d92cf71a3c832d12956c7e420e8c"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.19/bcmr-x86_64-linux.tar.gz"
    sha256 "00ffe454b96ee190d177bf7442c9d3aa6db4b5ff48ec1ce8fb7c4a78805dcaaa"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
