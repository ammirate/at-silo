#####################################################
# ARGV[0] = input tcs
# ARGV[1] = input tr
# ARGV[2] = output
#####################################################

class TestCase
	attr_reader :tc_name, :tested_uc, :version_date, :version_no, :version_author, :test_matter, :references
	
	def initialize(tc_name, tested_uc, version_date, version_no, version_author, test_matter, references)
		@tc_name = tc_name
		@tested_uc = tested_uc
		@version_date = version_date
		@version_no = version_no
		@version_author = version_author
		@test_matter = test_matter
		@references = references
	end
	
	def self.parse(input)
		#Skip uninteresting lines
		l = ignore_upto(input, /w+/)
		l.strip!
		
		#First line shall not be xml
		if l[/^<\?xml/]
			raise "XML file given. Input shall be in plain text"
		end
		
		#First line is header
		tc_name = l
		
		#Search line beginning with 1.
		l = ignore_upto(input, /^\s*1\./)
		
		#This is the test case name.
		#TODO check consistency
		
		#Search line beginning with 2.
		ignore_upto(input, /^\s*2\./)	
		ignore_upto(input, /da testare/)
		tested_uc = input.readline.chomp.strip
		
		ignore_upto(input, /version date/i)
		version_date = input.readline.chomp.strip
		
		ignore_upto(input /Version number/i)
		version_no = input.readline.chomp.strip
		
		ignore_upto(input, /Version author/i)
		version_author = input.readline.chomp.strip
		
		#Search line beginning with 3.
		ignore_upto(input, /^\s*3\./)
		
		test_matter = nil
		ignore_upto(input, /Riferimenti$/i) do |l|
			if test_matter
				test_matter += "\n" + l.strip
			else
				test_matter = l.strip
			end
		end
		
		references = []
		ignore_upto(input, /^s*4\./) do |l|
			references.push(l.strip)
		end
		references.freeze
		
		#Don't give a fuck about the rest
		return new(tc_name, tested_uc, version_date, version_no, version_author, test_matter, references)
	end
	
	def self.ignore_upto(input, exp, &block)
		l = nil
		while (not (l = input.readline.chomp).match(exp))
			if block
				block.yield l
			else
				$stderr.puts("Ignoring line #{l}")
			end
		end
		return l
	end
	
	private_class_method :new, :ignore_upto
end

f = File.new(ARGV[1], "r")
anom = f.readlines
f.close

if anom[0][/^\[\s*[Xx]\s*\]/]
	#Skip on
	$stderr.puts("Test '#{ARGV[1]}' succeeded")
	exit 0
end

f = File.new(ARGV[0], "r")
tcs = TestCase.parse(f)
f.close

if File.exists? (ARGV[2])
	$stderr.puts("Il file \"#{ARGV[2]}\" esiste gia'.")
end

f = File.new(ARGV[2], "w")

###################OUTPUT BEGIN############################
f.print << FODT_HEREDOC_MARKER

FODT_HEREDOC_MARKER
####################OUTPUT END#############################

f.close