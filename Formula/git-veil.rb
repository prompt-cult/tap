# typed: false
# frozen_string_literal: true

class GitVeil < Formula
  desc "Secret management for git repositories using age X25519 encryption"
  homepage "https://prompt-cult.github.io/git-veil/"
  # The top-level url and sha256 are the Linux channel: one
  # x86_64 binary, no aarch64 asset exists. on_macos overrides
  # them for macOS. on_linux blocks may not carry url or sha256
  # (brew audit), so the top level is the only audit-clean home,
  # and url precedes license per rubocop component order.
  url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.6/git-veil-linux-x86_64"
  sha256 "d64dec3418e4b97f6ff221f983481f894e2875b5db59c23d0a3de3a2e933c2de"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.6/git-veil-macos-aarch64"
      sha256 "e57c34115357805b1ac7570bfa429c00fb6499a023f0d2f809261264c2f28c7c"
    end
    on_intel do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.6/git-veil-macos-x86_64"
      sha256 "d08500564046fffbccadf8f5fd289d556339cc4b31d5fbc4854e4b9cace25a63"
    end
  end

  def install
    bin.install Dir["git-veil-*"].first => "git-veil"
  end

  test do
    assert_match "git-veil #{version}", shell_output("#{bin}/git-veil --version")
  end
end
