class Atlas < Formula
  desc "A database toolkit"
  homepage "https://atlasgo.io"

  # technique to pull sha and version from HTTP inspired by: https://github.com/pointlessone/homebrew-rust-nightly
  def self.fetch_with_fallback(url)
    # Try new server first
    result = `curl --silent --fail --show-error "#{url}" 2>&1`
    
    # Fallback to old server if new one fails (404 or any error)
    if $?.exitstatus != 0
      fallback_url = url.gsub('atlasbinaries.com', 'release.ariga.io')
      result = `curl --silent --fail --show-error "#{fallback_url}" 2>&1`
    end
    
    result.strip
  end

  def self.sha256_checksum
    url = "https://atlasbinaries.com/atlas/atlas-#{self.os}-#{self.arch}-latest.zip.sha256"
    self.fetch_with_fallback(url).split.first
  end

  def self.latest_version
    url = "https://atlasbinaries.com/atlas/atlas-#{self.os}-#{self.arch}-latest.version"
    self.fetch_with_fallback(url).split.first
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

  def self.base_url
    # Try new server first, fallback to old server if it fails
    test_url = "https://atlasbinaries.com/atlas/atlas-#{self.os}-#{self.arch}-latest.zip.sha256"
    `curl --silent --fail --head "#{test_url}" > /dev/null 2>&1`
    if $?.exitstatus == 0
      "https://atlasbinaries.com"
    else
      "https://release.ariga.io"
    end
  end

  url "#{self.base_url}/atlas/atlas-#{self.os}-#{self.arch}-latest.zip"
  sha256 self.sha256_checksum
  version self.latest_version

  def install
    bin.install "atlas"
  end
end
