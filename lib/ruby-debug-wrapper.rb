class RubyDebugWrapper
  def initialize
    @gems = %w{ruby-debug ruby-debug-base columnize}
    @gems << (RUBY_VERSION > '1.9' ? 'linecache19' : 'linecache')
    if (Gem.all_load_paths - $LOAD_PATH).empty? # TODO improve bundler check
      @path = Gem.default_path
      @dir = Gem.default_dir
    else
      @path = Gem.path
      @dir = Gem.dir
    end
  end

  def prepare
    @gems.each do |gem|
      if file = find_files(gem).first
        dir = File.dirname(file)
        $LOAD_PATH << dir unless $LOAD_PATH.include?(dir)
      else # giveup
        # abort(gem)
      end
    end
  end

  def self.prepare
    self.new.prepare
  end

  private

  def find_files(path)
    load_path_files = all_load_paths.map do |load_path|
      files = Dir["#{File.expand_path path, load_path}#{Gem.suffix_pattern}"]

      files.select do |load_path_file|
        File.file? load_path_file.untaint
      end
    end.flatten

    specs = searcher.find_all path

    specs_files = specs.map do |spec|
      searcher.matching_files spec, path
    end.flatten

    (load_path_files + specs_files).flatten.uniq
  end

  def searcher
    Gem.searcher
  end

  def all_load_paths
    result = []

    @path.each do |gemdir|
      each_load_path all_partials(gemdir) do |load_path|
        result << load_path
      end
    end

    result
  end

  def all_partials(gemdir)
    Dir[File.join(gemdir, 'gems/*')]
  end

  def each_load_path(partials)
    partials.each do |gp|
      base = File.basename(gp)
      specfn = File.join(@dir, "specifications", base + ".gemspec")
      if File.exist?(specfn)
        spec = eval(File.read(specfn))
        spec.require_paths.each do |rp|
          yield(File.join(gp, rp))
        end
      else
        filename = File.join(gp, 'lib')
        yield(filename) if File.exist?(filename)
      end
    end
  end
end

# abort "#{Gem.path.inspect}\n#{Gem.default_path.inspect}"
# abort "#{Gem.dir.inspect}\n#{Gem.default_dir.inspect}"
# before = $LOAD_PATH.dup
RubyDebugWrapper.prepare
# abort "Diff: #{($LOAD_PATH - before).inspect}"

require 'ruby-debug'
