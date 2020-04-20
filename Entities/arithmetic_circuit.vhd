----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 03:42:10 PM
-- Design Name: 
-- Module Name: arithmetic_circuit - Behavioral
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

entity arithmetic_circuit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end arithmetic_circuit;

architecture Behavioral of arithmetic_circuit is
    component B_input_logic_adder is
        Port( B : in STD_LOGIC;
              S0 : in STD_LOGIC;
              S1 : in STD_LOGIC;
              Z : out STD_LOGIC);
    end component;
    component full_adder is
        Port ( X : in STD_LOGIC;
               Y : in STD_LOGIC;
               Cin : in STD_LOGIC;
               S : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;
    
    signal B_logic : STD_LOGIC;
    
begin
    b_input : B_input_logic_adder port map(
        B => B,
        S0 => S0,
        S1 => S1,
        Z =>B_logic
    );
    f_adder : full_adder port map(
        X => A,
        Y => B_logic,
        Cin => Cin,
        S => Sum,
        Cout => Cout
    );

end Behavioral;
