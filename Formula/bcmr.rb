class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.17"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.17/bcmr-aarch64-macos.tar.gz"
      sha256 "cf3caa86f1f0b62e4d45f9de09c8c82196b6c4ff9f8e56b90356104fcc09d2ab"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.17/bcmr-x86_64-macos.tar.gz"
      sha256 "3ca2fbecaf6a685b23aa7e584ecc327fe769ed43876009f2a37e08f3f66c67cc"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.17/bcmr-x86_64-linux.tar.gz"
    sha256 "169b5a6431db54787dfede2fd58c76ddef44fccf06278b980b283346161adf2f"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
