----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 03:32:27 PM
-- Design Name: 
-- Module Name: sixteen_bit_shifter - Behavioral
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

entity sixteen_bit_shifter is
    Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           H : out STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           LeftOut : out STD_LOGIC;
           RightOut : out STD_LOGIC;
           LeftConst : in STD_LOGIC;
           RightConst : in STD_LOGIC);
end sixteen_bit_shifter;

architecture Behavioral of sixteen_bit_shifter is
    component four_bit_shifter is
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
    end component;
    
    signal left0 : STD_LOGIC;
    signal right1 : STD_LOGIC;
    signal left1 : STD_LOGIC;
    signal right2 : STD_LOGIC;
    signal left2 : STD_LOGIC;
    signal right3: STD_LOGIC;
begin
    shift0 : four_bit_shifter port map(
        B0 => B(0),
        B1 => B(1),
        B2 => B(2),
        B3 => B(3),
        Lr => right1,
        Ll => RightConst,
        S => S,
        H0 => H(0),
        H1 => H(1),
        H2 => H(2),
        H3 => H(3),
        OutR => RightOut,
        OutL => left0
    );
    shift1 : four_bit_shifter port map(
        B0 => B(4),
        B1 => B(5),
        B2 => B(6),
        B3 => B(7),
        Lr => right2,
        Ll => left0,
        S => S,
        H0 => H(4),
        H1 => H(5),
        H2 => H(6),
        H3 => H(7),
        OutR => right1,
        OutL => left1
    );
    shift2 : four_bit_shifter port map(
        B0 => B(8),
        B1 => B(9),
        B2 => B(10),
        B3 => B(11),
        Lr => right3,
        Ll => left1,
        S => S,
        H0 => H(8),
        H1 => H(9),
        H2 => H(10),
        H3 => H(11),
        OutR => right2,
        OutL => left2
    );
    shift3 : four_bit_shifter port map(
        B0 => B(12),
        B1 => B(13),
        B2 => B(14),
        B3 => B(15),
        Lr => LeftConst,
        Ll => left2,
        S => S,
        H0 => H(12),
        H1 => H(13),
        H2 => H(14),
        H3 => H(15),
        OutR => right3,
        OutL => LeftOut
    );
    

end Behavioral;
