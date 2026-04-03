class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.3"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.3/bcmr-aarch64-macos.tar.gz"
      sha256 "e135c90e81da8b71fe3fce28d5316c77b0833db31f21f5fb9af861c10af30de0"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.3/bcmr-x86_64-macos.tar.gz"
      sha256 "b4ca5168d06d4e31b313812f16b31be6eb129e9eb95d73ac80ece176d6712ba1"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.3/bcmr-x86_64-linux.tar.gz"
    sha256 "6b9ee1343d1264d0d22e7faa9eae8be1ada87014dba077b875af0e7e937d0162"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
