class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: age)
  end

  def genre_name
    self.genre ? self.genre.name : nil 
  end

  def artist_name=(name) #This is a setter method
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name #This is a getter method
    self.artist ? self.artist.name : nil #Ternary expression
  end

  def note_contents=(contents) #This is a setter method
    contents.each do |content|
      if content.strip != ""
        self.notes.build(content: content)
      end
    end
  end

  def note_contents #This is a getter method
    self.notes.map(&:content)
  end

end
