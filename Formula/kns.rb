class Kns < Formula
  desc "quick Kubernetes Namespace Switcher"
  homepage "https://github.com/blendle/kns"
  url "https://github.com/blendle/kns.git", :revision => "1126226c46004694cb472a73731eafae071d6016"
  version "1126226c46004694cb472a73731eafae071d6016"
  head "https://github.com/blendle/kns.git"

  depends_on "fzf"
  depends_on "kubernetes-cli" => :optional

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
