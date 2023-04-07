class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: ['Fiction', 'Non-Fiction']
   validate :title_is_clickbait

    def title_is_clickbait
        unless title =~ /Won't Believe|Secret|Top \d|Guess/
            errors.add(:title, "Title must be clickbait")
        end 
    end

end
