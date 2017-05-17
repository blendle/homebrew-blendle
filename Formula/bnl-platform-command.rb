class BnlPlatformCommand < Formula
  desc "Platform related bnl commands"
  homepage "https://github.com/blendle/bnl-platform-command"
  url "https://github.com/blendle/bnl-platform-command.git",
    :revision => "dd37d3620eed01fa66277680ba6c514b0035a393"
  version "v.0.1.0"
  head "https://github.com/blendle/bnl-platform-command.git"

  depends_on "blendle/blendle/bnl" # questionable, it works without, but not as good
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
