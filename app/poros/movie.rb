class Movie
  attr_reader :id,
              :title,
              :summary,
              :runtime,
              :vote_count,
              :vote_average,
              :genres,
              :poster_path

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @summary = data[:overview]
    @runtime = data[:runtime]
    @vote_count = data[:vote_count]
    @vote_average = data[:vote_average]
    @genres = data[:genres]
    @poster_path = data[:poster_path]
  end
end
