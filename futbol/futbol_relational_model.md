# Futbol relational model
- **BOLD** is primary key
- *ITALIC* is foreign key
## Tables

- PLAYER(**player\_id**, name, surname, birth\_date)
- TEAM(**team\_id**, name, acronym, city)
- SEASON(**season\_id**, year\_start, year\_end)
- player\_team\_season(**_player\_id_**(PLAYER), **_team\_id_**(TEAM), **_season\_id_**(SEASON))
- LEAGUE(**league\_id**, name, *season\_id*(SEASON))
- team\_league(**_team\_id_**(TEAM), **_league\_id_**(LEAGUE))
- STATS(**stats\_id**, goals, shots, goal\_shots, corners)
- GAME(**game\_id**, _league\_id_(LEAGUE), _local\_team\_id_(TEAM), _guest\_team\_id_(TEAM), _local\_stats\_id_(STATS), _guest\_stats\_id_(STATS))
