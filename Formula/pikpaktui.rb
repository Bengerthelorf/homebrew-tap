class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.8"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.8/pikpaktui-aarch64-macos.tar.gz"
      sha256 "286650324a15d5306cc57f76c4053d530d46164d92895ac20d42ab329d838009"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.8/pikpaktui-x86_64-macos.tar.gz"
      sha256 "6d96dfe09385451a41cf324e9bac6aaff915455002d2715588b8fd349b2fd1c0"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.8/pikpaktui-x86_64-linux.tar.gz"
    sha256 "209b5a66e3d17ada0279bdae8245f2651ebd5ac2da9fce3833fcedde2ea6cd55"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
