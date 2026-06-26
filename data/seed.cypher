// LIMPIAR BASE DE DATOS
MATCH (n) DETACH DELETE n;

// GÉNEROS
CREATE (Action:Genre {name:'Action'})
CREATE (SciFi:Genre {name:'Sci-Fi'})
CREATE (Drama:Genre {name:'Drama'})
CREATE (Romance:Genre {name:'Romance'})
CREATE (Horror:Genre {name:'Horror'})
CREATE (Comedy:Genre {name:'Comedy'});


// DIRECTORES
CREATE (Wachowski:Person {name:'Lilly Wachowski', born:1967})
CREATE (Nolan:Person {name:'Christopher Nolan', born:1970})
CREATE (Cameron:Person {name:'James Cameron', born:1954})
CREATE (Kubrick:Person {name:'Stanley Kubrick', born:1928})
CREATE (Inarritu:Person {name:'Alejandro G. Iñárritu', born:1963})
CREATE (Scorsese:Person {name:'Martin Scorsese', born:1942})
CREATE (Crowe:Person {name:'Cameron Crowe', born:1957})
CREATE (Forman:Person {name:'Miloš Forman', born:1932});


// ACTORES
CREATE (Keanu:Person {name:'Keanu Reeves', born:1964})
CREATE (Carrie:Person {name:'Carrie-Anne Moss', born:1967})
CREATE (DiCaprio:Person {name:'Leonardo DiCaprio', born:1974})
CREATE (Bale:Person {name:'Christian Bale', born:1974})
CREATE (Heath:Person {name:'Heath Ledger', born:1979})
CREATE (McConaughey:Person {name:'Matthew McConaughey', born:1969})
CREATE (Kate:Person {name:'Kate Winslet', born:1975})
CREATE (Sam:Person {name:'Sam Worthington', born:1976})
CREATE (Keir:Person {name:'Keir Dullea', born:1936})
CREATE (Malcolm:Person {name:'Malcolm McDowell', born:1943})
CREATE (Nicholson:Person {name:'Jack Nicholson', born:1937})
CREATE (Cruise:Person {name:'Tom Cruise', born:1962})
CREATE (Kidman:Person {name:'Nicole Kidman', born:1967})
CREATE (Keaton:Person {name:'Michael Keaton', born:1951})
CREATE (Norton:Person {name:'Edward Norton', born:1969});


// PELÍCULAS Y RELACIONES
//The Matrix (1999)
CREATE (TheMatrix:Movie {title:'The Matrix', released:1999, tagline:'Welcome to the Real World'})
CREATE (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrix)
CREATE (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrix)
CREATE (Wachowski)-[:DIRECTED]->(TheMatrix)
CREATE (TheMatrix)-[:IN_GENRE]->(Action)
CREATE (TheMatrix)-[:IN_GENRE]->(SciFi);

