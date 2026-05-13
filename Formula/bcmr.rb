class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.6.3"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.3/bcmr-aarch64-macos.tar.gz"
      sha256 "43271b06a26fed9c264dd376048bcc0ce4456bea741e138ec2f02717525cd026"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.3/bcmr-x86_64-macos.tar.gz"
      sha256 "39721e0354f646f87e6f9f42b7879335d3027ace4db4ce5af17e9d3a2e86c556"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.3/bcmr-x86_64-linux.tar.gz"
    sha256 "4e19bacf65954743effd9cdc4ae66db85940c1f4d9f71aa4e310b4df8515ce1a"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
