class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.7.1"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.1/bcmr-aarch64-macos.tar.gz"
      sha256 "45da71b94027bec0d20cad03d956339694d96b47bb9a1f889c67708976c40122"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.1/bcmr-x86_64-macos.tar.gz"
      sha256 "522b34fd3d79a2efd11c2700e27cccfc151b197e3133838eae5d4c7d0133189d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.1/bcmr-aarch64-linux.tar.gz"
      sha256 "efd542c958782452abab0ff96c40d758375b84e2a3b79a4fed91df3e9dd76fc1"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.1/bcmr-x86_64-linux.tar.gz"
      sha256 "b4297a0e2168df0d829f54d9380d5cdbb858368ac220829ac8f54b46c3b85e00"
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
