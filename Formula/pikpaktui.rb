class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.3"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.3/pikpaktui-aarch64-macos.tar.gz"
      sha256 "03506ed31778b933b94517b4ddae92a04de0b545e40bd2189d34e9c29240cde4"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.3/pikpaktui-x86_64-macos.tar.gz"
      sha256 "db967578f51a10c318b87564a1a41fcfe7600e8e3acc60f877cc5f7b229dbb67"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.3/pikpaktui-x86_64-linux.tar.gz"
    sha256 "779c46527db9929fd61ef77ae413b8668d0c3554b713fe0c244ba0fc3ff9b4b5"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
