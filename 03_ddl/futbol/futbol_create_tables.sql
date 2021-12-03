DROP DATABASE IF EXISTS futbol;
CREATE DATABASE futbol;
USE futbol;

create table player(
	player_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL, 
    surname VARCHAR(50) NOT NULL, 
    birth_date DATE NOT NULL
);

create table team(
	team_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL, 
    acronym VARCHAR(3) NOT NULL, 
    city VARCHAR(50) NOT NULL
);

create table season(
	season_id INT PRIMARY KEY AUTO_INCREMENT,
    year_start INT NOT NULL, 
    year_end INT NOT NULL
);

create table player_team_season(
    player_id INT,
    team_id INT,
    season_id INT,
    PRIMARY KEY(player_id, team_id, season_id),
    FOREIGN KEY (player_id) REFERENCES player(player_id),
    FOREIGN KEY (team_id) REFERENCES team(team_id),
    FOREIGN KEY (season_id) REFERENCES season(season_id)
);

create table league(
    league_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL, 
    season_id INT NOT NULL,
    FOREIGN KEY (season_id) REFERENCES season(season_id)
);

create table team_league(
    team_id INT,
    league_id INT,
    PRIMARY KEY(team_id, league_id),
    FOREIGN KEY (team_id) REFERENCES team(team_id),
    FOREIGN KEY (league_id) REFERENCES league(league_id)
);

create table stats(
    stats_id INT PRIMARY KEY AUTO_INCREMENT,
    goals INT NOT NULL,
    shots INT NOT NULL,
    goal_shots INT NOT NULL,
    corners INT NOT NULL
);

create table game(
    game_id INT PRIMARY KEY AUTO_INCREMENT,
    league_id INT NOT NULL,
    local_team_id INT NOT NULL,
    guest_team_id INT NOT NULL,
    local_stats_id INT NOT NULL,
    guest_stats_id INT NOT NULL,
    FOREIGN KEY (league_id) REFERENCES league(league_id),
    FOREIGN KEY (local_team_id) REFERENCES team(team_id),
    FOREIGN KEY (guest_team_id) REFERENCES team(team_id),
    FOREIGN KEY (local_stats_id) REFERENCES stats(stats_id),
    FOREIGN KEY (guest_stats_id) REFERENCES stats(stats_id)
);
