class BnlPlatformCommand < Formula
  desc "Platform related bnl commands"
  homepage "https://github.com/blendle/bnl-platform-command"
  url "git@github.com:blendle/bnl-platform-command.git",
    version: "v0.2.0",
    revision: "7adc721e2c4b89a8db5686ef91e515f87dafa6d0",
    using: :git
  version "7adc721e2c4b89a8db5686ef91e515f87dafa6d0"
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
