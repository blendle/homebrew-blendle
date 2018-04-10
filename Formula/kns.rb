class Kns < Formula
  desc "quick Kubernetes Namespace Switcher"
  homepage "https://github.com/blendle/kns"
  url "https://github.com/blendle/kns.git", :revision => "9e30d8df96dc864383845ea5a12cd460f33166fa"
  version "9e30d8df96dc864383845ea5a12cd460f33166fa"
  head "https://github.com/blendle/kns.git"

  depends_on "fzf"
  depends_on "kubernetes-cli" => :optional

  def install
    bin.install "bin/kns"
    bin.install "bin/ktx"
    prefix.install "helpers"
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
