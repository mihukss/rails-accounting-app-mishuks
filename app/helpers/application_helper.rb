module ApplicationHelper
  def print_bootstrap_alerts
    flash.each do |message_type, messages|
      messages.each do |msg|
        concat(tag.div(msg, class: ['alert', "alert-#{message_type}", 'flash-message']))
      end
    end

    nil
  end
end
