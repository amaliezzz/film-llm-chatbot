// LIMPIAR BASE DE DATOS
MATCH (n) DETACH DELETE n;

// GÉNEROS
CREATE (:Genre {name:'Action'});
CREATE (:Genre {name:'Sci-Fi'});
CREATE (:Genre {name:'Drama'});
CREATE (:Genre {name:'Romance'});
CREATE (:Genre {name:'Horror'});
CREATE (:Genre {name:'Comedy'});
CREATE (:Genre {name:'Crime'});
CREATE (:Genre {name:'Western'});
CREATE (:Genre {name:'War'});


// PERSONAS
CREATE (:Person {name:'Lilly Wachowski', born:1967});
CREATE (:Person {name:'Christopher Nolan', born:1970});
CREATE (:Person {name:'James Cameron', born:1954});
CREATE (:Person {name:'Stanley Kubrick', born:1928});
CREATE (:Person {name:'Alejandro G. Iñárritu', born:1963});
CREATE (:Person {name:'Martin Scorsese', born:1942});
CREATE (:Person {name:'Cameron Crowe', born:1957});
CREATE (:Person {name:'Miloš Forman', born:1932});
CREATE (:Person {name:'Quentin Tarantino', born:1963});
CREATE (:Person {name:'Keanu Reeves', born:1964});
CREATE (:Person {name:'Carrie-Anne Moss', born:1967});
CREATE (:Person {name:'Leonardo DiCaprio', born:1974});
CREATE (:Person {name:'Christian Bale', born:1974});
CREATE (:Person {name:'Heath Ledger', born:1979});
CREATE (:Person {name:'Matthew McConaughey', born:1969});
CREATE (:Person {name:'Kate Winslet', born:1975});
CREATE (:Person {name:'Sam Worthington', born:1976});
CREATE (:Person {name:'Keir Dullea', born:1936});
CREATE (:Person {name:'Malcolm McDowell', born:1943});
CREATE (:Person {name:'Jack Nicholson', born:1937});
CREATE (:Person {name:'Tom Cruise', born:1962});
CREATE (:Person {name:'Nicole Kidman', born:1967});
CREATE (:Person {name:'Michael Keaton', born:1951});
CREATE (:Person {name:'Edward Norton', born:1969});
CREATE (:Person {name:'John Travolta', born:1954});
CREATE (:Person {name:'Samuel L. Jackson', born:1948});
CREATE (:Person {name:'Uma Thurman', born:1970});
CREATE (:Person {name:'Christoph Waltz', born:1956});
CREATE (:Person {name:'Brad Pitt', born:1963});
CREATE (:Person {name:'Jamie Foxx', born:1967});
CREATE (:Person {name:'Ray Liotta', born:1954});
CREATE (:Person {name:'Robert De Niro', born:1943});
CREATE (:Person {name:'Joe Pesci', born:1943});


// PELÍCULAS
CREATE (:Movie {title:'The Matrix', released:1999, tagline:'Welcome to the Real World'});
CREATE (:Movie {title:'The Matrix Reloaded', released:2003, tagline:'Free your mind'});
CREATE (:Movie {title:'Inception', released:2010, tagline:'Your mind is the scene of the crime'});
CREATE (:Movie {title:'The Dark Knight', released:2008, tagline:'Why so serious?'});
CREATE (:Movie {title:'Batman Begins', released:2005, tagline:'Evil fears the knight'});
CREATE (:Movie {title:'Interstellar', released:2014, tagline:'Mankind was born on Earth. It was never meant to die here.'});
CREATE (:Movie {title:'Titanic', released:1997, tagline:'Nothing on Earth could come between them'});
CREATE (:Movie {title:'Avatar', released:2009, tagline:'Enter the World of Pandora'});
CREATE (:Movie {title:'2001: A Space Odyssey', released:1968, tagline:'The ultimate trip'});
CREATE (:Movie {title:'A Clockwork Orange', released:1971, tagline:'Being the adventures of a young man...'});
CREATE (:Movie {title:'The Shining', released:1980, tagline:'The tide of terror that swept America is here'});
CREATE (:Movie {title:'Eyes Wide Shut', released:1999, tagline:'Enter the world of a dream'});
CREATE (:Movie {title:'The Revenant', released:2015, tagline:'Blood lost. Life found.'});
CREATE (:Movie {title:'Birdman', released:2014, tagline:'What is it all about?'});
CREATE (:Movie {title:'Shutter Island', released:2010, tagline:'Someone is missing'});
CREATE (:Movie {title:'The Wolf of Wall Street', released:2013, tagline:'More is never enough'});
CREATE (:Movie {title:'Goodfellas', released:1990, tagline:'Three Decades of Life in the Mafia'});
CREATE (:Movie {title:'Jerry Maguire', released:1996, tagline:'The rest of his life begins now'});
CREATE (:Movie {title:"One Flew Over the Cuckoo's Nest", released:1975, tagline:"If he's crazy, what does that make you?"});
CREATE (:Movie {title:'Pulp Fiction', released:1994, tagline:'Just because you are a character does not mean you have character'});
CREATE (:Movie {title:'Kill Bill: Volume 1', released:2003, tagline:'Go ahead, make her day'});
CREATE (:Movie {title:'Kill Bill: Volume 2', released:2004, tagline:'The bride is back for the final cut'});
CREATE (:Movie {title:'Inglourious Basterds', released:2009, tagline:'Once upon a time in Nazi-occupied France'});
CREATE (:Movie {title:'Django Unchained', released:2012, tagline:'Life, liberty and the pursuit of vengeance'});


