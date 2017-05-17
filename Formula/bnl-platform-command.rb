class BnlPlatformCommand < Formula
  desc "Platform related bnl commands"
  homepage "https://github.com/blendle/bnl-platform-command"
  url "git://github.com/blendle/bnl-platform-command.git",
    :revision => "ddccf75f6980bd36142fecadf04c6d234ff4d560"
  version "v0.1.0"
  head "git://github.com/blendle/bnl-platform-command.git"

  depends_on "blendle/blendle/bnl" => :recommended
  depends_on "kubectl" => :optional
  depends_on "gcloud" => :optional

  def install
    bin.install "./bnl-platform"
  end

  test do
    system "which", "bnl-platform"
    system "bnl", "platform"
  end
end
