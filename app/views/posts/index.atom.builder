atom_feed do |feed|
  feed.title('The Guild')
  feed.updated(@posts.first.created_at) if @posts.any?
  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body, type: 'html')
      entry.author do |author|
        author.name('The Guild staff')
      end
    end
  end
end