// ÍNDICES
CREATE INDEX IF NOT EXISTS FOR (m:Movie) ON (m.title);
CREATE INDEX IF NOT EXISTS FOR (p:Person) ON (p.name);
CREATE INDEX IF NOT EXISTS FOR (g:Genre) ON (g.name);

// RELACIONES DIRECTED
MATCH (p:Person {name:'Lilly Wachowski'}), (m:Movie {title:'The Matrix'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Lilly Wachowski'}), (m:Movie {title:'The Matrix Reloaded'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Christopher Nolan'}), (m:Movie {title:'Inception'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Christopher Nolan'}), (m:Movie {title:'The Dark Knight'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Christopher Nolan'}), (m:Movie {title:'Batman Begins'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Christopher Nolan'}), (m:Movie {title:'Interstellar'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'James Cameron'}), (m:Movie {title:'Titanic'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'James Cameron'}), (m:Movie {title:'Avatar'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Stanley Kubrick'}), (m:Movie {title:'2001: A Space Odyssey'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Stanley Kubrick'}), (m:Movie {title:'A Clockwork Orange'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Stanley Kubrick'}), (m:Movie {title:'The Shining'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Stanley Kubrick'}), (m:Movie {title:'Eyes Wide Shut'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Alejandro G. Iñárritu'}), (m:Movie {title:'The Revenant'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Alejandro G. Iñárritu'}), (m:Movie {title:'Birdman'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Martin Scorsese'}), (m:Movie {title:'Shutter Island'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Martin Scorsese'}), (m:Movie {title:'The Wolf of Wall Street'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Martin Scorsese'}), (m:Movie {title:'Goodfellas'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Cameron Crowe'}), (m:Movie {title:'Jerry Maguire'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Miloš Forman'}), (m:Movie {title:"One Flew Over the Cuckoo's Nest"}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Quentin Tarantino'}), (m:Movie {title:'Pulp Fiction'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Quentin Tarantino'}), (m:Movie {title:'Kill Bill: Volume 1'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Quentin Tarantino'}), (m:Movie {title:'Kill Bill: Volume 2'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Quentin Tarantino'}), (m:Movie {title:'Inglourious Basterds'}) CREATE (p)-[:DIRECTED]->(m);
MATCH (p:Person {name:'Quentin Tarantino'}), (m:Movie {title:'Django Unchained'}) CREATE (p)-[:DIRECTED]->(m);


