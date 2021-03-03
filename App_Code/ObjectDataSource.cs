using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;

/// <summary>
/// DataAccessLayer - For getting data from database
/// </summary> 

#region Simple Object DataSource
/* When you build a class to interact with the ObjectDataSource, there are a few restrictions that you should consider.
 * First of all, if you create a class with nonstatic methods, the ObjectDataSource will create a new instance of your
 * type for each method call made. It is therefore common to create types that expose only static methods to bind to
 * the ObjectDataSource to avoid the overhead of creating and disposing of an object with each method call. This also
 * means that the class you create should be stateless, as any instance of the class will be referred to only once per
 * call. Finally, the method that corresponds to the Select method of your class must return a collection of items, which
 * at the least implements the IEnumerable or is a DataSet derivative.
 * */

public static class ObjectDataSourceClass
{
    public static IEnumerable<string> GetItems()
	{
		// Used in an iterator block to provide a value to the enumerator object or
		// to signal the end of iteration. It takes one of the following forms:
		// yield return <expression>;
		// yield break;
		// expression is evaluated and returned as a value to the enumerator object;
		// expression has to be implicitly convertible to the yield type of the iterator.

		for (var i = 1; i < 6; i++)
		{
			yield return "Item " + i.ToString(CultureInfo.InvariantCulture);
		}
	}

}
#endregion

#region Complex Object DataSource
public class Movie
{
    public Movie() { }
	public Movie(int movieId, string title, DateTime releaseDate)
	{
		MovieId = movieId;
		Title = title;
		ReleaseDate = releaseDate;
	}

    public int MovieId { get; set; }

    public string Title { get; set; }

    public DateTime ReleaseDate { get; set; }
}

public static class MovieReviewsData
{
	public static ICollection<Movie> GetMovies()
	{
		var conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
		const string query = "SELECT movie_id, title, release_date FROM movies";

		var ret = new List<Movie>();

		using (var conn = new SqlConnection(conString))
		using (var cmd = new SqlCommand(query, conn))
		{
			conn.Open();
			var reader = cmd.ExecuteReader();
			while (reader.Read())
				ret.Add(new Movie(reader.GetInt32(0), reader.GetString(1),
								  reader.GetDateTime(2)));
		}
		return ret;
	}

	public static void UpdateMovie(Movie m)
	{
		string dsn = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
		const string sql = "UPDATE movies SET title=@title, " +
		                   "release_date=@release_date WHERE movie_id=@movie_id";

		using (var conn = new SqlConnection(dsn))
		using (var cmd = new SqlCommand(sql, conn))
		{
			cmd.Parameters.AddWithValue("@movie_id", m.MovieId);
			cmd.Parameters.AddWithValue("@title", m.Title);
			cmd.Parameters.AddWithValue("@release_date", m.ReleaseDate);

			conn.Open();
			cmd.ExecuteNonQuery();
		}
	}
	public static void DeleteMovie(Movie m)
	{
		string dsn = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
		const string sql = "DELETE FROM movies WHERE movie_id=@movie_id";

		using (var conn = new SqlConnection(dsn))
		using (var cmd = new SqlCommand(sql, conn))
		{
			cmd.Parameters.AddWithValue("@movie_id", m.MovieId);

			conn.Open();
			cmd.ExecuteNonQuery();
		}
	}

	public static void InsertMovie(Movie m)
	{
		string dsn = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
		const string sql = "INSERT INTO movies (title, release_date) " +
		                   "VALUES (@title, @release_date)";

		using (var conn = new SqlConnection(dsn))
		using (var cmd = new SqlCommand(sql, conn))
		{
			cmd.Parameters.AddWithValue("@title", m.Title);
			cmd.Parameters.AddWithValue("@release_date", m.ReleaseDate);

			conn.Open();
			cmd.ExecuteNonQuery();
		}
	}
}
#endregion

