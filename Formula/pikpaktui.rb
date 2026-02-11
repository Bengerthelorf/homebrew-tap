class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.4"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.4/pikpaktui-aarch64-macos.tar.gz"
      sha256 "25cd5f25496481a7e473fdb4dd6803edaae508716321f4792b60f973a3980416"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.4/pikpaktui-x86_64-macos.tar.gz"
      sha256 "fb719e45192e25a78fe425d0fb32d14444fdcbac2e8a216345a847b571394ff7"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.4/pikpaktui-x86_64-linux.tar.gz"
    sha256 "24e27eb50145bbe7eb81143817eae6b565f33851cde553ae2ed8aca43d58bd24"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
