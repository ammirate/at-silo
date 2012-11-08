class ElementoFlusso
	attr_reader :azione, :autore
	
	def initialize(azione, autore)
		@azione = azione
		@autore = autore
	end
end

DEFAULT_STYLE="Table_20_Contents"

def get_regexp(fieldname)
	return Regexp.new("<text:p.*?>.*#{fieldname}.*</text:p>\\n\\s*</table:table-cell>\\n\\s*<table:table-cell.*?>((\\n|.)*?)</table:table-cell>");
end

def isolate(text, fieldname, map)
	#Isolate cell
	m = get_regexp(fieldname).match(text)
	if not m then
		return false
	end
	
	#Isolate field
	text = m[1]
	xp = /<text:p.*?>(.*?)<\/text:p>/
	res = []
	
	while (m = xp.match(text))
		if not m[1].empty? then
			res.push(m[1])
		end
		text = m.post_match
	end
	
	map[fieldname] = res
	return true
end

def get_author(item, text)
	xp = Regexp.new("<text:p.*text:style-name=\"(.*?)\".*?>#{item}</text:p>")
	m = xp.match(text)
	if m && ["Azione_20_sistema", "Azione_20_attore"].index(m[1])
		return m[1]
	elsif item.match(/^(\d|\s|[\._-\)\(])*il sistema/i)
		return "Azione_20_sistema"
	else
		return "Azione_20_attore"
	end
end

def do_replace(text, field, value)
	if value.length == 0 then
		newval = ""
	elsif value[0].is_a?(ElementoFlusso) then
		newval = value.map{|x| "<text:list-item>\n <text:p text:style-name=\"#{x.autore}\">#{x.azione}</text:p>\n</text:list-item>\n"}.reduce(:+).sub("<text:list-item>", "<text:list-item text:start-value=\"1\">")
	else
		newval = value.map{|x| "<text:p text:style-name=\"Table_20_Contents\">#{x}</text:p>\n"}.reduce(:+)
		if ['Exception'].index(field) then
			newval.gsub!(/<text:p.*?>.*?<\/text:p>/, "<text:list-item>\n \\0\n</text:list-item>").sub!("<text:list-item>", "<text:list-item text:start-value=\"1\">")
		end
	end
	
	text.sub!("$$#{field}$$", newval)
end

f = File.new(ARGV[0], "r")
txt = f.readlines.inject(:+)
f.close

usecase = {}

for field in ['Nome', 'Specializza', 'Attori', 'Entry', 'Exit', 'Flusso', 'Exception', 'Requisiti']
	if not isolate(txt, field, usecase) then
		$stderr.puts "#{ARGV[0]}: impossibile isolare il campo #{field}"
	end
end

if not usecase.has_key?('Flusso') then
	$stderr.puts "#{ARGV[0]}: impossibile procedere senza il flusso degli eventi"
	exit 1
end

usecase['Flusso'].map!{|item| ElementoFlusso.new(item, get_author(item, txt))}
description = txt.match(/<text:p.*>(.*?)<\/.*>\n\s*<\/office:text>/)
if description then
	description = description[1]
	if not description.match(/^UC_M_\d+.*: /) then
		#Try to fix the caption
		ucname = ARGV[0].match(/UC_[MAH]_\d+[^_ ]*/i)[0].upcase + ": "
		if description.match(/^(UC[_ ]*)?([MAH][_ ]*)?\d*.*?(: )?/i) then
			description.sub!(/^(UC[_ ]*)?([MAH][_ ]*)?\d*.*?(: )?/i, ucname)
		else
			description = ucname + description
		end
	end
else
	$stderr.puts "#{ARGV[0]}: impossibile isolare la descrizione"
	description = ""
end
if not usecase.has_key?('Specializza') then
	usecase['Specializza'] = ["N/D"]
end

#read magic template
f = File.new(ARGV[1], "r")
txt = f.readlines.inject(:+)
f.close

#perform substitution
usecase.each{|field,value| do_replace(txt, field, value)}
txt.sub!("$$Descrizione$$", description)
print txt