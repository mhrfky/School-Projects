% pokemon_stats(Pokemon, Types, HealthPoint, Attack, Defense).
pokemon_stats(bulbasaur, [grass, poison], 45, 49, 49).
pokemon_stats(ivysaur, [grass, poison], 60, 62, 63).
pokemon_stats(venusaur, [grass, poison], 80, 100, 123).
pokemon_stats(charmander, [fire], 39, 52, 43).
pokemon_stats(charmeleon, [fire], 58, 64, 58).
pokemon_stats(charizard, [fire, flying], 78, 104, 78).
pokemon_stats(squirtle, [water], 44, 48, 65).
pokemon_stats(wartortle, [water], 59, 63, 80).
pokemon_stats(blastoise, [water], 79, 103, 120).
pokemon_stats(caterpie, [bug], 45, 30, 35).
pokemon_stats(metapod, [bug], 50, 20, 55).
pokemon_stats(butterfree, [bug, flying], 60, 45, 50).
pokemon_stats(pidgey, [normal, flying], 40, 45, 40).
pokemon_stats(pidgeotto, [normal, flying], 63, 60, 55).
pokemon_stats(pidgeot, [normal, flying], 83, 80, 80).
pokemon_stats(ekans, [poison], 35, 60, 44).
pokemon_stats(arbok, [poison], 60, 95, 69).
pokemon_stats(pikachu, [electric], 35, 55, 40).
pokemon_stats(raichu, [electric], 60, 85, 50).
pokemon_stats(vulpix, [fire, ice], 38, 41, 40).
pokemon_stats(ninetales, [fire, ice], 73, 67, 75).
pokemon_stats(jigglypuff, [normal, fairy], 115, 45, 20).
pokemon_stats(wigglytuff, [normal, fairy], 140, 70, 45).
pokemon_stats(zubat, [poison, flying], 40, 45, 35).
pokemon_stats(golbat, [poison, flying], 75, 80, 70).
pokemon_stats(meowth, [normal, dark], 40, 35, 35).
pokemon_stats(persian, [normal, dark], 65, 60, 60).
pokemon_stats(psyduck, [water], 50, 52, 48).
pokemon_stats(golduck, [water], 80, 82, 78).
pokemon_stats(abra, [psychic], 25, 20, 15).
pokemon_stats(kadabra, [psychic], 40, 35, 30).
pokemon_stats(alakazam, [psychic], 55, 50, 65).
pokemon_stats(machop, [fighting], 70, 80, 50).
pokemon_stats(machoke, [fighting], 80, 100, 70).
pokemon_stats(machamp, [fighting], 90, 130, 80).
pokemon_stats(geodude, [rock, ground], 40, 80, 100).
pokemon_stats(graveler, [rock, ground], 55, 95, 115).
pokemon_stats(golem, [rock, ground], 80, 120, 130).
pokemon_stats(grimer, [poison], 80, 80, 50).
pokemon_stats(muk, [poison], 105, 105, 75).
pokemon_stats(shellder, [water], 30, 65, 100).
pokemon_stats(cloyster, [water, ice], 50, 95, 180).
pokemon_stats(gastly, [ghost, poison], 30, 35, 30).
pokemon_stats(haunter, [ghost, poison], 45, 50, 45).
pokemon_stats(gengar, [ghost, poison], 60, 65, 80).
pokemon_stats(onix, [rock, ground], 35, 45, 160).
pokemon_stats(drowzee, [psychic], 60, 48, 45).
pokemon_stats(hypno, [psychic], 85, 73, 70).
pokemon_stats(exeggcute, [grass, psychic], 60, 40, 80).
pokemon_stats(exeggutor, [grass, psychic], 95, 105, 85).
pokemon_stats(lickitung, [normal], 90, 55, 75).
pokemon_stats(koffing, [poison], 40, 65, 95).
pokemon_stats(weezing, [poison], 65, 90, 120).
pokemon_stats(horsea, [water], 30, 40, 70).
pokemon_stats(seadra, [water], 55, 65, 95).
pokemon_stats(staryu, [water], 30, 45, 55).
pokemon_stats(starmie, [water, psychic], 60, 75, 85).
pokemon_stats(magmar, [fire], 65, 95, 57).
pokemon_stats(magikarp, [water], 20, 10, 55).
pokemon_stats(gyarados, [water, flying], 95, 155, 109).
pokemon_stats(lapras, [water, ice], 130, 85, 80).
pokemon_stats(eevee, [normal], 55, 55, 50).
pokemon_stats(articuno, [ice, flying], 90, 85, 100).
pokemon_stats(zapdos, [electric, flying], 90, 90, 85).
pokemon_stats(moltres, [fire, flying], 90, 100, 90).
pokemon_stats(dratini, [dragon], 41, 64, 45).
pokemon_stats(dragonair, [dragon], 61, 84, 65).
pokemon_stats(dragonite, [dragon, flying], 91, 134, 95).
pokemon_stats(mewtwo, [psychic], 106, 150, 70).
pokemon_stats(mew, [psychic], 100, 100, 100).


