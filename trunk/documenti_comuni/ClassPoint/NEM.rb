class NEM
	@@EXTS = {
		'.java' => :compute_java,
		'.jsp' => :compute_jsp}
	
	def self.calc(files)
		files.select{|f| @@EXTS[f.extname]}.each do |f|
			nem = new(f)
			print "#{f}: #{nem.public_send(@@EXTS[f.extname])}"
		end
	end
	
	def initialize(input)
		@in = input
	end
	
	def compute
		return public_send(@@EXTS[@in.extname])
	end
	
	REXP = /(public|protected)\s+[A-Za-z0-9_]+\s+[A-Za-z0-9_]+\(/
	
	def compute_java
		fin = @in.open("r")
		begin
			return compute_java_inner(fin)
		rescue
			fin.close
			#Riprova con ISO-8859-1
			fin = @in.open("r:ISO-8859-1:UTF-8")
			return compute_java_inner(fin)
		ensure
			fin.close
		end


	end
	
	def compute_jsp
		return 1
	end
	
	private
	def compute_java_inner(fin)
		nem = 0
		
		until fin.eof?
			ln = fin.readline
			nem += 1 if ln.match(REXP)
		end
		
		return nem
	end
end