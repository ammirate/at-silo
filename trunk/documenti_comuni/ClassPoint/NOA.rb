class NOA
	@@EXTS = {
		'.java' => true,
		'.jsp' => true}
	
	def self.calc(files)
		files.select{|f| @@EXTS[f.extname]}.each do |f|
			nem = new(f)
			print "#{f}: #{nem.compute}"
		end
	end
	
	@@BASE_DICT = nil

	def get_base
		unless @@BASE_DICT
			@@BASE_DICT = {}
			@@BASE_DICT.default = 0
			base = File.new("#{File.dirname(__FILE__)}/noa.csv")
			begin
				base.readlines.each do |ln|
					ln.chomp!
					sp = ln.split(";")
					@@BASE_DICT[sp[0]] += sp[1].to_i
				end
				@@BASE_DICT.freeze
			ensure
				base.close
			end
		end
		return @@BASE_DICT
	end
	
	def initialize(input)
		@in = input.to_s.gsub(/^.+\/src\//, "").gsub("/", ".");
		@base = get_base
	end
	
	def compute
		return @base[@in]
	end
end