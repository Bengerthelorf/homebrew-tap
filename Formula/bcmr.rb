class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.19"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.19/bcmr-aarch64-macos.tar.gz"
      sha256 "d4b34d9b2aab80e0dc6e2de9afdd472d08c7afe2cfe8bc9eb51e12d73eb2a4a6"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.19/bcmr-x86_64-macos.tar.gz"
      sha256 "d67cbfc1e476678ac3fb8521363b12796129e94fd4c5e567baa751668ece4211"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.19/bcmr-x86_64-linux.tar.gz"
    sha256 "1f7f7104eba70a670111f986ec27d8371ffa3d77bd9f70708347d9a1bbb93edc"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
