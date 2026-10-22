class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.7.2"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.2/bcmr-aarch64-macos.tar.gz"
      sha256 "8a71e51b55997523b63258e6738c005c0d115f66a0b8c5feb67a57578958107a"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.2/bcmr-x86_64-macos.tar.gz"
      sha256 "db5d59f9d4204dcf70d399dacacb98f507b5b7d66e040c4c7cde337f314782d1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.2/bcmr-aarch64-linux.tar.gz"
      sha256 "09bd92fb1e348f7aae4a4edf919d02afd06bae1f2ee035077d7d431c9a9db524"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.2/bcmr-x86_64-linux.tar.gz"
      sha256 "a0900a597a9f5daa58c339ead94e0058224d3e86cd816c5091fc0e1f0e2f9a53"
    end
  end

  def install
    bin.install "bcmr"
    generate_completions_from_executable(bin/"bcmr", "completions", shells: [:bash, :zsh, :fish])
  end

  def caveats
    <<~EOS
      To enable bcp, bmv and brm in Zsh, add to ~/.zshrc:
        eval "$(bcmr init zsh --cmd b)"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bcmr --version")
    assert_path_exists bash_completion/"bcmr"
    assert_path_exists zsh_completion/"_bcmr"
    assert_path_exists fish_completion/"bcmr.fish"
  end
end
