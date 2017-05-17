class Bnl < Formula
  desc "Blendle Command Line Tools"
  homepage "https://github.com/blendle/bnl"
  url "git@github.com:blendle/bnl.git",
    version: "v1.0.0",
    revision: "b2e7a94623b490dcbe5d5c2cb29c68d26433725a",
    using: :git
  version "b2e7a94623b490dcbe5d5c2cb29c68d26433725a"
  head "git@github.com:blendle/bnl.git", using: :git

  def install
    bin.install "./bnl"
  end

  test do
    system "which", "bnl"
  end
end
