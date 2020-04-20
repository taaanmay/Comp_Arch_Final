----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 03:36:30 PM
-- Design Name: 
-- Module Name: ALU_one_bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_one_bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           Cout : out STD_LOGIC;
           G : out STD_LOGIC);
end ALU_one_bit;

architecture Behavioral of ALU_one_bit is

    component arithmetic_circuit is
        Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
    end component;
    component logic_circuit is
        Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           G : out STD_LOGIC);  
    end component;
    component Mux_2to1 is
        Port ( D0 : in STD_LOGIC;
           D1 : in STD_LOGIC;
           Z : out STD_LOGIC;
           Sel : in STD_LOGIC);
    end component;
    signal arith_out : STD_LOGIC;
    signal logic_out : STD_LOGIC;
    
begin
    a_circuit : arithmetic_circuit port map(
        A => A,
        B => B,
        Cin => Cin,
        S0 => S0,
        S1 => S1,
        Sum => arith_out,
        Cout => Cout
    );
    l_circuit : logic_circuit port map(
        A => A,
        B => B,
        S0 => S0,
        S1 => S1,
        G => logic_out
    );
    tmux : Mux_2to1 port map(
        D0 => arith_out,
        D1 => logic_out,
        Sel => S2,
        Z => G
    );
end Behavioral;
