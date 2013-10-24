User.delete_all
Sentence.delete_all
Story.delete_all
Vote.delete_all
Authentication.delete_all

u = RegularUser.create(email: "coopermayne@gmail.com",
          name: "Cooper Mayne",
          password: "3232",
          password_confirmation: "3232"
         )

s1 = Sentence.create(text: "Many years later, as he faced the firing squad, Colonel Aureliano Buendia was to remember that distant afternoon when his father took him to discover ice.")
s2 = Sentence.create(text: "Duis venenatis magna feugiat nisi.")
s3 = Sentence.create(text: "*Once upon a time and a very good time it was there was a moocow coming down along the road and this moocow that was coming down along the raod met a nicens little boy named baby tuckoo.")
s4 = Sentence.create(text: "This is one potential next line but its kind of stupid.")
s5 = Sentence.create(text: "This is another potential line; its actually quite clever.")
st_line1 = Story.create
st_line2 = Story.create
st_line3 = Story.create

u.sentences << s1 << s2 << s3 << s4 << s5
st_line1.sentences << s1 << s2 
st_line2.sentences << s3
st_line3.sentences << s4 << s5 

#give the necessary votes to put them in the story i.e. 2 each
v = Vote.new(vote: true)
v.user = u 
v.sentence = s1
v.save

v = Vote.new(vote: true)
v.user = u 
v.sentence = s1
v.save

v = Vote.new(vote: true)
v.user = u
v.sentence = s3
v.save

v = Vote.new(vote: true)
v.user = u
v.sentence = s3
v.save