// RELACIONES ACTED_IN
MATCH (p:Person {name:'Keanu Reeves'}), (m:Movie {title:'The Matrix'}) CREATE (p)-[:ACTED_IN {roles:['Neo']}]->(m);
MATCH (p:Person {name:'Carrie-Anne Moss'}), (m:Movie {title:'The Matrix'}) CREATE (p)-[:ACTED_IN {roles:['Trinity']}]->(m);
MATCH (p:Person {name:'Keanu Reeves'}), (m:Movie {title:'The Matrix Reloaded'}) CREATE (p)-[:ACTED_IN {roles:['Neo']}]->(m);
MATCH (p:Person {name:'Carrie-Anne Moss'}), (m:Movie {title:'The Matrix Reloaded'}) CREATE (p)-[:ACTED_IN {roles:['Trinity']}]->(m);
MATCH (p:Person {name:'Leonardo DiCaprio'}), (m:Movie {title:'Inception'}) CREATE (p)-[:ACTED_IN {roles:['Cobb']}]->(m);
MATCH (p:Person {name:'Christian Bale'}), (m:Movie {title:'The Dark Knight'}) CREATE (p)-[:ACTED_IN {roles:['Bruce Wayne']}]->(m);
MATCH (p:Person {name:'Heath Ledger'}), (m:Movie {title:'The Dark Knight'}) CREATE (p)-[:ACTED_IN {roles:['Joker']}]->(m);
MATCH (p:Person {name:'Christian Bale'}), (m:Movie {title:'Batman Begins'}) CREATE (p)-[:ACTED_IN {roles:['Bruce Wayne']}]->(m);
MATCH (p:Person {name:'Matthew McConaughey'}), (m:Movie {title:'Interstellar'}) CREATE (p)-[:ACTED_IN {roles:['Cooper']}]->(m);
MATCH (p:Person {name:'Leonardo DiCaprio'}), (m:Movie {title:'Titanic'}) CREATE (p)-[:ACTED_IN {roles:['Jack']}]->(m);
MATCH (p:Person {name:'Kate Winslet'}), (m:Movie {title:'Titanic'}) CREATE (p)-[:ACTED_IN {roles:['Rose']}]->(m);
MATCH (p:Person {name:'Sam Worthington'}), (m:Movie {title:'Avatar'}) CREATE (p)-[:ACTED_IN {roles:['Jake Sully']}]->(m);
MATCH (p:Person {name:'Keir Dullea'}), (m:Movie {title:'2001: A Space Odyssey'}) CREATE (p)-[:ACTED_IN {roles:['Dr. Dave Bowman']}]->(m);
MATCH (p:Person {name:'Malcolm McDowell'}), (m:Movie {title:'A Clockwork Orange'}) CREATE (p)-[:ACTED_IN {roles:['Alex DeLarge']}]->(m);
MATCH (p:Person {name:'Jack Nicholson'}), (m:Movie {title:'The Shining'}) CREATE (p)-[:ACTED_IN {roles:['Jack Torrance']}]->(m);
MATCH (p:Person {name:'Tom Cruise'}), (m:Movie {title:'Eyes Wide Shut'}) CREATE (p)-[:ACTED_IN {roles:['Dr. Bill Harford']}]->(m);
MATCH (p:Person {name:'Nicole Kidman'}), (m:Movie {title:'Eyes Wide Shut'}) CREATE (p)-[:ACTED_IN {roles:['Alice Harford']}]->(m);
MATCH (p:Person {name:'Leonardo DiCaprio'}), (m:Movie {title:'The Revenant'}) CREATE (p)-[:ACTED_IN {roles:['Hugh Glass']}]->(m);
MATCH (p:Person {name:'Michael Keaton'}), (m:Movie {title:'Birdman'}) CREATE (p)-[:ACTED_IN {roles:['Riggan Thomson']}]->(m);
MATCH (p:Person {name:'Edward Norton'}), (m:Movie {title:'Birdman'}) CREATE (p)-[:ACTED_IN {roles:['Mike Shiner']}]->(m);
MATCH (p:Person {name:'Leonardo DiCaprio'}), (m:Movie {title:'Shutter Island'}) CREATE (p)-[:ACTED_IN {roles:['Teddy Daniels']}]->(m);
MATCH (p:Person {name:'Leonardo DiCaprio'}), (m:Movie {title:'The Wolf of Wall Street'}) CREATE (p)-[:ACTED_IN {roles:['Jordan Belfort']}]->(m);
MATCH (p:Person {name:'Ray Liotta'}), (m:Movie {title:'Goodfellas'}) CREATE (p)-[:ACTED_IN {roles:['Henry Hill']}]->(m);
MATCH (p:Person {name:'Robert De Niro'}), (m:Movie {title:'Goodfellas'}) CREATE (p)-[:ACTED_IN {roles:['Jimmy Conway']}]->(m);
MATCH (p:Person {name:'Joe Pesci'}), (m:Movie {title:'Goodfellas'}) CREATE (p)-[:ACTED_IN {roles:['Tommy DeVito']}]->(m);
MATCH (p:Person {name:'Tom Cruise'}), (m:Movie {title:'Jerry Maguire'}) CREATE (p)-[:ACTED_IN {roles:['Jerry Maguire']}]->(m);
MATCH (p:Person {name:'Jack Nicholson'}), (m:Movie {title:"One Flew Over the Cuckoo's Nest"}) CREATE (p)-[:ACTED_IN {roles:['Randle McMurphy']}]->(m);
MATCH (p:Person {name:'John Travolta'}), (m:Movie {title:'Pulp Fiction'}) CREATE (p)-[:ACTED_IN {roles:['Vincent Vega']}]->(m);
MATCH (p:Person {name:'Samuel L. Jackson'}), (m:Movie {title:'Pulp Fiction'}) CREATE (p)-[:ACTED_IN {roles:['Jules Winnfield']}]->(m);
MATCH (p:Person {name:'Uma Thurman'}), (m:Movie {title:'Pulp Fiction'}) CREATE (p)-[:ACTED_IN {roles:['Mia Wallace']}]->(m);
MATCH (p:Person {name:'Uma Thurman'}), (m:Movie {title:'Kill Bill: Volume 1'}) CREATE (p)-[:ACTED_IN {roles:['The Bride']}]->(m);
MATCH (p:Person {name:'Uma Thurman'}), (m:Movie {title:'Kill Bill: Volume 2'}) CREATE (p)-[:ACTED_IN {roles:['The Bride']}]->(m);
MATCH (p:Person {name:'Christoph Waltz'}), (m:Movie {title:'Inglourious Basterds'}) CREATE (p)-[:ACTED_IN {roles:['Hans Landa']}]->(m);
MATCH (p:Person {name:'Brad Pitt'}), (m:Movie {title:'Inglourious Basterds'}) CREATE (p)-[:ACTED_IN {roles:['Lt. Aldo Raine']}]->(m);
MATCH (p:Person {name:'Leonardo DiCaprio'}), (m:Movie {title:'Django Unchained'}) CREATE (p)-[:ACTED_IN {roles:['Calvin Candie']}]->(m);
MATCH (p:Person {name:'Christoph Waltz'}), (m:Movie {title:'Django Unchained'}) CREATE (p)-[:ACTED_IN {roles:['Dr. King Schultz']}]->(m);
MATCH (p:Person {name:'Samuel L. Jackson'}), (m:Movie {title:'Django Unchained'}) CREATE (p)-[:ACTED_IN {roles:['Stephen']}]->(m);
MATCH (p:Person {name:'Jamie Foxx'}), (m:Movie {title:'Django Unchained'}) CREATE (p)-[:ACTED_IN {roles:['Django']}]->(m);