% pokemon_evolution(Pokemon, EvolvedPokemon, MinRequiredLevel).
pokemon_evolution(bulbasaur, ivysaur, 16).
pokemon_evolution(ivysaur, venusaur, 32).
pokemon_evolution(charmander, charmeleon, 16).
pokemon_evolution(charmeleon, charizard, 36).
pokemon_evolution(squirtle, wartortle, 16).
pokemon_evolution(wartortle, blastoise, 36).
pokemon_evolution(caterpie, metapod, 7).
pokemon_evolution(metapod, butterfree, 10).
pokemon_evolution(pidgey, pidgeotto, 18).
pokemon_evolution(pidgeotto, pidgeot, 36).
pokemon_evolution(ekans, arbok, 22).
pokemon_evolution(zubat, golbat, 22).
pokemon_evolution(meowth, persian, 28).
pokemon_evolution(psyduck, golduck, 33).
pokemon_evolution(abra, kadabra, 16).
pokemon_evolution(machop, machoke, 28).
pokemon_evolution(geodude, graveler, 25).
pokemon_evolution(grimer, muk, 38).
pokemon_evolution(gastly, haunter, 25).
pokemon_evolution(drowzee, hypno, 26).
pokemon_evolution(koffing, weezing, 35).
pokemon_evolution(horsea, seadra, 32).
pokemon_evolution(magikarp, gyarados, 20).
pokemon_evolution(dratini, dragonair, 30).
pokemon_evolution(dragonair, dragonite, 55).



% pokemon_types(PokemonTypes).
pokemon_types([normal, fire, water, electric, grass, ice, fighting, poison, ground, flying, psychic, bug, rock, ghost, dragon, dark, steel, fairy]).

% type_chart_attack(AttackingType, TypeMultipliers).
type_chart_attack(normal, [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 0.0, 1.0, 1.0, 0.5, 1.0]).
type_chart_attack(fire, [1.0, 0.5, 0.5, 1.0, 2.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 0.5, 1.0, 0.5, 1.0, 2.0, 1.0]).
type_chart_attack(water, [1.0, 2.0, 0.5, 1.0, 0.5, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 2.0, 1.0, 0.5, 1.0, 1.0, 1.0]).
type_chart_attack(electric, [1.0, 1.0, 2.0, 0.5, 0.5, 1.0, 1.0, 1.0, 0.0, 2.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0]).
type_chart_attack(grass, [1.0, 0.5, 2.0, 1.0, 0.5, 1.0, 1.0, 0.5, 2.0, 0.5, 1.0, 0.5, 2.0, 1.0, 0.5, 1.0, 0.5, 1.0]).
type_chart_attack(ice, [1.0, 0.5, 0.5, 1.0, 2.0, 0.5, 1.0, 1.0, 2.0, 2.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 0.5, 1.0]).
type_chart_attack(fighting, [2.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 0.5, 1.0, 0.5, 0.5, 0.5, 2.0, 0.0, 1.0, 2.0, 2.0, 0.5]).
type_chart_attack(poison, [1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.5, 0.5, 1.0, 1.0, 1.0, 0.5, 0.5, 1.0, 1.0, 0.0, 2.0]).
type_chart_attack(ground, [1.0, 2.0, 1.0, 2.0, 0.5, 1.0, 1.0, 2.0, 1.0, 0.0, 1.0, 0.5, 2.0, 1.0, 1.0, 1.0, 2.0, 1.0]).
type_chart_attack(flying, [1.0, 1.0, 1.0, 0.5, 2.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 2.0, 0.5, 1.0, 1.0, 1.0, 0.5, 1.0]).
type_chart_attack(psychic, [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 0.0, 0.5, 1.0]).
type_chart_attack(bug, [1.0, 0.5, 1.0, 1.0, 2.0, 1.0, 0.5, 0.5, 1.0, 0.5, 2.0, 1.0, 1.0, 0.5, 1.0, 2.0, 0.5, 0.5]).
type_chart_attack(rock, [1.0, 2.0, 1.0, 1.0, 1.0, 2.0, 0.5, 1.0, 0.5, 2.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0]).
type_chart_attack(ghost, [0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 2.0, 1.0, 0.5, 1.0, 1.0]).
type_chart_attack(dragon, [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 0.5, 0.0]).
type_chart_attack(dark, [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 2.0, 1.0, 0.5, 1.0, 0.5]).
type_chart_attack(steel, [1.0, 0.5, 0.5, 0.5, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 0.5, 2.0]).
type_chart_attack(fairy, [1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 2.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 0.5, 1.0]).


