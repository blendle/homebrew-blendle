class Kns < Formula
  desc "quick Kubernetes Namespace Switcher"
  homepage "https://github.com/blendle/kns"
  url "https://github.com/blendle/kns.git", :revision => "c3ad64f9abe2cd9b155e6d4b3b4549395a2213bd"
  version "c3ad64f9abe2cd9b155e6d4b3b4549395a2213bd"
  head "https://github.com/blendle/kns.git"

  depends_on "fzf"
  depends_on "kubernetes-cli" => [:optional, "with-kubectl"]

  def install
    bin.install "./kns"
  end

  def caveats; <<-EOS.undent
    I really recommend this alias:
      $ alias k=kubectl
    EOS
  end

  test do
    system "which", "kns"
  end
end
