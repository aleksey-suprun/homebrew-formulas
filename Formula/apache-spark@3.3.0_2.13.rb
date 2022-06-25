class ApacheSparkAT330213 < Formula
  desc "Engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  url "https://dlcdn.apache.org/spark/spark-3.3.0/spark-3.3.0-bin-hadoop3-scala2.13.tgz"
  mirror "https://archive.apache.org/dist/spark/spark-3.3.0/spark-3.3.0-bin-hadoop3-scala2.13.tgz"
  version "3.3.0"
  sha256 "7fbfb59b46fcbf0f7b3584c923d43fe6d0b405ab050d5ad43f659ead8521b4e4"
  license "Apache-2.0"
  head "https://github.com/apache/spark.git", branch: "master"

  keg_only :versioned_formula

  depends_on "openjdk@11"

  def install
    # Rename beeline to distinguish it from hive's beeline
    mv "bin/beeline", "bin/spark-beeline"

    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", JAVA_HOME: Formula["openjdk@11"].opt_prefix)
  end

  test do
    assert_match "Long = 1000",
      pipe_output(bin/"spark-shell --conf spark.driver.bindAddress=127.0.0.1",
                  "sc.parallelize(1 to 1000).count()")
  end
end
