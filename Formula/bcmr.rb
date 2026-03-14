class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.3"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.3/bcmr-aarch64-macos.tar.gz"
      sha256 "3c8f80c7f14ec14710cd70ad352be659f1b607752547e3e2731e94cf01f7d8a9"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.3/bcmr-x86_64-macos.tar.gz"
      sha256 "eb6c589c7acd84bd993ad8cb4cd7fcd40747f003e4ea217103dbf9ece81b09f8"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.3/bcmr-x86_64-linux.tar.gz"
    sha256 "1545cd6b16b7083c28a57b1285c32566b5e15621db1c1828072567ad6b83e164"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
