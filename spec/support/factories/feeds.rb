Factory.define(:feed) do |f|
  f.link { 'http://joeroganexp.joerogan.libsynpro.com/rss' }
  
  f.trait :with_contents do |t|
    t.association(:contents, count: 10)
  end
end