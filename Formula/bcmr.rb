class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.8"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.8/bcmr-aarch64-macos.tar.gz"
      sha256 "2446b1495c7f23e8fb5b24ba02e595f4c892a0bce1a366baf5e1a39e7a9cc130"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.8/bcmr-x86_64-macos.tar.gz"
      sha256 "43ff9da7881cac6f78eade7684090458672e5e12afffc543870fa1688366796a"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.8/bcmr-x86_64-linux.tar.gz"
    sha256 "e507973bcda9e0494d75182a1d2e4f02beab3e76b3d2ed65ea395422aba7229e"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
