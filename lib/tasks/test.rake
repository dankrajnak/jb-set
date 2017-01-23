task test: :environment do
  Dir.glob('./test/**/test_*.rb').each { |file| require file }
end