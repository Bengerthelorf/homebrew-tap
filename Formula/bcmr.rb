class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.8"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.8/bcmr-aarch64-macos.tar.gz"
      sha256 "fa0d30bf90f46b2bebc6f6d4037893736973a3a6c261d04d4615666e3f9bbeab"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.8/bcmr-x86_64-macos.tar.gz"
      sha256 "d959e09ecc60c25709b66981f30dca22f4b45daffa4e867645c6a49a16bc5002"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.8/bcmr-x86_64-linux.tar.gz"
    sha256 "4f9e698b121ae7b8a00e81b2e695f64b6caf47c8fb5264250feb2f7545df5169"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
