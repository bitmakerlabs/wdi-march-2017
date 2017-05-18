puts 'Creating'

Page.create!(
  slug: 'about',
  title: 'About',
  content: <<~ooo
    I recommend you don't fire until you're within 40,000 kilometers. You did exactly what you had to do. You considered all your options, you tried every alternative and then you made the hard choice. Your head is not an artifact! I'm afraid I still don't understand, sir. You enjoyed that. Some days you get the bear, and some days the bear gets you. Wouldn't that bring about chaos? Fate. It protects fools, little children, and ships named "Enterprise." Mr. Worf, you do remember how to fire phasers? I am your worst nightmare! What? We're not at all alike! A lot of things can change in twelve years, Admiral. The look in your eyes, I recognize it. You used to have it for me.
  ooo
)

Page.create!(
  slug: 'contact',
  title: 'Contact',
  content: <<~ooo
    Introvert jazz cafes having a few beers self-deprecating humor. Degree in philosophy Vampire Weekend introvert self-deprecating humor really hoppy beers, grilling tacos really hoppy beers medical school I'm looking for. Family is very important to me bikes trying this for the first time Breaking Bad I'm really good at bored at home.
  ooo
)