% pokemon_trainer(PokemonTrainer, PokemonTeam, PokemonLevels
pokemon_trainer(ash, [pikachu, ivysaur, charmeleon, squirtle], [45, 15, 28, 50]).
pokemon_trainer(misty, [psyduck, staryu, starmie, seadra], [10, 15, 48, 45]).
pokemon_trainer(brock, [onix, geodude, golbat, machop], [18, 33, 42, 33]).
pokemon_trainer(team_rocket, [meowth, ekans, gyarados, weezing], [15, 30, 29, 35]).
%1
%find_pokemon_evolution(+PokemonLevel, +Pokemon, -EvolvedPokemon)
%This predicate is to find the evolved version of Pok´emon given its level. If there is no evolution, then
%EvolvedPokemon = Pokemon. Pok´emon can evolve two times if it has enough levels.
find_pokemon_evolution(Level,X,Y):-
pokemon_evolution(X,T,L),L < Level -> find_pokemon_evolution(Level,T,Y);Y = X.
    

%2
%pokemon_level_stats(+PokemonLevel, ?Pokemon, -PokemonHp, -PokemonAttack,-PokemonDefense)
%This predicate evaluates the statistics of a Pok´emon for the given level. With every level a Pok´emon
%gains 2 health points, 1 attack point and 1 defense point. You can get the base statistics from pokemon stats
pokemon_level_stats(Level,Pokemon,PokemonHp,PokemonAttack,PokemonDefense):-
pokemon_stats(Pokemon,_,Health,Attack,Defence),
PokemonHp is (Health + Level*2),
PokemonAttack is (Attack + Level),
PokemonDefense is (Defence + Level).

%3
%single_type_multiplier(?AttackerType, ?DefenderType, ?Multiplier)
%This predicate will be used to find single-type advantage/disadvantage multiplier. It can also be used
%to find types that achieves a given multiplier
indexOf([Element|_], Element, 0):- !.
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1),
  !,
  Index is Index1+1.




single_type_multiplier(AttackerType,DefenderType,Multiplier):-
	type_chart_attack(AttackerType,MultList),
	pokemon_types(List),
	indexOf(List,DefenderType,Index),
	nth0(Index,MultList,Elem),
    Multiplier = Elem.
	
%4 
%type multiplier(?AttackerType, +DefenderTypeList, ?Multiplier)
%This predicate will be used to find double-type advantage/disadvantage multiplier. It can also be
%used to find types that achieves a given multiplier.

type_multiplier(_, [], Multiplier):-
Multiplier is 1,!.
type_multiplier(AttackerType, [Head|Tail], Multiplier):-
	
    single_type_multiplier(AttackerType,Head,SemiMultiplier),
    type_multiplier(AttackerType, Tail, SemiMultiplier2),
    Multiplier is SemiMultiplier2*SemiMultiplier.

%5
%pokemon type multiplier(?AttackerPokemon, ?DefenderPokemon, ?Multiplier)
%This predicate will be used to find type multiplier between two Pok´emon. It can also be used to
%find different attacker/defender Pok´emon that achieves a given multiplier. If an attacker Pok´emon
%has two types, then the Pok´emon uses the type that gives the higher multiplier against the defender
%Pok´emon.
list_multiplier([],_,Multiplier):-
Multiplier is 0,!.

list_multiplier([Head|Tail],DefendList,Multiplier):-
	type_multiplier(Head,DefendList,SemiMultiplier),
	list_multiplier(Tail,DefendList,SemiMultiplier2),
	Multiplier is max(SemiMultiplier, SemiMultiplier2).

pokemon_type_multiplier(AttackerPokemon, DefenderPokemon, Multiplier):-
pokemon_stats(AttackerPokemon,AttackList,_,_,_),
pokemon_stats(DefenderPokemon,DefendList,_,_,_),
list_multiplier(AttackList,DefendList,A),
    Multiplier is A.
    

%%6 
%pokemon attack(+AttackerPokemon, +AttackerPokemonLevel, +DefenderPokemon,+DefenderPokemonLevel, -Damage)
%This predicate finds the damage dealt from the attack of the AttackerPokemon to the DefenderPokemon.
%Damage = (0.5 × AttackerPokemonLevel × (AttackerPokemonAttack / DefenderPokemonDefense)× TypeMultiplier) + 1


	
	pokemon_attack(AttackerPokemon, AttackerPokemonLevel, DefenderPokemon,DefenderPokemonLevel,Damage):-
	
	pokemon_level_stats(AttackerPokemonLevel,AttackerPokemon,_,Aad,_),
	pokemon_level_stats(DefenderPokemonLevel,DefenderPokemon,_,_,Ddef),
	pokemon_type_multiplier(AttackerPokemon, DefenderPokemon, TypeMultiplier),
	Damage is (0.5*AttackerPokemonLevel*(Aad/Ddef)*TypeMultiplier)+1.
    
