?-

G_Male := 0,
G_Female := 1,

G_Males := 1600,

G_Black_Color := rgb(0, 0, 0),
G_Pink_Color := rgb(255, 20, 147),
G_Blue_Color := rgb(0, 0, 200),
G_Green_Color := rgb(0, 255, 0),

G_Days_In_Four_Years = 1461,

G_Drop_Out_Rate = 2,

G_Days_Passed := 0, 
G_Students := 2600,
G_Speed := 2,
G_Girlfriends := 0,
G_Buddies := 0,

G_X := 700,
G_Y := 700,
G_F := 70,

array(x, G_Students, 100),
array(y, G_Students, 100),
array(xs, G_Students, 100),
array(ys, G_Students, 100),
array(gender, G_Students, 100),
init_people,

window(title("Uni"), 
	size(G_X + 2 * G_F + 20, G_Y + 2 * G_F + 50), 
	class(win_func), 
	paint_indirectly).

win_func(init):-
	G_Timer := set_timer(_, 0.02, time_func).

init_people:-
	for(I, 0, G_Students - 1),
	x(I) := G_F + random(G_X),
	y(I) := G_F + random(G_Y),
	(I =< G_Males -> 
		gender(I) := G_Male 
	else 
		gender(I) := G_Female),
	init_speed(I),
	fail.
init_people.

init_speed(I):-
	xs(I) := random(2 * G_Speed) - G_Speed,
	ys(I) := random(2 * G_Speed) - G_Speed.


win_func(paint):-
	pen(2, G_Black_Color),
	line(G_F, G_F, 
		G_F, G_Y+G_F, 
		G_X+G_F, G_Y+G_F,
		G_X+G_F, G_F, 
		G_F, G_F),
	for(I, 0, G_Students - 1),
	color(I, Color),
	(I =:= 0 -> 
		pen(12, Color)
	else
		pen(6, Color)),
	line(x(I), y(I), x(I), y(I)),
	fail.

color(I, Color):-
	(gender(I)=:=G_Female -> 
		Color := G_Pink_Color 
	else 
		Color := G_Blue_Color),
	(I =:= 0 -> 
		Color := G_Green_Color).

time_func(end) :-
	update_window(_),
	G_Days_Passed := G_Days_Passed + 1,
	(G_Days_Passed =:= G_Days_In_Four_Years -> 
		kill_timer(_, G_Timer),
		set_text("Congratulations! You graduated successfully. | Girlfriends: " + G_Girlfriends + " | Buddies: " + G_Buddies, _)
	else
		set_text("Days: " + G_Days_Passed + " | Girlfriends: " + G_Girlfriends + " | Buddies: " + G_Buddies, _),
		for(I, 0, G_Students - 1),
		x(I) := x(I) + xs(I),
		y(I) := y(I) + ys(I),
		correct(I),
		I =:= 0,
		meet(I)).

meet(I):-
	for(J, 1, G_Students-1),
	(x(I) =:= x(J),
	y(I) =:= y(J),
	gender(J) =:= G_Female ->
		G_Girlfriends := G_Girlfriends + 1),
	(x(I) =:= x(J),
	y(I) =:= y(J),
	gender(J) =:= G_Male ->
		G_Buddies := G_Buddies + 1),
	fail.

correct(I):-
	(x(I) < G_F -> 
		(I =\= 0, random(G_Drop_Out_Rate) =\= 0 -> fail),
		x(I) := x(I) - xs(I), 
		xs(I) := -1 * xs(I)), 
	fail.

correct(I):-
	(y(I) < G_F ->
		(I =\= 0, random(G_Drop_Out_Rate) =\= 0 -> fail), 
		y(I) := y(I) - ys(I), 
		ys(I) := -1 * ys(I)), 
	fail.
	
correct(I):-
	(x(I) > G_F + G_X -> 
		(I =\= 0, random(G_Drop_Out_Rate) =\= 0 -> fail),
		x(I) := x(I) - xs(I), 
		xs(I) := -1 * xs(I)), 
	fail.

correct(I):-
	(y(I) > G_F + G_Y -> 
		(I =\= 0, random(G_Drop_Out_Rate) =\= 0 -> fail),
		y(I) := y(I) - ys(I), 
		ys(I) := -1 * ys(I)).
