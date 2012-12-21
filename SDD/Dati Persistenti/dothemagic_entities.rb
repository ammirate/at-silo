# encoding: utf-8
=begin
Formato del file testo:
(SPECIFICA DELLE ENTITÀ)?
Nome dell'entità : <nome entity>
Descrizione: <descrizione entity>
NOME		//\
TIPO		// \
NULL		//  -> Intestazioni colonne
KEY		// /
DEFAULT		///
<RIGA 1>
...
<RIGA i>
...
<RIGA N>

Descrizione Attributi
<DESCR 1>
...
<DESCR i>
...
<DESCR N>

-FINE FORMATO
Formato riga:
<nome>
<tipo>
<nullable>
<key>
<default>

Formato descr:
<nome attributo>( )?: <descrizione attributo>
=end

class Attribute
	attr_accessor :nome, :tipo, :nullable, :key, :default, :descrizione
	def initialize(nome = nil, tipo = nil, nullable = false, key = false, default = nil)
		@nome = nome
		@tipo = tipo
		@nullable = nullable
		@key = key
		@default = default
		@descrizione = nil
	end
end

class Entity
	attr_accessor :nome, :descrizione
	attr_reader :attributi
	def initialize(nome, descrizione = "", attributi = {})
		@nome = nome
		@descrizione = descrizione
		@attributi = attributi
	end
	
	def add(attr)
		n = attr.nome.upcase
		if attributi.has_key?(n) then
			return false
		else
			attributi[n] = attr
			return true
		end
	end
end

#######################################
# f is supposed to be an input stream
#######################################
def parse_attribute_row(f)
	a = Attribute.new
	a.nome = f.readline.chomp.strip
	if a.nome.empty? then return nil end
	a.tipo = f.readline.chomp.strip
	a.nullable = f.readline.upcase['NO'] != nil
	a.key = f.readline.chomp.strip
	if a.key.empty? then a.key = false end
	a.default = f.readline.chomp.strip
	if a.default.empty? then a.default = nil end
	return a
end

#######################################
# f is supposed to be an input stream
# ent is supposed to be an entity
#######################################
def parse_attributes_description(f, ent)
	expr = /(.*?): *([^\n]*)/
	attr = ent.attributi
	l = attr.size
	for i in 0..l-1
		begin
			line = f.readline
			m = line.match(expr)
			if m == nil then
				puts "Unmatching line #{line}"
			end
		end while m == nil
		
		attr_name = m[1].strip.upcase
		
		while not attr.has_key?(attr_name)
			puts "Attributo '#{attr_name}' non trovato in #{ent.nome}"
			puts "Attributi disponibili:"
			for a in attr.keys
				puts "\t#{a}"
			end
			print ": "
			attr_name = $stdin.readline.chomp.strip.upcase
		end
		a = attr[attr_name]
		a.descrizione = m[2].strip
	end
	return ent
end

#######################################
# f is supposed to be an input stream
#######################################
def parse_entity(f)
	begin_expr = /Nome *dell'? *entit.{1,2} *: *([^\n]+)/
	descr_expr = /Descrizione *: *([^\n]+)/
	
	#Align on begin_expr
	while not f.eof?
		line = f.readline
		#puts line.match(begin_expr).inspect
		if (m = line.match(begin_expr)) then
			puts "Inizio parsing entita' '#{m[1]}'"
			e = Entity.new(m[1])
			e.descrizione = f.readline.match(descr_expr)[1]
			
			#Skip headings
			for i in 1..5
				f.readline
			end
			
			#Parse attributes
			while (a = parse_attribute_row(f))
				if not e.add(a) then
					puts "Attributo duplicato '#{a.nome}' nell'entita' '#{e.nome}'"
				end
			end
			
			#Parse descriptions
			while not (l = f.readline.chomp.strip.downcase) == "descrizione attributi"
				puts "Mi aspettavo la stringa 'Descrizione attributi' per l'entita' '#{e.nome}'"
				puts "\tTrovato '#{l}'"
			end
			
			parse_attributes_description(f, e)
			
			puts "Entity '#{e.nome}' correttamente riconosciuta"
			return e
		end
	end
	
	return nil
end

#######################################
# f is supposed to be an input stream
#######################################
def parse_file(f)
	entities = []
	while (e = parse_entity(f))
		entities.push(e)
	end
	return entities
end

def fill_template(template, entity)
	#Read table row template
	row_template = template.match(/<!--ROW TEMPLATE BEGIN-->\n(.*\n)<!--ROW TEMPLATE END-->/m)[1]
	
	#Erase row template
	template.gsub!(/<!--ROW TEMPLATE BEGIN-->.*<!--ROW TEMPLATE END-->/m, "<!--ROW TEMPLATE END-->")
	
	#Read descr template
	descr_template = template.match(/<!--DESCR TEMPLATE BEGIN-->\n(.*\n)<!--DESCR TEMPLATE END-->/m)[1]
	
	#Erase descr template
	template.gsub!(/<!--DESCR TEMPLATE BEGIN-->\n(.*\n)<!--DESCR TEMPLATE END-->/m, "<!--DESCR TEMPLATE END-->")
	
	#Fill entity name
	template.gsub!("&lt;NOME ENTITY&gt;", entity.nome.capitalize)
	
	#Fill entity description
	template.gsub!("&lt;DESCRIZIONE ENTITY&gt;", entity.descrizione.capitalize)
		
	#Loop over attributes
	entity.attributi.each{|k,a|
	                      template.gsub!("<!--ROW TEMPLATE END-->", row_template.gsub("&lt;NOME&gt;", a.nome).gsub("&lt;TIPO&gt;", a.tipo).gsub("&lt;NULL&gt;", ((a.nullable) ? "SÌ" : "NO")).gsub("&lt;KEY&gt;", ((a.key) ? a.key : "")).gsub("&lt;DEFAULT&gt;", ((a.default) ? a.default : "")) + "<!--ROW TEMPLATE END-->")
	                     
	                      template.gsub!("<!--DESCR TEMPLATE END-->",descr_template.gsub("&lt;NOME ATTRIBUTO&gt;", a.nome).gsub("&lt;DESCRIZIONE ATTRIBUTO&gt;", a.descrizione) + "<!--DESCR TEMPLATE END-->")
	                      }
	
	#Neat text
	template.gsub!("<!--ROW TEMPLATE END-->\n", "")
	template.gsub!("<!--DESCR TEMPLATE END-->\n", "")
	
	return template;
end

#Parse entities
puts "Opening file #{ARGV[0]}"
entities = parse_file(File.new("#{ARGV[0]}", "r"))

#Load template
f = File.new("/tmp/Entity.fodt", "r")
template = f.readlines.inject(:+)
f.close

#Loop over entities
for e in entities
	#Open output file
	puts "Opening file #{ARGV[1]}/#{e.nome.capitalize}.fodt"
	f = File.new("#{ARGV[1]}/#{e.nome.capitalize}.fodt", "w")
	
	#Write filled-in template
	f.print(fill_template(template.clone, e))
	
	f.close
end