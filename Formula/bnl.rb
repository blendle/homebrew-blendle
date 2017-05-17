class Bnl < Formula
  desc "Blendle Command Line Tools"
  homepage "https://github.com/blendle/bnl"
  url "git@github.com:blendle/bnl.git",
    version: "v.0.1.0",
    revision: "a77f7ad417ff8a82d03c666e4ae1dc424b3a7b1e"
  version "a77f7ad417ff8a82d03c666e4ae1dc424b3a7b1e"
  head "git@github.com:blendle/bnl.git"

  def install
    bin.install "./bnl"
  end

  test do
    system "which", "bnl"
  end
end
