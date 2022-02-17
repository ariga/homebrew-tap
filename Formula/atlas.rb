class Atlas < Formula
  desc "A database toolik"
  homepage "https://atlasgo.io"
  url "https://release.ariga.io/atlas/atlas-darwin-amd64-latest.zip"
  sha256 "b1061935a40a39a543e419e420cf7e455a1912b277c646695ee7345f8f4fac0d"
  version "0.3.4-canary"

  def install
    bin.install "atlas"
  end
end
