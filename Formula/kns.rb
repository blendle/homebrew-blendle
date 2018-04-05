class Kns < Formula
  desc "quick Kubernetes Namespace Switcher"
  homepage "https://github.com/blendle/kns"
  url "https://github.com/blendle/kns.git", :revision => "ac3d5bdb3fc5ad94899b2cc278682c7eba9f3deb"
  version "ac3d5bdb3fc5ad94899b2cc278682c7eba9f3deb"
  head "https://github.com/blendle/kns.git"

  depends_on "fzf"
  depends_on "kubernetes-cli" => :optional

  def install
    bin.install "./kns"
  end

  def caveats; <<~EOS
    I really recommend this alias:
      $ alias k=kubectl
    EOS
  end

  test do
    system "which", "kns"
  end
end
