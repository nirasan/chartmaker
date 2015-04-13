class Sample
  def self.hello
    puts "hello world"
  end

  def self.gviz
    require "gviz"
    require "open3"

    g = Graph do
      node :start, {label: "はじめ"}
      node :n1, {label: "のーど　いち"}
      node :n2, {label: "のーど　に"}
      node :n3, {label: "のーど　さん"}
      node :end, {label: "おわり"}

      edge :start_n1, {label: "のーど　いち　へ"}
      edge :n1_n2
      edge :n1_n3
      edge :n2_end
      edge :n3_end

      #save(:sample1, :png)
    end

    puts g

    require 'Open3'
    Open3.popen3('dot -T png') do |stdin, stdout, stderr, thread|
      stdin.puts g
      stdin.close
      puts stdout.read
    end

  end
end
