class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.7"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.7/bcmr-aarch64-macos.tar.gz"
      sha256 "6979bc786959fb3589303f548745057d1159c360fb46276e7b06c3e66096e5a5"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.7/bcmr-x86_64-macos.tar.gz"
      sha256 "76685d7fe26d86a1eaedf02720d12b5f25e3266927d81ca1d8a7a41c6e1477f8"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.7/bcmr-x86_64-linux.tar.gz"
    sha256 "70952b49d816d08cd28bfb460e4a37c7c60e85bd9a761618dbe0d48b117ede8e"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
