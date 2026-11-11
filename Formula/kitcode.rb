class Kitcode < Formula
  desc "KitCode Agent is an AI agent built in Rust."
  homepage "https://github.com/taitide-labs/kitcode"
  version "0.1.8"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.8/kitcode-aarch64-apple-darwin.tar.xz"
      sha256 "20d1e81d483d0b3f0fa65d57c1633c9971e2fe3739da5f8207547554e6016e23"
    end
    if Hardware::CPU.intel?
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.8/kitcode-x86_64-apple-darwin.tar.xz"
      sha256 "3deb5e18fa50761c9e7b8e7c443fda8925c6d65bb19e9689d452043b3425b40c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.8/kitcode-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3fdaef118532610c3f2f10f107618a63b16b788a3d9e5baa4ad11f59561cc488"
    end
    if Hardware::CPU.intel?
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.8/kitcode-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ec65aa905e31be74f117ee37f722a3cf02be1ed720016ed37d9f361a20d979c2"
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
