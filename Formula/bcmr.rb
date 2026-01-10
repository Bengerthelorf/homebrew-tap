class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.11"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.11/bcmr-aarch64-macos.tar.gz"
      sha256 "20cd01021f2eab545b6045ffee2bd074e63f8e9f689eb8e764f9a3867a9b2625"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.11/bcmr-x86_64-macos.tar.gz"
      sha256 "7af1c04d53b3bc13878982d62246f51f2aaa10f09f44633841792ce3f8d1fd95"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.11/bcmr-x86_64-linux.tar.gz"
    sha256 "91b51b9423224a269136d884c3fbd0f7c2dfe4bd77297156fdb4a4e401386277"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
