User.delete_all
Sentence.delete_all
Story.delete_all
Vote.delete_all

u = User.create(email: "coopermayne@gmail.com")
s1 = Sentence.create(text: "my first senetence")
s2 = Sentence.create(text: "Duis venenatis magna feugiat nisi")
s3 = Sentence.create(text: "Proin eleifend nisis et nibh")
s4 = Sentence.create(text: "Pralkds welkjsa dslkwe ngslkwelsl slkjwe sd.")
s5 = Sentence.create(text: "Lawlkwen alkwe  fwalksdlk awelkwea slkwe wl wlkew wlkwe lwe.")
st_line1 = Story.create
st_line2 = Story.create
st_line3 = Story.create

v = Vote.new(vote: true)
v.user = u 
v.sentence = s1
v.save

v = Vote.new(vote: true)
v.user = u
v.sentence = s5
v.save

u.sentences << s1 << s2 << s3 << s4 << s5
st_line1.sentences << s1 << s2 
st_line2.sentences << s3
st_line3.sentences << s4 << s5 

