CREATE TABLE movies (
  movie_id            INT IDENTITY(1,1) NOT NULL
                       CONSTRAINT pk_movies PRIMARY KEY CLUSTERED,
  title               NVARCHAR(64) NOT NULL,
  release_date        DATETIME NOT NULL
)
GO

CREATE TABLE reviews (
  review_id    INT IDENTITY(1,1) NOT NULL
                CONSTRAINT pk_reviews PRIMARY KEY CLUSTERED,
  movie_id     INT NOT NULL CONSTRAINT fk_reviews_movies
                FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
  summary      VARCHAR(64) NOT NULL,
  rating       INT NOT NULL,
  review       NVARCHAR(512) NOT NULL,
  reviewer     NVARCHAR(64) NULL
)
GO

