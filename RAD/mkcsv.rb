class ElementoFlusso
	attr_reader :azione, :autore
	
	def initialize(azione, autore)
		@azione = azione
		@autore = autore
	end
end

def parse(text, fields)
	usecase = {}
	curfield = nil
	
	for line in text
		#$stderr.puts("Parsing line '#{line}'")
		sl = line.chomp.strip
		if sl && sl.size > 1 then
			#$stderr.puts("Parsing stripped line '#{sl}' of size #{sl.size}")
			fieldline = false
			
			for field in fields
				if sl[field] then
					curfield = field
					usecase[curfield] = []
					fieldline = true
					#$stderr.puts("#{ARGV[0]}: Parsing field #{curfield}")
				else
					#$stderr.puts("Line #{sl} doesn't match #{field}")
				end
			end
			
			if not fieldline then
				if not curfield then
					$stderr.puts("Buggy line: '#{sl}'")
				end
				usecase[curfield].push(sl)
			end
		end
	end
	
	#Remove potential description
	if not usecase.has_key?(curfield) then
		$stderr.puts("Buggy field: '#{curfield}'")
	end
	
	pd = usecase[curfield].pop
	m = pd.match(/UC_[MAH](_\d+[A-Za-z]*)+/)
	if m then
		usecase["ucname"] = m[0]
	else
		usecase[curfield].push(pd)
		usecase["ucname"] = "<NOT FOUND>"
	end
	
	return usecase
end

def get_author(item)
	if item.match(/^(\d|\s|[-\._\)\(])*il sistema/i)
		return "Sistema"
	else
		return "Attore"
	end
end

f = File.new(ARGV[0], "r")
txt = f.readlines
f.close

fields = ['Nome', 'Specializza', 'Attori', 'Entry', 'Exit', 'Flusso', 'Exception', 'Requisiti']
usecase = parse(txt, fields)

for field in fields
	if not usecase.has_key?(field) then
		$stderr.puts "#{ARGV[0]}: impossibile isolare il campo #{field}"
	end
end

if not usecase.has_key?('Flusso') then
	$stderr.puts "#{ARGV[0]}: impossibile procedere senza il flusso degli eventi"
	exit 1
end

usecase['Flusso'].map!{|item| m = item.match(/\d+\. */)
                       if m then item = m.post_match end
                       ElementoFlusso.new(item, get_author(item))}

if not usecase.has_key?("ucname") then
	$stderr.puts "#{ARGV[0]}: impossibile isolare la descrizione"
end

i = 0
for item in usecase['Flusso']
	$stdout.print("#{usecase['ucname']};#{i += 1};#{item.autore};")
	
	sugg_type = nil
	#Try some heuristics on the entry
	case item.autore
	when "Attore"
		auth = "Attore"
		if item.azione[/sottomette/i] then
			sugg_type = "E"
		end
	when "Sistema"
		auth = "Sistema"
		if item.azione[/salva/i] then
			sugg_type = "W"
		elsif (item.azione[/carica/i]) || (item.azione[/legge/i]) then
			sugg_type = "R"
		elsif (item.azione[/visualizza/i]) || (item.azione[/mostra/i]) || (item.azione[/notifica/i]) then
			sugg_type = "X"
		end
	end
	
	$stdout.puts("#{item.azione};#{(sugg_type) ? sugg_type : "N.A."}")
end

# #read magic template
# f = File.new(ARGV[1], "r")
# txt = f.readlines.inject(:+)
# f.close
# 
# #perform substitution
# usecase.each{|field,value| do_replace(txt, field, value)}
# txt.sub!("$$Descrizione$$", description)
# print txt