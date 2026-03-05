class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.29"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.29/bcmr-aarch64-macos.tar.gz"
      sha256 "b581ea3a52f59f699d596f8241aa1a4e729868b4d7b14aae8f2fd0373e54a872"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.29/bcmr-x86_64-macos.tar.gz"
      sha256 "a7132a6a41121801fe3fb9d9264fc830c9de79846d4c009016ac2b5b388dade1"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.29/bcmr-x86_64-linux.tar.gz"
    sha256 "897e32d152502d5f59c3f4a5dc416051b26ceafa5a72a77d24e6733ba7128567"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
