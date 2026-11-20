# typed: false
# frozen_string_literal: true

class GitVeil < Formula
  desc "Secret management for git repositories using age X25519 encryption"
  homepage "https://prompt-cult.github.io/git-veil/"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.2/git-veil-macos-aarch64"
      sha256 "0b82854a2144d562438bb828cbf966b5514db020ac315e964203a27cfc4e4da7"
    end
    on_intel do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.2/git-veil-macos-x86_64"
      sha256 "f5b022885c61b6bd76401016c7db3331f02da41b0ee2ccce4420bb181d64cfbd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.2/git-veil-linux-x86_64"
      sha256 "fd2d08f6bed0b5563bf8705537539f8553f4412d227a9660e43aaacd2f7558a2"
    end
    on_intel do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.2/git-veil-linux-x86_64"
      sha256 "fd2d08f6bed0b5563bf8705537539f8553f4412d227a9660e43aaacd2f7558a2"
    end
  end

  def install
    bin.install Dir["git-veil-*"].first => "git-veil"
  end

  test do
    assert_match "git-veil #{version}", shell_output("\#{bin}/git-veil --version")
  end
end
