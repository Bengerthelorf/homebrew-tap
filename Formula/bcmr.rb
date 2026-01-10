class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.10"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.10/bcmr-aarch64-macos.tar.gz"
      sha256 "2586859586b22a6b8fbcbcc406d4409e361f354f42149ee792a63f64b35ec2f7"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.10/bcmr-x86_64-macos.tar.gz"
      sha256 "d567e27ed65e00e878a316f0578cbd6e50a347db99bd32596f4bafae58a896c6"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.10/bcmr-x86_64-linux.tar.gz"
    sha256 "2566fb6efc618c43ab2bbea38123c6a949cb49667ea3a76bc75ec226b9e5b281"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
