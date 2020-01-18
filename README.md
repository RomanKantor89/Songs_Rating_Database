# Songs_Rating_Database
Database that saves songs and their ratings and is able to retrieve songs based on year and and rating.

# Description
### Inserts a database of songs with the following criteria:  
1. Song title
2. Artist name
3. Album name
4. Duration
5. Genre
6. Year
7. Link 
8. Rating (awful, not bad, good, excellent, outstanding)  

Cursor called C_RATING with a parameter for selecting all songs with a certain rating level from SONGS.  

Raises Exceptions if the song is not in the specified year.  

Procedure called RAND_SELECT chooses 3 random songs and specifies their rating.
