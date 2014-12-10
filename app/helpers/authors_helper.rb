module AuthorsHelper
  def date_of_birth(author)
    content_tag :span do
      "#{best_in_place author, :dob, as: :date, place_holder: 'DN'}".html_safe
    end
  end
  
  def date_of_death(author)
    unless author.taken?
      content_tag :span do
        " - #{best_in_place author, :dod, as: :date, place_holder: 'DM'}".html_safe
      end
    end
  end
  
  def lifetime(author)
    if !!author.dob
      content_tag :span do
        " | #{author_age(author.dob, author.dod)} anos de idade".html_safe
      end
    end
  end
  
  def author_age(dob, dod)
    now = Time.now.utc.to_date
    if dod
      dod.year - dob.year - ((dod.month > dob.month || (dod.month == dob.month && dod.day >= dob.day)) ? 0 : 1)
    else
      now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end
  end
end