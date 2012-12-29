require_relative 'State'

class NEM
	@@EXTS = {
		'.java' => true,
		'.jsp' => true}
	
	DFA = StateMachine.create(
		RegexpState.new(:specifier_unpublished, :invalid, {/^public$/ => :specifier_published,
	                                                           /^(static|final)$/ => :specifier_unpublished,
	                                                           /^<.?*>/ => :partype_spec,
	                                                           /^<[^>]+/ => :partype_spec,
	                                                           /^[]
	                                                           }
		)
	
	def self.calc(files)
		files.select{|f| @@EXTS[f.extname]}.each do |f|
			nem = new(f.open("r"))
			puts "#{f}: #{nem.compute}"
		end
	end
	
	def initialize(input)
		@in = input
	end
	
	def compute
		buf = ""
		until @in.eof?
			buf += @in.readline
			
		end
	end
	
	private
	def consume(buf)
		
	end
	
	private_class_method :new
end