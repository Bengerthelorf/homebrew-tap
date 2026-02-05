class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.27"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.27/bcmr-aarch64-macos.tar.gz"
      sha256 "219ef0a87b50cdeac40c6bfbc509637d24514793faf27879deee315790951bdb"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.27/bcmr-x86_64-macos.tar.gz"
      sha256 "c187c8b86b3da0299f88cd9f1bff55ef23d3948a8d23033f62bf7676d7257361"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.27/bcmr-x86_64-linux.tar.gz"
    sha256 "7941531a5512e5f01fbe310a2f6bc5d13d7288b09786789aa60795f0e79f3f48"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
