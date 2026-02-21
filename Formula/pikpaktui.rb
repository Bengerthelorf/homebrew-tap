class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.38"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.38/pikpaktui-aarch64-macos.tar.gz"
      sha256 "ccb7608da4faeb9241483625d1f7b84f7326d0d77a3f6c1f01c5fedd260ffb42"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.38/pikpaktui-x86_64-macos.tar.gz"
      sha256 "0a154e0aa056d81f62f306800f27d69f6c0fb1b035d8e844681477c66e7bfc6c"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.38/pikpaktui-x86_64-linux.tar.gz"
    sha256 "b5bf20c40d75a39db5759477eab0164ac49272b65153231f0198def291e2bc33"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
