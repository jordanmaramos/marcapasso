library ieee;
use ieee.std_logic_1164.all;


entity marcapasso is
port(
	N0, N1, N2, sa, za, sv, zv: in bit;
	Q2, Q1, Q0, pa, ta, pv, tv: out bit
);
end marcapasso;

architecture main of marcapasso is
	
signal N0b: bit;
signal N1b: bit;
signal N2b: bit;
signal sab: bit;
signal zab: bit;
signal svb: bit;
signal zvb: bit;

begin
	
	N0b <= not N0;
	N1b <= not N1;
	N2b <= not N2;
	sab <= not sa;
	zab <= not za;
	svb <= not sv;
	zvb <= not zv;
	
	Q0 <= (N0b and N1b and N2b) or (N1b and N2 and (N0 and (sa xor za))) or (N0 and sab and za); 
	Q1 <= (N0 and N1b and N2b and ((sa xor za) or (sa and za))) or (N0b and N1 and N2b);
	Q2 <= N0 and ((N1 and N2b) or (N1b and N2 and svb));
	pa <= N0b and N1 and N2b;
	ta <= N0 and N1 and N2;
	pv <= N0 and N1b and N2;
	tv <= N0 and N1 and N2b;
	
	
end architecture main;