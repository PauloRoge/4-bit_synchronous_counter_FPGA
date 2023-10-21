library IEEE;
use IEEE.std_logic_1164.all;

entity exercise is
    port (
        a,b,c,d : in std_logic;
        r : in std_logic_vector(1 downto 0);
        s : out std_logic 
    );
end entity exercise;

architecture hardware of exercise is

    signal V : std_logic;
    signal W : std_logic;
    signal T : std_logic;
    signal MUX1 : std_logic;
    signal MUX2 : std_logic;

begin
    
    V <= a AND b;
    W <= c OR b;
    T <= a XOR d;

   with r(0) select
   MUX1 <= V when '0',
           W when '1',
           '0' when others;

    with r(0) select
    MUX2 <= T when '0',
            (not W) when '1',
            '0' when others;

    with r(1) select
    s <= MUX1 when '0',
         MUX2 when '1',
         '0' when others;
    
end architecture hardware;