# typed: false
# frozen_string_literal: true

class GitVeil < Formula
  desc "Secret management for git repositories using age X25519 encryption"
  homepage "https://prompt-cult.github.io/git-veil/"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.3/git-veil-macos-aarch64"
      sha256 "d05ed2fd25ac1203779367e080ffa4d5f78d1f31ae3d70c3eaf865db2dfce6ab"
    end
    on_intel do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.3/git-veil-macos-x86_64"
      sha256 "df1442277f2c30ebf73d146c6502bafbb005a2e6ce464e8e4515103e8e6f094f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.3/git-veil-linux-x86_64"
      sha256 "1424101f00ba5f017801670a039f9acc6c28eb93226d14bf3c36c4a9eb916422"
    end
    on_intel do
      url "https://github.com/prompt-cult/git-veil/releases/download/v0.17.3/git-veil-linux-x86_64"
      sha256 "1424101f00ba5f017801670a039f9acc6c28eb93226d14bf3c36c4a9eb916422"
    end
  end

  def install
    bin.install Dir["git-veil-*"].first => "git-veil"
  end

  test do
    assert_match "git-veil #{version}", shell_output("\#{bin}/git-veil --version")
  end
end
