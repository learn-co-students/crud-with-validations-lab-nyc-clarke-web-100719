class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: {
        scope: %i[release_year artist_name]}
     validates :released, presence: true, if: -> {released == true && current_year? != nil}
   #validate :current_year?
    


    def current_year?
        current_time = Time.now
        if release_year && release_year > current_time.strftime("%Y").to_i
             errors.add(:release_year, "Must be less than or equal to the current year")
        end
    end

    def check_released
        if self.released 
            return true 
        else
            return false
        end
    end

# validates :title, presence: true
# validates :title, uniqueness: {
#   scope: %i[release_year artist_name],
#   message: 'cannot be repeated by the same artist in the same year'
# }
# validates :released, inclusion: { in: [true, false] }
# validates :artist_name, presence: true

# with_options if: :released? do |song|
#   song.validates :release_year, presence: true
#   song.validates :release_year, numericality: {
#     less_than_or_equal_to: Date.today.year
#   }
# end

# def released?
#   released
# end
end
