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
  url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.4/git-veil-linux-x86_64"
  sha256 "163038226ab3811b8de4e9d67446287e211ecad1015242639e6f47335d13d553"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.4/git-veil-macos-aarch64"
      sha256 "4aa5c915f2f51d562bc7d80017d37a904727d11db4d250c9971af63a369b5e3b"
    end
    on_intel do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.4/git-veil-macos-x86_64"
      sha256 "e2939041652516e81f854f6ac154fe01faffebd6de5072e4eabd7f2c1034f1b0"
    end
  end

  def install
    bin.install Dir["git-veil-*"].first => "git-veil"
  end

  test do
    assert_match "git-veil #{version}", shell_output("#{bin}/git-veil --version")
  end
end
