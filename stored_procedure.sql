--Step 1
--Start with create a table 

CREATE TABLE Anime (
    AnimeID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100),
    Genre NVARCHAR(50),
    Episodes INT,
    Rating FLOAT
);

--insert 

INSERT INTO Anime (Title, Genre, Episodes, Rating)
VALUES 
('Attack on Titan', 'Action', 75, 9.2),
('One Piece', 'Adventure', 1000, 9.0),
('Death Note', 'Thriller', 37, 9.1),
('Naruto', 'Action', 220, 8.3),
('Fullmetal Alchemist: Brotherhood', 'Fantasy', 64, 9.1),
('Demon Slayer', 'Action', 26, 8.7),
('My Hero Academia', 'Superhero', 113, 8.4),
('Jujutsu Kaisen', 'Action', 48, 8.8),
('Spy x Family', 'Comedy', 25, 8.6),
('Chainsaw Man', 'Horror', 12, 8.5);


--Step 3
--Create a stored procedure add new anime 
CREATE PROCEDURE AddAnime
    @Title NVARCHAR(100),
    @Genre NVARCHAR(50),
    @Episodes INT,
    @Rating FLOAT
AS
BEGIN
    INSERT INTO Anime (Title, Genre, Episodes, Rating)
    VALUES (@Title, @Genre, @Episodes, @Rating);
END;

--Step 4
--Execute it 
EXEC AddAnime 
    @Title = 'Attack on Titan', 
    @Genre = 'Action', 
    @Episodes = 75, 
    @Rating = 9.2;

	--Step 5
--Alter the Procedure: Add a Print Statement

ALTER PROCEDURE AddAnime
    @Title NVARCHAR(100),
    @Genre NVARCHAR(50),
    @Episodes INT,
    @Rating FLOAT
AS
BEGIN
    INSERT INTO Anime (Title, Genre, Episodes, Rating)
    VALUES (@Title, @Genre, @Episodes, @Rating);

    PRINT 'Anime successfully added!';
END;

--0Step 6 
--Drop the procedure 
DROP PROCEDURE AddAnime;

--Step 7

--Use output parameter return newly inserted AnimeID

CREATE PROCEDURE AddAnimeWithOutput
    @Title NVARCHAR(100),
    @Genre NVARCHAR(50),
    @Episodes INT,
    @Rating FLOAT,
    @NewAnimeID INT OUTPUT
AS
BEGIN
    INSERT INTO Anime (Title, Genre, Episodes, Rating)
    VALUES (@Title, @Genre, @Episodes, @Rating);

    SET @NewAnimeID = SCOPE_IDENTITY();
END;


--Step 8
--Execute with output 
DECLARE @ID INT;

EXEC AddAnimeWithOutput 
    @Title = 'One Piece',
    @Genre = 'Adventure',
    @Episodes = 1000,
    @Rating = 9.0,
    @NewAnimeID = @ID OUTPUT;

PRINT 'New Anime ID: ' + CAST(@ID AS NVARCHAR);

Sept 0
--Stored procedure with conditions, variables and loop 
CREATE PROCEDURE PrintTopRatedAnime
    @MinRating FLOAT
AS
BEGIN
    DECLARE @AnimeTitle NVARCHAR(100);
    DECLARE @CurrentID INT = 1;
    DECLARE @MaxID INT;

    SELECT @MaxID = MAX(AnimeID) FROM Anime;

    WHILE @CurrentID <= @MaxID
    BEGIN
        IF EXISTS (
            SELECT 1 FROM Anime 
            WHERE AnimeID = @CurrentID AND Rating >= @MinRating
        )
        BEGIN
            SELECT @AnimeTitle = Title 
            FROM Anime 
            WHERE AnimeID = @CurrentID;

            PRINT 'Top-rated Anime: ' + @AnimeTitle;
        END;

        SET @CurrentID += 1;
    END
END;

--Sept 11

--Execute it 
EXEC PrintTopRatedAnime @MinRating = 8.5;
