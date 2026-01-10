class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.12"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.12/bcmr-aarch64-macos.tar.gz"
      sha256 "cda86bdd879e95a8d034fc6fd8b210d51242ad22bf70ab71b159d20a5c53f3bc"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.12/bcmr-x86_64-macos.tar.gz"
      sha256 "56b6b24cae26c7a996e1a630ea11c83cc9516432d19fbf771f05e4943e841de0"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.12/bcmr-x86_64-linux.tar.gz"
    sha256 "29f1b3fcfd3f49f00391eeeabf19912751c03165ae0a40a1af2e5945907ca125"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
