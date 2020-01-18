
-- Q1 Part 2--
SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    CURSOR C_RATING(B_RATE VARCHAR2) IS
    SELECT S_TITLE, S_ARTIST, S_ALBUM, S_RATING FROM SONGS
    WHERE S_RATING = B_RATE;
    
    v_songs_rec c_rating%rowtype;
BEGIN 
    OPEN C_RATING('&B_RATE'); 
    LOOP 
    FETCH C_RATING into v_songs_rec;
    EXIT WHEN C_RATING%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Title: ' || v_songs_rec.s_title ||chr(10) || 'Artist: ' ||  v_songs_rec.s_artist || chr(10) 
    || 'Album: ' || v_songs_rec.s_album || chr(10) || 'Rating: ' || v_songs_rec.s_rating || chr(10));
    
    END LOOP;
    CLOSE C_RATING;
END;
/

--Q2 Part 2--

DROP TABLE SEL_SONGS;

DEFINE B_YEAR = 2018
CREATE TABLE SEL_SONGS AS
SELECT * 
FROM SONGS
WHERE S_YEAR = &B_YEAR;

undefine B_YEAR;


SET SERVEROUTPUT ON
SET VERIFY OFF
DEFINE B_YEAR = 2016;
DECLARE 

   CURSOR C_YEAR IS
    SELECT * FROM SEL_SONGS;
    
    v_songs_rec c_year%rowtype;
    bad_year    EXCEPTION;
    bad_song    EXCEPTION;

BEGIN
    OPEN C_YEAR; 
    LOOP 
    FETCH C_YEAR into v_songs_rec;
    EXIT WHEN C_YEAR%NOTFOUND;
    IF (v_songs_rec.s_year != &B_YEAR) THEN
         RAISE bad_year;
    ELSIF v_songs_rec.s_rating = 'no bad' THEN
        RAISE bad_song;
    
    ELSIF v_songs_rec.s_rating = 'awful' THEN
        RAISE bad_song;
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Title: ' || v_songs_rec.s_title ||chr(10) || 'Artist: ' ||  v_songs_rec.s_artist || chr(10) 
        || 'Album: ' || v_songs_rec.s_album || chr(10) || 'Rating: ' || v_songs_rec.s_rating || chr(10));
    END IF;
    END LOOP;
    
    
    EXCEPTION
    WHEN bad_year THEN
        DBMS_OUTPUT.PUT_LINE( v_songs_rec.s_num || '#... skipped since not in the specified year');
    WHEN bad_song THEN
        DBMS_OUTPUT.PUT_LINE( v_songs_rec.s_num || '#... skipped since not cool!');
    

    CLOSE C_YEAR;
END;


--Q3 Part 2--
DROP PROCEDURE RAND_SELECT;

CREATE PROCEDURE RAND_SELECT(N IN NUMBER, NVA OUT NUMBER, NVO OUT NUMBER) IS
    TYPE NUM_TABLE_TYPE IS TABLE OF songs.s_num%TYPE
      INDEX BY PLS_INTEGER;
      
    NUM_TABLE NUM_TABLE_TYPE;
    CURSOR c_song_cursor IS
        SELECT * FROM songs;
    v_cnt NUMBER := 0;
    v_num_cnt NUMBER;
    v_rec songs%ROWTYPE;
BEGIN
    FOR v_rec_songs IN c_song_cursor LOOP
        v_cnt := v_cnt + 1;
        NUM_TABLE(v_cnt) := v_rec_songs.s_num;
    END LOOP;
    
    DELETE FROM SEL_SONGS;
    
    NVA := 0;
    NVO := 0;
    
    FOR i in 1..N LOOP
        v_num_cnt := NUM_TABLE.COUNT;
        select trunc(dbms_random.value(1,v_cnt)) num 
        into v_cnt
        from dual;
        
        Select *
        into v_rec
        from songs
        where s_num = NUM_TABLE(v_cnt);
        
        insert into sel_songs values v_rec;
        
        IF v_rec.s_rating = 'awful' THEN
            NVA := NVA + 1;
        ELSIF v_rec.s_rating = 'outstanding' THEN
            NVO := NVO + 1;
        END IF;
        
    END LOOP;
END;


DECLARE
    v_NVA NUMBER;
    v_NVO NUMBER;
    CURSOR v_cur_rec IS
        SELECT *
        FROM SEL_SONGS;
BEGIN
    RAND_SELECT(3, v_NVA, v_NVO);
    
    FOR v_rec IN v_cur_rec LOOP
        DBMS_OUTPUT.PUT_LINE(v_rec.s_title);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Awful: ' || v_NVA || ' | Outstanding: ' || v_NVO);
    
END;