----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 03:31:09 PM
-- Design Name: 
-- Module Name: sixteen_bit_ALU - Behavioral
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

entity sixteen_bit_ALU is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC);
end sixteen_bit_ALU;

architecture Behavioral of sixteen_bit_ALU is
    component ALU_one_bit is
        Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           Cout : out STD_LOGIC;
           G : out STD_LOGIC);
    end component;
    signal Cout0 : STD_LOGIC;
    signal Cout1 : STD_LOGIC;
    signal Cout2 : STD_LOGIC;
    signal Cout3 : STD_LOGIC;
    signal Cout4 : STD_LOGIC;
    signal Cout5 : STD_LOGIC;
    signal Cout6 : STD_LOGIC;
    signal Cout7 : STD_LOGIC;
    signal Cout8 : STD_LOGIC;
    signal Cout9 : STD_LOGIC;
    signal Cout10 : STD_LOGIC;
    signal Cout11 : STD_LOGIC;
    signal Cout12 : STD_LOGIC;
    signal Cout13 : STD_LOGIC;
    signal Cout14 : STD_LOGIC;
       
begin
    ALU0 : ALU_one_bit port map(
        A => A(0),
        B => B(0),
        Cin => Cin,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout0,
        G => Sum(0)
    );
    ALU1 : ALU_one_bit port map(
        A => A(1),
        B => B(1),
        Cin => Cout0,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout1,
        G => Sum(1)
    );
    ALU2 : ALU_one_bit port map(
        A => A(2),
        B => B(2),
        Cin => Cout1,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout2,
        G => Sum(2)
    );
    ALU3 : ALU_one_bit port map(
        A => A(3),
        B => B(3),
        Cin => Cout2,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout3,
        G => Sum(3)
    );
    ALU4 : ALU_one_bit port map(
        A => A(4),
        B => B(4),
        Cin => Cout3,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout4,
        G => Sum(4)
    );
    ALU5 : ALU_one_bit port map(
        A => A(5),
        B => B(5),
        Cin => Cout4,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout5,
        G => Sum(5)
    );
    ALU6 : ALU_one_bit port map(
        A => A(6),
        B => B(6),
        Cin => Cout5,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout6,
        G => Sum(6)
    );
    ALU7 : ALU_one_bit port map(
        A => A(7),
        B => B(7),
        Cin => Cout6,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout7,
        G => Sum(7)
    );
    ALU8 : ALU_one_bit port map(
        A => A(8),
        B => B(8),
        Cin => Cout7,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout8,
        G => Sum(8)
    );
    ALU9 : ALU_one_bit port map(
        A => A(9),
        B => B(9),
        Cin => Cout8,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout9,
        G => Sum(9)
    );
    ALU10 : ALU_one_bit port map(
        A => A(10),
        B => B(10),
        Cin => Cout9,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout10,
        G => Sum(10)
    );
    ALU11 : ALU_one_bit port map(
        A => A(11),
        B => B(11),
        Cin => Cout10,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout11,
        G => Sum(11)
    );
    ALU12 : ALU_one_bit port map(
        A => A(12),
        B => B(12),
        Cin => Cout11,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout12,
        G => Sum(12)
    );
    ALU13 : ALU_one_bit port map(
        A => A(13),
        B => B(13),
        Cin => Cout12,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout13,
        G => Sum(13)
    );
    ALU14 : ALU_one_bit port map(
        A => A(14),
        B => B(14),
        Cin => Cout13,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout14,
        G => Sum(14)
    );
    ALU15 : ALU_one_bit port map(
        A => A(15),
        B => B(15),
        Cin => Cout14,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout,
        G => Sum(15)
    );
end Behavioral;
