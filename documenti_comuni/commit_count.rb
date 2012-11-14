###
# Legge il log svn da standard input
# e crea una mappa email => num. commit
# Quindi, calcola le valutazioni relative
###################

###################
# Tutte le mail non contenute in INTERESTING_MAILS vengono scartate
# Alle mail che non contengono '@' viene postfisso "@gmail.com"
###################
INTERESTING_MAILS = [
	"mariellaferrara1",
	"lucariot@hotmail.it",
	"duro.fra",
	"lomastoluigi",
	"marco.parisi90",
	"Kecko90"
	]

# Punti da assegnare per persona
POINTS_PER_PERSON = 2

# Punteggio massimo per persona
MAX_SCORE = 2

ccount = {}
emailrexp = /^r\d+ \| (.+) \| .+ \| (\d+) line/

for mail in INTERESTING_MAILS
	if not mail["@"] then
		mail = mail + "@gmail.com"
	end
	ccount[mail] = 0
end

while not $stdin.eof?
	l = $stdin.readline
	if (m = l.match(emailrexp)) then
		author = m[1]
		if ccount.has_key?(author) then
			ccount[author] += 1
		end
		
		for i in 0..(m[1].to_i)
			$stdin.readline
		end
	end
end

total_commits = ccount.values.inject(:+)

perc = ccount.clone
perc.each_key{|author| perc[author] /= total_commits.to_f}

puts "Totale commit: #{total_commits}"
ccount.each{|author,nc| puts "\t#{author}: #{nc} (#{(perc[author] * 100).round(2)}%)"}
puts

total_points = POINTS_PER_PERSON * perc.size
puts "Punteggi:"
perc.each{|author,p| puts "\t#{author}: #{total_points * p} --> #{[(total_points * p).round(0), MAX_SCORE].min}"}
puts
