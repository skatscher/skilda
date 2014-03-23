// execute with '$ neo4j-shell -file seed.cypher'

CREATE
  (e1:Employee {first_name:"Matthias",last_name:"Baumgart"}),
  (e2:Employee {first_name:"Marco",last_name:"Dierenfeldt"}),
  (e3:Employee {first_name:"Sebastian",last_name:"Schmeck"});

CREATE
  (s1:Skill {name:"Java",category:"Programmiersprache",synonyms:["Java 5","Java 6","JEE"],description:"Eine statisch typisierte Sprache."}),
  (s2:Skill {name:"JavaScript",category:"Programmiersprache",synonyms:["JS"],description:"Eine dynamisch typisierte Sprache."}),
  (s3:Skill {name:"Ruby",category:"Programmiersprache",synonyms:["JRuby"],description:"Eine dynamisch typisierte Skriptsprache."}),
  (s4:Skill {name:"Neo4j",category:"Datenbank",synonyms:[],description:"Eine Graph-Datenbank."}),
  (s5:Skill {name:"Lua",category:"Programmiersprache",synonyms:[],description:"Eine dynamisch typisierte Skriptsprache."});


MATCH (e:Employee {last_name:"Schmeck"}), (s:Skill {name:"Ruby"})
CREATE UNIQUE (e)-[r:HAS_SKILL {level:"Professionell"}]->(s);
MATCH (e:Employee {last_name:"Schmeck"}), (s:Skill {name:"Java"})
CREATE UNIQUE (e)-[r:HAS_SKILL {level:"Professionell"}]->(s);
MATCH (e:Employee {last_name:"Schmeck"}), (s:Skill {name:"JavaScript"})
CREATE UNIQUE (e)-[r:HAS_SKILL {level:"Grundlagen"}]->(s);
MATCH (e:Employee {last_name:"Schmeck"}), (s:Skill {name:"Neo4j"})
CREATE UNIQUE (e)-[r:HAS_SKILL {level:"Grundlagen"}]->(s);

MATCH (e:Employee {last_name:"Baumgart"}), (s:Skill {name:"Ruby"})
CREATE UNIQUE (e)-[r:HAS_SKILL {level:"Grundlagen"}]->(s);
MATCH (e:Employee {last_name:"Baumgart"}), (s:Skill {name:"Java"})
CREATE UNIQUE (e)-[r:HAS_SKILL {level:"Professionell"}]->(s);
MATCH (e:Employee {last_name:"Baumgart"}), (s:Skill {name:"Neo4j"})
CREATE UNIQUE (e)-[r:HAS_SKILL {level:"Fortgeschritten"}]->(s);

MATCH (e:Employee {last_name:"Dierenfeldt"}), (s:Skill {name:"Java"})
CREATE UNIQUE (e)-[r:HAS_SKILL {level:"Professionell"}]->(s);
MATCH (e:Employee {last_name:"Dierenfeldt"}), (s:Skill {name:"JavaScript"})
CREATE UNIQUE (e)-[r:HAS_SKILL {level:"Professionell"}]->(s);
MATCH (e:Employee {last_name:"Dierenfeldt"}), (s:Skill {name:"Neo4j"})
CREATE UNIQUE (e)-[r:HAS_SKILL {level:"Grundlagen"}]->(s);
MATCH (e:Employee {last_name:"Dierenfeldt"}), (s:Skill {name:"Lua"})
CREATE UNIQUE (e)-[r:HAS_SKILL {level:"Professionell"}]->(s);