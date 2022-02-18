class Atlas < Formula
  desc "A database toolkit"
  homepage "https://atlasgo.io"

  # technique to pull sha and version from HTTP inspired by: https://github.com/pointlessone/homebrew-rust-nightly
  def self.sha256_checksum (platform)
    `curl --silent https://release.ariga.io/atlas/atlas-#{platform}-amd64-latest.zip.sha256`.split.first
  end

  def self.version (platform)
     `curl --silent https://release.ariga.io/atlas/atlas-#{platform}-amd64-latest.version`
  end

  if OS.mac?
    url "https://release.ariga.io/atlas/atlas-darwin-amd64-latest.zip"
    sha256 self.sha256_checksum "darwin"
    version self.version "darwin"
  end

  if OS.linux?
    url "https://release.ariga.io/atlas/atlas-linux-amd64-latest.zip"
    sha256 self.sha256_checksum "linux"
    version self.version "linux"
  end

  def install
    bin.install "atlas"
  end
end
