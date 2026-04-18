class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.20"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.20/bcmr-aarch64-macos.tar.gz"
      sha256 "663b8e5143e1cd12fdc2443410639a4fa525de819c5e5eda7a0f9d263240f027"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.20/bcmr-x86_64-macos.tar.gz"
      sha256 "e4e3476922646c1e197e772155f5a008bf8c448308eb7b1cfc552482a9622404"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.20/bcmr-x86_64-linux.tar.gz"
    sha256 "8bd6f981777119daef17c277158e14a5c8695fefaf502ae2da2669cb27a6a58e"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
