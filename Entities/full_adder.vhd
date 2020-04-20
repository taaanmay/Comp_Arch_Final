----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 01:00:13 PM
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
    component half_adder is
        Port( A : in STD_LOGIC;
              B : in STD_LOGIC;
              S : out STD_LOGIC;
              Carry: out STD_LOGIC);
    end component;
    
    signal Cmid : STD_LOGIC;
    signal Cmid_two : STD_LOGIC;
    signal Smid : STD_LOGIC;

begin
    half_adder1 : half_adder port map(
        A => X,
        B => Y,
        S => Smid,
        Carry => Cmid
    );
    half_adder2 : half_adder port map(
        A => Smid,
        B => Cin,
        Carry => Cmid_two,
        S => S
    );
    
    Cout <= Cmid or Cmid_two after 1ns;

end Behavioral;

