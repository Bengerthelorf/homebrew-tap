class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.10"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.10/bcmr-aarch64-macos.tar.gz"
      sha256 "0f5f49d232fb7195b55e30658b6996567216728ac39101c3056decbe66acef60"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.10/bcmr-x86_64-macos.tar.gz"
      sha256 "62433cea1125db763acb4a8ad191cc7da4549da07b672b8c8a200a7c8f761172"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.10/bcmr-x86_64-linux.tar.gz"
    sha256 "107f53d577ae925eba8a4dd6c3a00b2bf6c58925940c4ff80f0a9a7500903833"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
