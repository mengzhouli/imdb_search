class Movie < ApplicationRecord
  belongs_to :director
  searchkick
  include PgSearch
  # searching one model
  # pg_search_scope :search_by_title_and_syllabus, against: [ :title, :syllabus ]
  # still only one model
  # pg_search_scope :global_search,
  #   against: [ :title, :syllabus ],
  #   associated_against: {
  #     director: [ :first_name, :last_name ]
  #   }
  multisearchable against: [:title, :syllabus]
end

# the following is code for searching and rebuilts all object as multisearch options
# PSearch::Multisearch.rebuild(Movie)
# PgSearch::Multisearch.rebuild(Serie)
# results = PgSearch.multisearch('superman')
# this is a multisearch object

# results.each do |result|
#   puts result.searchable
# end

# convert multisearch object back to their normal object
#result.maps(&:searchable) == result.map{|result| result.searchable}