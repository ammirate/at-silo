require_relative 'NEM'
require_relative 'NOA'
require_relative 'NSR'

class CP2
	@@EXTS = {
		'.java' => true,
		'.jsp' => true}
	
	def self.calc(files)
		puts "File;NSR;NEM;NOA;COMPLEX"
		files.select{|f| @@EXTS[f.extname]}.each do |f|
			cp2 = CP2.new(f)
			cp2res = cp2.compute
			
			cp2res.each_value{|v| raise v if v.kind_of?(Exception)}
			puts "#{f};#{cp2res[:nsr]};#{cp2res[:nem]};#{cp2res[:noa]};#{cp2res[:complex]}"
		end
	end
	
	def initialize(input)
		@nem = NEM.new(input)
		@noa = NOA.new(input)
		@nsr = NSR.new(input)
	end
	
	def compute
		res = {:nem => nil, :noa => nil, :nsr => nil, :complex => nil}
		
		failed = false
		
		begin
			res[:nem] = @nem.compute
		rescue Exception => ex
			res[:nem] = ex
			failed = true
		end
		
		begin
			res[:noa] = @noa.compute
		rescue Exception => ex
			res[:noa] = ex
			failed = true
		end
		
		begin
			res[:nsr] = @nsr.compute
		rescue Exception => ex
			res[:nsr] = ex
			failed = true
		end
		
		unless failed
			res[:complex] = determine_complex(res)
		end
		
		return res
	end
	
	private
	def determine_complex(res)
		case res[:nsr]
		when 0..2
			tnem = [4,8]
			tnoa = [5,9]
		when 3..4
			tnem = [3,7]
			tnoa = [4,8]
		else
			tnem = [2,6]
			tnoa = [3,7]
		end
		
		rnem = tnem.map{|x| (res[:nem] > x) ? 1 : 0}.reduce(:+)
		rnoa = tnoa.map{|x| (res[:noa] > x) ? 1 : 0}.reduce(:+)
		
		case (rnem + rnoa)
		when 0..1
			return 1
		when 2
			return 2
		when 3..4
			return 3
		else
			raise RuntimeError, "#{rnem}, #{rnoa}"
		end
	end
end