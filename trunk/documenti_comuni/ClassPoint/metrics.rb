require_relative 'Path'

if not ARGV[0]
	puts "E' necessario specificare una metrica"
	exit 1
end

metric = ARGV[0]
begin
	require_relative metric
rescue LoadError
	puts "Impossibile caricare la metrica '#{metric}'"
	exit 1
end

begin
	metric = Class.const_get(metric)
rescue NameError
	puts "Impossibile caricare la classe '#{metric}'"
	exit 1
end

	arg = ARGV.clone
	arg.shift
begin
	metric.calc(Path.new(arg))
rescue ArgumentError, NoMethodError => ex
	puts "La classe fornita dovrebbe implementare il metodo statico calc(path)"
	raise ex
	exit 1
end