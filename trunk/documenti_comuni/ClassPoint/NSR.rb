class NSR
	@@EXTS = {
		'.java' => true,
		'.jsp' => true}
	
	def self.calc(files)
		files.select{|f| @@EXTS[f.extname]}.each do |f|
			nem = new(f)
			print "#{f}: "
			$stdout.flush
			begin
				puts "#{nem.compute}"
			rescue
				#Riprova con ISO-8859-1
				begin
					nem = new(f.open("r:ISO-8859-1:UTF-8"))
					puts "#{nem.compute}"	
				rescue Exception => ex
					puts "FAILED"
					raise ex
				end
			end
		end
	end
	
	def initialize(input)
		@in = input
	end
	
	REXP = /\.([A-z0-9]+)\(/
	
	def compute
		fin = @in.open("r")
		begin
			return compute_inner(fin)
		rescue
			fin.close
			fin = @in.open("r:ISO-8859-1:UTF-8")
			return compute_inner(fin)
		ensure
			fin.close
		end
	end
	
	private
	def compute_inner(fin)
		reqd = {}
		reqd.default = 0
		
		until fin.eof?
			ln = fin.readline
			while (m = ln.match(REXP))
				reqd[m[1]] += 1
				ln = m.post_match
			end
		end
		
		return reqd.size
	end
end