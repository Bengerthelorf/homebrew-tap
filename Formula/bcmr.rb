class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.17"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.17/bcmr-aarch64-macos.tar.gz"
      sha256 "85a004d04e5ff633bbb18d349b554b5c93b793a74042e19e5f1a62ec52418c81"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.17/bcmr-x86_64-macos.tar.gz"
      sha256 "40f8d127f3408b6a3fd4a2cbd4cc77b45589a948126533201de61ed3798d6927"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.17/bcmr-x86_64-linux.tar.gz"
    sha256 "ba73b81e5d590d0f28915a199df0cafaccad49ed554822dbc4577f1483b5289e"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
