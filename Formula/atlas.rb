class Atlas < Formula
  desc "A database toolkit"
  homepage "https://atlasgo.io"

  # technique to pull sha and version from HTTP inspired by: https://github.com/pointlessone/homebrew-rust-nightly
  def self.sha256_checksum
    `curl --silent https://release.ariga.io/atlas/atlas-#{self.os}-#{self.arch}-latest.zip.sha256`.split.first
  end

  def self.latest_version
    `curl --silent https://release.ariga.io/atlas/atlas-#{self.os}-#{self.arch}-latest.version`.split.first
  end

  def self.os
    if OS.mac?
      "darwin"
    elsif OS.linux?
      "linux"
    end
  end

  def self.arch
    Hardware::CPU.arm? ? "arm64" : "amd64"
  end

  url "https://release.ariga.io/atlas/atlas-#{self.os}-#{self.arch}-latest.zip"
  sha256 self.sha256_checksum
  version self.latest_version

  def install
    bin.install "atlas"
  end
end