// The Matrix Reloaded (2003)
CREATE (MatrixReloaded:Movie {title:'The Matrix Reloaded', released:2003, tagline:'Free your mind'})
CREATE (Keanu)-[:ACTED_IN {roles:['Neo']}]->(MatrixReloaded)
CREATE (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(MatrixReloaded)
CREATE (Wachowski)-[:DIRECTED]->(MatrixReloaded)
CREATE (MatrixReloaded)-[:IN_GENRE]->(Action)
CREATE (MatrixReloaded)-[:IN_GENRE]->(SciFi);

// Inception (2010)
CREATE (Inception:Movie {title:'Inception', released:2010, tagline:'Your mind is the scene of the crime'})
CREATE (DiCaprio)-[:ACTED_IN {roles:['Cobb']}]->(Inception)
CREATE (Nolan)-[:DIRECTED]->(Inception)
CREATE (Inception)-[:IN_GENRE]->(Action)
CREATE (Inception)-[:IN_GENRE]->(SciFi);

// The Dark Knight (2008) 
CREATE (DarkKnight:Movie {title:'The Dark Knight', released:2008, tagline:'Why so serious?'})
CREATE (Bale)-[:ACTED_IN {roles:['Bruce Wayne']}]->(DarkKnight)
CREATE (Heath)-[:ACTED_IN {roles:['Joker']}]->(DarkKnight)
CREATE (Nolan)-[:DIRECTED]->(DarkKnight)
CREATE (DarkKnight)-[:IN_GENRE]->(Action)
CREATE (DarkKnight)-[:IN_GENRE]->(Drama);

// Batman Begins (2005)
CREATE (BatmanBegins:Movie {title:'Batman Begins', released:2005, tagline:'Evil fears the knight'})
CREATE (Bale)-[:ACTED_IN {roles:['Bruce Wayne']}]->(BatmanBegins)
CREATE (Nolan)-[:DIRECTED]->(BatmanBegins)
CREATE (BatmanBegins)-[:IN_GENRE]->(Action)
CREATE (BatmanBegins)-[:IN_GENRE]->(Drama);

// Interstellar (2014) 
CREATE (Interstellar:Movie {title:'Interstellar', released:2014, tagline:'Mankind was born on Earth. It was never meant to die here.'})
CREATE (McConaughey)-[:ACTED_IN {roles:['Cooper']}]->(Interstellar)
CREATE (Nolan)-[:DIRECTED]->(Interstellar)
CREATE (Interstellar)-[:IN_GENRE]->(Action)
CREATE (Interstellar)-[:IN_GENRE]->(SciFi);

// Titanic (1997) 
CREATE (Titanic:Movie {title:'Titanic', released:1997, tagline:'Nothing on Earth could come between them'})
CREATE (DiCaprio)-[:ACTED_IN {roles:['Jack']}]->(Titanic)
CREATE (Kate)-[:ACTED_IN {roles:['Rose']}]->(Titanic)
CREATE (Cameron)-[:DIRECTED]->(Titanic)
CREATE (Titanic)-[:IN_GENRE]->(Romance)
CREATE (Titanic)-[:IN_GENRE]->(Drama);

//  Avatar (2009)
CREATE (Avatar:Movie {title:'Avatar', released:2009, tagline:'Enter the World of Pandora'})
CREATE (Sam)-[:ACTED_IN {roles:['Jake Sully']}]->(Avatar)
CREATE (Cameron)-[:DIRECTED]->(Avatar)
CREATE (Avatar)-[:IN_GENRE]->(Action)
CREATE (Avatar)-[:IN_GENRE]->(SciFi);

//  2001: A Space Odyssey (1968) 
CREATE (SpaceOdyssey:Movie {title:'2001: A Space Odyssey', released:1968, tagline:'The ultimate trip'})
CREATE (Keir)-[:ACTED_IN {roles:['Dr. Dave Bowman']}]->(SpaceOdyssey)
CREATE (Kubrick)-[:DIRECTED]->(SpaceOdyssey)
CREATE (SpaceOdyssey)-[:IN_GENRE]->(SciFi);

//  A Clockwork Orange (1971) 
CREATE (ClockworkOrange:Movie {title:'A Clockwork Orange', released:1971, tagline:'Being the adventures of a young man...'})
CREATE (Malcolm)-[:ACTED_IN {roles:['Alex DeLarge']}]->(ClockworkOrange)
CREATE (Kubrick)-[:DIRECTED]->(ClockworkOrange)
CREATE (ClockworkOrange)-[:IN_GENRE]->(Drama)
CREATE (ClockworkOrange)-[:IN_GENRE]->(SciFi);

//  The Shining (1980) 
CREATE (TheShining:Movie {title:'The Shining', released:1980, tagline:'The tide of terror that swept America is here'})
CREATE (Nicholson)-[:ACTED_IN {roles:['Jack Torrance']}]->(TheShining)
CREATE (Kubrick)-[:DIRECTED]->(TheShining)
CREATE (TheShining)-[:IN_GENRE]->(Horror)
CREATE (TheShining)-[:IN_GENRE]->(Drama);

// Eyes Wide Shut (1999) 
CREATE (EyesWideShut:Movie {title:'Eyes Wide Shut', released:1999, tagline:'Enter the world of a dream'})
CREATE (Cruise)-[:ACTED_IN {roles:['Dr. Bill Harford']}]->(EyesWideShut)
CREATE (Kidman)-[:ACTED_IN {roles:['Alice Harford']}]->(EyesWideShut)
CREATE (Kubrick)-[:DIRECTED]->(EyesWideShut)
CREATE (EyesWideShut)-[:IN_GENRE]->(Drama);

// The Revenant (2015)
CREATE (Revenant:Movie {title:'The Revenant', released:2015, tagline:'Blood lost. Life found.'})
CREATE (DiCaprio)-[:ACTED_IN {roles:['Hugh Glass']}]->(Revenant)
CREATE (Inarritu)-[:DIRECTED]->(Revenant)
CREATE (Revenant)-[:IN_GENRE]->(Drama);

//  Birdman (2014)
CREATE (Birdman:Movie {title:'Birdman', released:2014, tagline:'What is it all about?'})
CREATE (Keaton)-[:ACTED_IN {roles:['Riggan Thomson']}]->(Birdman)
CREATE (Norton)-[:ACTED_IN {roles:['Mike Shiner']}]->(Birdman)
CREATE (Inarritu)-[:DIRECTED]->(Birdman)
CREATE (Birdman)-[:IN_GENRE]->(Drama)
CREATE (Birdman)-[:IN_GENRE]->(Comedy);

//  Shutter Island (2010)
CREATE (ShutterIsland:Movie {title:'Shutter Island', released:2010, tagline:'Someone is missing'})
CREATE (DiCaprio)-[:ACTED_IN {roles:['Teddy Daniels']}]->(ShutterIsland)
CREATE (Scorsese)-[:DIRECTED]->(ShutterIsland)
CREATE (ShutterIsland)-[:IN_GENRE]->(Drama)
CREATE (ShutterIsland)-[:IN_GENRE]->(Horror);

//  The Wolf of Wall Street (2013)
CREATE (WolfWallStreet:Movie {title:'The Wolf of Wall Street', released:2013, tagline:'More is never enough'})
CREATE (DiCaprio)-[:ACTED_IN {roles:['Jordan Belfort']}]->(WolfWallStreet)
CREATE (Scorsese)-[:DIRECTED]->(WolfWallStreet)
CREATE (WolfWallStreet)-[:IN_GENRE]->(Drama)
CREATE (WolfWallStreet)-[:IN_GENRE]->(Comedy);

//  Jerry Maguire (1996) 
CREATE (JerryMaguire:Movie {title:'Jerry Maguire', released:1996, tagline:'The rest of his life begins now'})
CREATE (Cruise)-[:ACTED_IN {roles:['Jerry Maguire']}]->(JerryMaguire)
CREATE (Crowe)-[:DIRECTED]->(JerryMaguire)
CREATE (JerryMaguire)-[:IN_GENRE]->(Drama)
CREATE (JerryMaguire)-[:IN_GENRE]->(Romance);

// One Flew Over the Cuckoo's Nest (1975) 
CREATE (CuckoosNest:Movie {title:"One Flew Over the Cuckoo's Nest", released:1975, tagline:"If he's crazy, what does that make you?"})
CREATE (Nicholson)-[:ACTED_IN {roles:['Randle McMurphy']}]->(CuckoosNest)
CREATE (Forman)-[:DIRECTED]->(CuckoosNest)
CREATE (CuckoosNest)-[:IN_GENRE]->(Drama);

// ÍNDICES
CREATE INDEX IF NOT EXISTS FOR (m:Movie) ON (m.title);
CREATE INDEX IF NOT EXISTS FOR (p:Person) ON (p.name);
CREATE INDEX IF NOT EXISTS FOR (g:Genre) ON (g.name);