// RELACIONES IN_GENRE
MATCH (m:Movie {title:'The Matrix'}), (g:Genre {name:'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Matrix'}), (g:Genre {name:'Sci-Fi'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Matrix Reloaded'}), (g:Genre {name:'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Matrix Reloaded'}), (g:Genre {name:'Sci-Fi'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Inception'}), (g:Genre {name:'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Inception'}), (g:Genre {name:'Sci-Fi'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Dark Knight'}), (g:Genre {name:'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Dark Knight'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Batman Begins'}), (g:Genre {name:'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Batman Begins'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Interstellar'}), (g:Genre {name:'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Interstellar'}), (g:Genre {name:'Sci-Fi'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Titanic'}), (g:Genre {name:'Romance'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Titanic'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Avatar'}), (g:Genre {name:'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Avatar'}), (g:Genre {name:'Sci-Fi'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'2001: A Space Odyssey'}), (g:Genre {name:'Sci-Fi'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'A Clockwork Orange'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'A Clockwork Orange'}), (g:Genre {name:'Sci-Fi'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Shining'}), (g:Genre {name:'Horror'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Shining'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Eyes Wide Shut'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Revenant'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Birdman'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Birdman'}), (g:Genre {name:'Comedy'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Shutter Island'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Shutter Island'}), (g:Genre {name:'Horror'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Wolf of Wall Street'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Wolf of Wall Street'}), (g:Genre {name:'Comedy'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Goodfellas'}), (g:Genre {name:'Crime'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Goodfellas'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Jerry Maguire'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Jerry Maguire'}), (g:Genre {name:'Romance'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:"One Flew Over the Cuckoo's Nest"}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Pulp Fiction'}), (g:Genre {name:'Crime'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Pulp Fiction'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Kill Bill: Volume 1'}), (g:Genre {name:'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Kill Bill: Volume 1'}), (g:Genre {name:'Crime'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Kill Bill: Volume 2'}), (g:Genre {name:'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Kill Bill: Volume 2'}), (g:Genre {name:'Crime'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Inglourious Basterds'}), (g:Genre {name:'War'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Inglourious Basterds'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Django Unchained'}), (g:Genre {name:'Western'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Django Unchained'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
