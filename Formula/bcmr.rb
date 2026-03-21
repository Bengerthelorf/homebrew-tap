class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.11"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.11/bcmr-aarch64-macos.tar.gz"
      sha256 "44a1f91b094baa09ce826732e552f4e441e077a08efbbe7be3c213d2cda448d7"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.11/bcmr-x86_64-macos.tar.gz"
      sha256 "ccc1524414be71998e6673295783354e1684bdcb55d1150e8e2b7d260928ed26"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.11/bcmr-x86_64-linux.tar.gz"
    sha256 "b439da458d2b41f047af61820a6644b10a959547420f89243bfcb5457c9a3ccc"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
