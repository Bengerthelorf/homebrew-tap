class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.22"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.22/pikpaktui-aarch64-macos.tar.gz"
      sha256 "c47f855af60c4bf3ba0cba347c962371aced0f570a3d44e6a397d8c243be55f3"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.22/pikpaktui-x86_64-macos.tar.gz"
      sha256 "17e2c5e3fca8449eea5e4c70b89f89c46823c1b867d8bf6522a5a72a5251275d"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.22/pikpaktui-x86_64-linux.tar.gz"
    sha256 "47b457c2523bab3519944fbba83f696167fa343dfda78f0b8a11d6ff0e185904"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
