module ApplicationHelper
  def print_bootstrap_alerts
    flash.each do |message_type, messages|
      next unless messages.instance_of?(Array)

      messages.each do |msg|
        concat(tag.div(msg, class: ['alert', "alert-#{message_type}", 'flash-message']))
      end
    end

    nil
  end
end
