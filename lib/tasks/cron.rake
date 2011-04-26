task :cron => :environment do
  if [6,12,18,22].include?(Time.now.hour)
    puts "checking for purchases"
    UsedCardBoardBoxProduct.check_for_purchases
    puts "done."
  end

end
