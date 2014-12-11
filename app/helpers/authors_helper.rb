module AuthorsHelper
  def date_of_birth(author)
    content_tag :span do
      "#{best_in_place author, :dob, as: :date, display_with: :time_tag, place_holder: 'DN' }".html_safe
    end
  end
  
  def date_of_death(author)
    unless author.taken?
      content_tag :span do
        " - #{best_in_place author, :dod, as: :date, display_with: :time_tag, place_holder: 'DM'}".html_safe
      end
    end
  end
  
  def lifetime(author)
    if !!author.dob
      content_tag :span do
        " | #{author_age(author.dob, author.dod)} de idade".html_safe
      end
    end
  end
  
  def author_age(dob, dod)
    if dod
      distance_of_time_in_words(dob, dod)
    else
      time_ago_in_words(dob)
    end
  end
end