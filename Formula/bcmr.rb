class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.0"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.0/bcmr-aarch64-macos.tar.gz"
      sha256 "a4590883fa35a241900b1c93f077264fc950df790eb1176839ebe2f447d267d3"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.0/bcmr-x86_64-macos.tar.gz"
      sha256 "13b8400996a40599b2a1fcba17982df7d52d4c981a5be96724f93e251aa14b75"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.0/bcmr-x86_64-linux.tar.gz"
    sha256 "9dfb884cdd42047fbba90c970c9c03b6ac63db696f84e459aff041878dec9ad5"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
