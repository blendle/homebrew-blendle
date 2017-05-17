class BnlPlatformCommand < Formula
  desc "Platform related bnl commands"
  homepage "https://github.com/blendle/bnl-platform-command"
  url "git@github.com:blendle/bnl-platform-command.git",
    version: "v0.1.0",
    revision: "ddccf75f6980bd36142fecadf04c6d234ff4d560",
    using: :git
  version "ddccf75f6980bd36142fecadf04c6d234ff4d560"
  head "git@github.com:blendle/bnl-platform-command.git", using: :git

  depends_on "blendle/blendle/bnl" => :recommended
  depends_on "kubectl" => :optional

  def install
    bin.install "./bnl-platform"
  end

  def caveats
    "This command also requires you to have set up gcloud"
  end

  test do
    system "which", "bnl-platform"
    system "bnl", "platform"
  end
end
