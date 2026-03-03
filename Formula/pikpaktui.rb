class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.45"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.45/pikpaktui-aarch64-macos.tar.gz"
      sha256 "e7c7650c4094d5e1715b1e771fad938420ba1387af055b568adc9cc58975aa82"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.45/pikpaktui-x86_64-macos.tar.gz"
      sha256 "c65a488bf7d4967e96d85df33a496886af82f850a3bfd74b7bc0cb17fd2fb0c9"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.45/pikpaktui-x86_64-linux.tar.gz"
    sha256 "22d92f1bf91e956edc2c9c0594893a40bccff95702cd57be41fbc05a282a6405"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
