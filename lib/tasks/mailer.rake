desc "Send mailing"
task :send_mailing => :environment do
  mailing = Mailing.find(ENV["MAILING_ID"])
  mailing.delay(run_at: 5.minutes.from_now).deliver
end