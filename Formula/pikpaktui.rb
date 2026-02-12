class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.13"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.13/pikpaktui-aarch64-macos.tar.gz"
      sha256 "b279c3a66b5c8b3c11e451bde63a42e6fbd957c5dd48405768cefd826aeee1e9"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.13/pikpaktui-x86_64-macos.tar.gz"
      sha256 "a83ac8b0a6415c089f6a4adaf852c40ba37e629474a792f63f0702dc60b9b105"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.13/pikpaktui-x86_64-linux.tar.gz"
    sha256 "e076a3699540b6e16e6f48701a03a991ea88929f1391ee90541553f60151f049"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
