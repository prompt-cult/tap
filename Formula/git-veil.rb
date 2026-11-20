class GitVeil < Formula
  desc "Secret management for git repositories using age X25519 encryption"
  homepage "https://prompt-cult.github.io/git-veil/"
  version "0.17.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prompt-cult/git-veil/releases/download/v#{version}/git-veil-macos-aarch64"
      sha256 "66d3f7d494cda20aa52b8bfbf77f1f8ac2751fa89d211d0b366ec7ba48906802"
    end
    on_intel do
      url "https://github.com/prompt-cult/git-veil/releases/download/v#{version}/git-veil-macos-x86_64"
      sha256 "537dffdd259fcb6c26b48a4b69bd5507aa5b81cbff0908fec558f2d660654e22"
    end
  end
  on_linux do
    url "https://github.com/prompt-cult/git-veil/releases/download/v#{version}/git-veil-linux-x86_64"
    sha256 "743b9878a612e3858772d6fcfb84519e4864745d19403d7f9c1ce09ef6ffca33"
  end

  def install
    bin.install Dir["git-veil-*"].first => "git-veil"
  end

  test do
    assert_match "git-veil #{version}", shell_output("#{bin}/git-veil --version")
  end
end
