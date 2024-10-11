function lapp(val, goal, amount) { //linear_approach()
	if abs(val-goal) < amount val = goal;
	if val < goal return val+amount;
	if val > goal return val-amount;
	if val == goal return goal;
}
