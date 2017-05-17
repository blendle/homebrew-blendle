class Bnl < Formula
  desc "Blendle Command Line Tools"
  homepage "https://github.com/blendle/bnl"
  url "git@github.com:blendle/bnl.git",
    version: "v.0.1.0",
    revision: "a77f7ad417ff8a82d03c666e4ae1dc424b3a7b1e",
    using: :git
  version "a77f7ad417ff8a82d03c666e4ae1dc424b3a7b1e"
  head "git@github.com:blendle/bnl.git", using: :git

  def install
    bin.install "./bnl"
    bin.install "./bnl-commands"
    bin.install "./bnl-completion"
    bin.install "./bnl-help"
  end

  def caveats
    ohai <<-EOS.undent
      For autocompletion try this:

      zsh:
      source <(bnl completion zsh)

      bash, fish:
      Nothing yet :-(
    EOS
  end

  test do
    system "which", "bnl"
  end
end
