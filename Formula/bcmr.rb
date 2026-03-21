class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.13"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.13/bcmr-aarch64-macos.tar.gz"
      sha256 "92e29b5e6462fbf2f10a77632bdb485b22f5bbe01352b786d29739d70c97da2a"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.13/bcmr-x86_64-macos.tar.gz"
      sha256 "5d96cc864bf4d8aab46647c64a03c25d2c4f743e190942cf9a2482247e98cdf3"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.13/bcmr-x86_64-linux.tar.gz"
    sha256 "aa0467b988d6902f61e8ec2120926dec5c671efa253290877750b7e8f14fc948"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
