class SlackNotifier
  attr_reader :client

  WEBHOOK_URL = ENV['SLACK_WEBHOOK_URL']

  def initialize
    @client = Slack::Notifier.new(WEBHOOK_URL)
  end

  def send(message)
    Slack::Notifier.new(WEBHOOK_URL).ping("#{message[0]}")
  end
end
