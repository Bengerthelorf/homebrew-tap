class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.11"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.11/pikpaktui-aarch64-macos.tar.gz"
      sha256 "11b0d974af8bddaf0c2dc264808e3dd49a8bf11242e720fb1ccdccc3e02664ff"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.11/pikpaktui-x86_64-macos.tar.gz"
      sha256 "31317eb8fb387fd83636cc909aff02a2268565859fbd75f9433fe48ba864c20f"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.11/pikpaktui-x86_64-linux.tar.gz"
    sha256 "36637f94b923de1e7f10556553bfec7a39c522519444e972bf52a11573b48562"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
