class Atlas < Formula
  desc "A database toolkit"
  homepage "https://atlasgo.io"
  version "0.3.4-58903ceb01e5-canary"

  if OS.mac?
    url "https://release.ariga.io/atlas/atlas-darwin-amd64-latest.zip"
    sha256 "f8b2bdc45bc1a1a0764685ac47c45b5d2d112742e971e9df95409a369259b0b4"
  end

  if OS.linux?
    url "https://release.ariga.io/atlas/atlas-linx-amd64-latest.zip"
    sha256 "35cb3a1ab3ebf731b7b9bfd0368c53da7600c5c6814a291b639786c647cce22f"
  end

  def install
    bin.install "atlas"
  end
end