%7 pokemon fight(+Pokemon1, +Pokemon1Level, +Pokemon2, +Pokemon2Level,-Pokemon1Hp, -Pokemon2Hp, -Rounds)
%This predicate simulates a fight between two Pok´emon then finds health points of each Pok´emon at
%the end of the fight and the number of rounds. Each Pok´emon attacks at the same time and each
%attack sequence count as one round. After each attack, health points of each Pok´emon reduced by the
%amount of calculated damage points. When a Pok´emon’s health points drop below zero, the fight ends.    
    pokemon_fight(Pokemon1, Pokemon1Level, Pokemon2, Pokemon2Level,Pokemon1Hp, Pokemon2Hp, Rounds):-
	
	pokemon_level_stats(Pokemon1Level,Pokemon1,Hp1,_,_),
	pokemon_level_stats(Pokemon2Level,Pokemon2,Hp2,_,_),
	pokemon_attack(Pokemon1,Pokemon1Level,Pokemon2,Pokemon2Level,Damage1),
	pokemon_attack(Pokemon2,Pokemon2Level,Pokemon1,Pokemon1Level,Damage2),
	Rounds is ceiling(min(Hp1/Damage2,Hp2/Damage1)),
	Pokemon1Hp is Hp1-Rounds*Damage2,
	Pokemon2Hp is Hp2-Rounds*Damage1.
   

    
    
 %8
% pokemon_tournament(+PokemonTrainer1, +PokemonTrainer2, -WinnerTrainerList)
%This predicate simulates a tournament between two Pok´emon trainers then finds the winner Pok´emon
%trainer of each fight. Pok´emon trainers must have the same number of Pok´emon. Pok´emon fights
%in order. First Pok´emon of the first Pok´emon trainer fights with the first Pok´emon of the second
%Pok´emon trainer, second Pok´emon of the first Pok´emon trainer fights with the second Pok´emon of
%the second Pok´emon trainer.. A fight ends when a Pok´emon’s health points drop below zero. At the
%end of the fight, Pok´emon with more health points win the fight, so does the Pok´emon trainer that
%owns the winner Pok´emon. Important Note: Pok´emon trainers force their Pok´emon to evolve (if
%possible) before tournament fights to gain maximum efficiency. So you should check evolution status
%of each Pok´emon.

pokemon_win(Pokemon1, Pokemon1Level, Pokemon2, Pokemon2Level,Winner):-
	
	pokemon_level_stats(Pokemon1Level,Pokemon1,Hp1,_,_),
	pokemon_level_stats(Pokemon2Level,Pokemon2,Hp2,_,_),
	pokemon_attack(Pokemon1,Pokemon1Level,Pokemon2,Pokemon2Level,Damage1),
	pokemon_attack(Pokemon2,Pokemon2Level,Pokemon1,Pokemon1Level,Damage2),
	Hp1/Damage2>Hp2/Damage1 -> Winner = Pokemon1 ; Winner=Pokemon2.

%team_fight(PokemonList1,LevelList1,PokemonList2,LevelList2,PokemonTrainer1,PokemonTrainer2,List)
team_fight([Head1|Tail1],[Level1|LTail1],[Head2|Tail2],[Level2|LTail2],PokemonTrainer1,PokemonTrainer2,List):-
	find_pokemon_evolution(Level1,Head1,Evolved1),
	find_pokemon_evolution(Level2,Head2,Evolved2)
	pokemon_win(Evolved1,Level1,Evolved2,Level2,Winner),
	
	Evolved1 = Winner -> 
    team_fight(Tail1,LTail1,Tail2,LTail2,PokemonTrainer1,PokemonTrainer2,SList),
    List = [PokemonTrainer1 | SList]
    ;
    team_fight(Tail1,LTail1,Tail2,LTail2,PokemonTrainer1,PokemonTrainer2,SList),
    List = [PokemonTrainer2|SList].
team_fight([],[],[],[],_,_,List):-
List = [].

pokemon_tournament(PokemonTrainer1, PokemonTrainer2, WinnerTrainerList):-
pokemon_trainer(PokemonTrainer1,PokemonList1,LevelList1),
pokemon_trainer(PokemonTrainer2,PokemonList2,LevelList2),
team_fight(PokemonList1,LevelList1,PokemonList2,LevelList2,PokemonTrainer1,PokemonTrainer2,WinnerTrainerList).   
    
    
    
    
    
    
    
    
    
    




