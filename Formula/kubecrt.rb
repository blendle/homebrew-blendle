class Kubecrt < Formula
  desc "Convert Helm charts to Kubernetes resources"
  homepage "https://github.com/blendle/kubecrt"
  url "https://github.com/blendle/kubecrt.git",
    tag:      "v0.9.2",
    revision: "84ecbcfd325597e368cca640b734fcae3232b37d"
  head "https://github.com/blendle/kubecrt.git"

  depends_on "go" => :build

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    rebuild 1
    sha256 cellar: :any_skip_relocation, big_sur: "9ca36d0e8e9570c64b0dd856057331480288ba49257f87ad3b1a80c670107f4a"
  end

  def install
    ENV["GOPATH"] = buildpath
    buildpath.join("src/github.com/blendle/kubecrt").install buildpath.children
    cd "src/github.com/blendle/kubecrt" do
      system "make", "build"
      bin.install "bin/kubecrt"
    end
  end

  test do
    system "#{bin}/kubecrt", "--version"
  end
end
