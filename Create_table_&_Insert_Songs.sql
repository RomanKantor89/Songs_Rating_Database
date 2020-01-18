-- BTD310 
-- Assignment 3 Part 1 SQL
DROP TABLE SONGS;
CREATE TABLE SONGS
  (
    s_num      NUMBER(10,0) CONSTRAINT s_num_pk PRIMARY KEY,
    s_title    VARCHAR2(50) CONSTRAINT s_title_nn NOT NULL,
    s_artist   VARCHAR2(100) CONSTRAINT s_artist_nn NOT NULL,
    s_album    VARCHAR2(100),
    s_duration DATE,
    s_genre    VARCHAR2(50) CONSTRAINT s_genre_nn NOT NULL,
    s_year     NUMBER(4,0) DEFAULT 2017,
    s_link     VARCHAR2(300),
    s_rating   VARCHAR2(20) CONSTRAINT s_rating_check CHECK(s_rating IN ('awful', 'no bad', 'good', 'excellent', 'outstanding'))
  ); 
 
CREATE sequence s_num_seq start with 1 increment BY 1 nocache;
  
  INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Rockabye',
      'Clean Bandit',
      'Rockabye (single)',
      to_date('04:09', 'MM:SS'),
      'Dance',
      2016,
      'https://youtu.be/RT_lpLoxqmQ',
      'excellent'
    );
    
INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Natural',
      'Imagine Dragons',
      'Origins',
      to_date('03:09', 'MM:SS'),
      'Alternative',
      2018,
      'https://youtu.be/9BPfyhhv7-c',
      'good'
    );
  
INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'I Like It',
      'Cardi B',
      'Invasion of privacy',
      to_date('04:14', 'MM:SS'),
      'Hip-Hop',
      2018,
      'https://www.youtube.com/watch?v=xTlNMmZKwpA',
      'no bad'
    );
    
INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Do It All The Time',
      'I Don''t Know How But They Found Me',
      '1981 Extended Play',
      to_date('02:56', 'MM:SS'),
      'Alternative',
      2018,
      'https://www.youtube.com/watch?v=nv9oqihEFnI',
      'good'
    );
    
     INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Jesus Of Suburbia',
      'Green Day',
      'American Idiot',
      to_date('09:08', 'MM:SS'),
      'Pop punk',
      2004,
      'https://www.youtube.com/watch?v=FNKPYhXmzoE',
      'outstanding'
    );
    
INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'The Sharpest Lives',
      'My Chemical Romance',
      'The Black Parade',
      to_date('03:22', 'MM:SS'),
      'Punk',
      2006,
      'https://www.youtube.com/watch?v=73Y_x30uKQg',
      'outstanding'
    );
    
     INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Creating God',
      'Avenged Sevenfold',
      'The Stage',
      to_date('05:33', 'MM:SS'),
      'Progressive Metal',
      2016,
      'https://www.youtube.com/watch?v=2WxGoFS5d_Y',
      'good'
    );
    
INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Yacht Club',
      'Lil Yachty',
      'Nuthin’ 2 Prove',
      to_date('02:47', 'MM:SS'),
      'Hip-hop',
      2018,
      'https://www.youtube.com/watch?v=qN6aWdAR1k8',
      'awful'
    );
    
     INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Crown of Horns',
      'Cryptopsy',
      'None so Vile',
      to_date('03:57', 'MM:SS'),
      'Death metal',
      1996,
      'https://www.youtube.com/watch?v=UYv269-HcqU',
      'no bad'
    );
    
INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Don''t Stop Me Now',
      'Queen',
      'Jazz',
      to_date('03:29', 'MM:SS'),
      'Pop Rock',
      1979,
      'https://www.youtube.com/watch?v=HgzGwKwLmgM',
      'excellent'
    );
    
     INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Narcissistic Cannibal',
      'Korn',
      'The Path of Totality ',
      to_date('03:15', 'MM:SS'),
      'Alt Metal',
      2011,
      'https://www.youtube.com/watch?v=CUOlc_j4rMA',
      'good'
    );
    
INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Numb',
      'Linkin Park ',
      'Meteora',
      to_date('03:08', 'MM:SS'),
      'Alt Metal',
      2003,
      'https://www.youtube.com/watch?v=kXYiU_JCYtU',
      'excellent'
    );
    
     INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Closer',
      'The Chainsmokers',
      'Collage',
      to_date('04:07', 'MM:SS'),
      'electronic',
      2016,
      'https://youtu.be/RT_lpLoxqmQ',
      'awful'
    );
    
INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Non, je ne regretted rien',
      'Édith Piaf',
      'Non, je ne regretted rien (single)',
      to_date('02:26', 'MM:SS'),
      'French Pop',
      1960,
      'https://www.youtube.com/watch?v=Q3Kvu6Kgp88',
      'good'
    );
    
     INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Call Me Maybe',
      'Carly Rae Jepsen',
      'Kiss',
      to_date('03:28', 'MM:SS'),
      'Bubblegum',
      2012,
      'https://www.youtube.com/watch?v=fWNaR-rxAic',
      'good'
    );
    
INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Ex''s and Oh''s',
      'Elle King',
      'Love Stuff',
      to_date('03:20', 'MM:SS'),
      'Alternative',
      2015,
      'https://www.youtube.com/watch?v=73Y_x30uKQg',
      'excellent'
    );
    
     INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Never Gonna Give You Up',
      'Rick Astley',
      'Never Gonna Give You Up (single)',
      to_date('03:35', 'MM:SS'),
      'Dance-pop',
      1987,
      'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      'excellent'
    );
    
INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Cannibal',
      'Kesha',
      'Cannibal',
      to_date('03:14', 'MM:SS'),
      'Dance-pop',
      2010,
      'https://www.youtube.com/watch?v=lbllGft5Qlw',
      'awful'
    );
    
     INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Havana',
      'Camila Cabello',
      'Young Thug',
      to_date('03:38', 'MM:SS'),
      'Pop',
      2017,
      'https://www.youtube.com/watch?v=HCjNJDNzw8Y',
      'no bad'
    );
    
INSERT
  INTO SONGS VALUES
    (
    s_num_seq.nextval, 
      'Hungry Hungry Models',
      'The Network',
      'Money Money 2020 ',
      to_date('02:42', 'MM:SS'),
      'Punk',
      2003,
      'https://www.youtube.com/watch?v=QKUT59h3vMw',
      'good'
    );
    
     INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Broken',
      'Lovelytheband',
      'finding it hard to smile',
      to_date('03:21', 'MM:SS'),
      'alternative',
      2018,
      'https://www.youtube.com/watch?v=qr1-WpWOUk8',
      'excellent'
    );
    
INSERT
  INTO SONGS VALUES
    (
      s_num_seq.nextval, 
      'Chop Suey!',
      'System Of A Down',
      'Toxicity',
      to_date('03:31', 'MM:SS'),
      'Alt Metal',
      2001,
      'https://www.youtube.com/watch?v=CSvFpBOe8eY',
      'outstanding'
    );
      
--  select trunc(dbms_random.value(1,1000)) num from dual;