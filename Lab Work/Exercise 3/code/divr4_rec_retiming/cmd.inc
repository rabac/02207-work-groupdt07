open run.out
logtime -e run.out

monitor -n Smon  active  *E/X'sig
monitor -n Smon  active  *E/D'sig
--monitor -n Smon  active  *E/Qj'sig

-- monitor -n Smon  active  *E/UUT/WS'sig
-- monitor -n Smon  active  *E/UUT/WC'sig

list > run.out
run 33960  > run.out

quit
