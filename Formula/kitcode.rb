class Kitcode < Formula
  desc "KitCode Agent is an AI agent built in Rust."
  homepage "https://github.com/taitide-labs/kitcode"
  version "0.1.5"
  if OS.mac?
    url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.5/kitcode-x86_64-apple-darwin.tar.xz"
    sha256 "886e9b53f07be90201271ef971ac266681f4c0afb58478a07cc8294769ec65a6"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.5/kitcode-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7a63a5424ba2d81f141d5c93c51c36a86a4a1d4445ce9ef084a48aef55c08e2d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.5/kitcode-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "afe71dfb0725bf102ee35e191b031e90aed4c1dd25789ba4787a215dd569fb81"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "kitcode"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "kitcode"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "kitcode"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "kitcode"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
