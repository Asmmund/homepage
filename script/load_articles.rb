Article.transaction do
  Article.delete_all
  News.delete_all

(1..100).each do |i|
Article.create(title: "article \# #{i}", text: "Text of article #{i}")
News.create(title: "news \# #{i}", text: "Text of news #{i}")
end
end