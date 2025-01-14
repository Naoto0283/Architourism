module ApplicationHelper
  # ページタイトルの設定
  def page_title(title = '')
    base_title = 'Architourism'
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
