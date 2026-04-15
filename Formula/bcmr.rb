class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.7"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.7/bcmr-aarch64-macos.tar.gz"
      sha256 "2df1dc0ed4b2435e967187dafcbea6fbb81901f442d3eec13ae9aee87bc7163d"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.7/bcmr-x86_64-macos.tar.gz"
      sha256 "49d272cfb8e1523c145600eff1ef276367df2c02d3b47a0a2092bcd14f3bd16d"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.7/bcmr-x86_64-linux.tar.gz"
    sha256 "91f8c5337a19d608b80012c8af8bba82a96d00d4767ddd0a2b0ee09626f83e69"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
