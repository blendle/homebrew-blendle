class Kns < Formula
  desc "Quick Kubernetes Namespace and Context Switchers"
  homepage "https://github.com/blendle/kns"
  url "https://github.com/blendle/kns.git", :revision => "7e5f78b781c6567f71068585f2b101caca99f0ef"
  version "7e5f78b781c6567f71068585f2b101caca99f0ef"
  head "https://github.com/blendle/kns.git"

  depends_on "fzf"
  depends_on "kubernetes-cli" => :optional

  def install
    bin.install "bin/kns"
    bin.install "bin/ktx"
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
