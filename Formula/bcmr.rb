class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.14"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.14/bcmr-aarch64-macos.tar.gz"
      sha256 "5756c4349899891283bb3af7aa477d6620fbe4ea4d0ed222de2a8ecae9cf1e44"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.14/bcmr-x86_64-macos.tar.gz"
      sha256 "f3bebcb32c1aa1ca855bd0cde311d6fbf4d353e8c182b64467f8f5cbdbef25d0"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.14/bcmr-x86_64-linux.tar.gz"
    sha256 "9a47097b342304d80ff548ca606df9837adfd957fce7f4ab569120502bd8b962"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
