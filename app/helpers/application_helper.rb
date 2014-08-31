module ApplicationHelper
  def user_link(user)
    link_to user.name, user_path(user), class: 'main-color'
  end

  def formalize(time)
    time < 1.minute.ago ? "#{time_ago_in_words(time)}前" : '1分以内'
  end

  def news_title(news)
    link_to truncate(news.title, length: 36), news.url, class: 'main-color', target: '_blank'
  end

  def news_full_title(news)
    link_to news.title, news.url, class: 'main-color', target: '_blank'
  end

  def jump_news_title(news)
    link_to news_jump_path(news), class: 'main-color', target: '_blank' do
      truncate(news.title, length: 36)
    end
  end

  def form_day(time)
    wdays = %w(
                Sunday
                Monday
                Tuesday
                Wednesday
                Thursday
                Friday
                Saturday
              )
    time.strftime('%-m/%-d') + " #{wdays[time.wday]}"
  end
end
