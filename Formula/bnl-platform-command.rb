class BnlPlatformCommand < Formula
  desc "Platform related bnl commands"
  homepage "https://github.com/blendle/bnl-platform-command"
  url "https://github.com/blendle/bnl-platform-command.git",
    :revision => "TODO"
  version "TODO"
  head "https://github.com/blendle/bnl-platform-command.git"

  depends_on "blendle/blendle/bnl" # questionable, it works without, but not as good

  def install
    bin.install "./bnl-platform-command"
  end

  test do
    system "which", "bnl-platform-command"
    system "bnl", "platform"
  end
end
