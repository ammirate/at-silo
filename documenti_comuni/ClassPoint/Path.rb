require 'pathname'

class PathNotFoundError < Exception
end

class Path
	include Enumerable
	
	attr_reader :basepath
	
	def initialize(basepath)
		@basepath = []
		basepath.each do |path|
			np = Pathname.new(path)
			unless np.exist?
				raise PathNotFoundError, path
			end
			@basepath.push np
		end
	end
	
	def each(&blk)
		basepath.each do |path|
			if path.directory?
				iterate_dir(path, &blk)
			else
				yield path
			end
		end
	end
	
	private
	def iterate_dir(d, &blk)
		d.each_child do |c|
			if c.directory?
				iterate_dir(c, &blk)
			else
				yield c
			end
		end
	end
end