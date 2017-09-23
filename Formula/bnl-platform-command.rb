class BnlPlatformCommand < Formula
  desc "Platform related bnl commands"
  homepage "https://github.com/blendle/bnl-platform-command"
  url "git@github.com:blendle/bnl-platform-command.git",
    version: "v0.2.1",
    revision: "daeef9da8b3c142fba14421777c2f9b16c65c976",
    using: :git
  version "0.2.1"
  head "git@github.com:blendle/bnl-platform-command.git", using: :git

  depends_on "blendle/blendle/bnl" => :recommended
  depends_on "kubernetes-cli" => :optional

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
