class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.32"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.32/pikpaktui-aarch64-macos.tar.gz"
      sha256 "4f6b87aa1cc627dd0fde7c02ae7d762c3d310e93195e934157efcdadfa624cd9"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.32/pikpaktui-x86_64-macos.tar.gz"
      sha256 "b324b5352157c7ff32b6f6a69e4cd4d38c53a8839c50f05ea50a6e1ffc8d0d86"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.32/pikpaktui-x86_64-linux.tar.gz"
    sha256 "fe0547ff0dd0397835b15b396e1158d6fa94269ddf74641adcf5b0441f737626"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
