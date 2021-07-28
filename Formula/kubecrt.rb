class Kubecrt < Formula
  desc "Convert Helm charts to Kubernetes resources"
  homepage "https://github.com/blendle/kubecrt"
  url "https://github.com/blendle/kubecrt.git",
    tag:      "v0.9.2",
    revision: "84ecbcfd325597e368cca640b734fcae3232b37d"
  head "https://github.com/blendle/kubecrt.git"

  depends_on "go" => :build

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
