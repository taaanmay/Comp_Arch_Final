----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 03:18:45 PM
-- Design Name: 
-- Module Name: four_bit_shifter - Behavioral
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

entity four_bit_shifter is
    Port ( B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           Lr : in STD_LOGIC;
           Ll : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (1 downto 0);
           H0 : out STD_LOGIC;
           H1 : out STD_LOGIC;
           H2 : out STD_LOGIC;
           H3 : out STD_LOGIC;
           OutR : out STD_LOGIC;
           OutL : out STD_LOGIC);
end four_bit_shifter;

architecture Behavioral of four_bit_shifter is
    component Mux_3to1 is
        Port ( S : in STD_LOGIC_VECTOR(1 downto 0);
           X0 : in STD_LOGIC;
           X1 : in STD_LOGIC;
           X2 : in STD_LOGIC;
           Z : out STD_LOGIC);  
    end component;
begin

    mux1 : Mux_3to1 port map(
        S => S,
        X0 => B0,
        X1 => B1,
        X2 => Ll,
        Z => H0 
    );
    mux2 : Mux_3to1 port map(
        S => S,
        X0 => B1,
        X1 => B2,
        X2 => B0,
        Z => H1
    );
    mux3 : Mux_3to1 port map(
        S => S,
        X0 => B2,
        X1 => B3,
        X2 => B1,
        Z => H2
    );
    mux4 : Mux_3to1 port map(
        S => S,
        X0 => B3,
        X1 => Lr,
        X2 => B2,
        Z => H3
    );
    OutR <= B0;
    OutL <= B3;

end Behavioral;
