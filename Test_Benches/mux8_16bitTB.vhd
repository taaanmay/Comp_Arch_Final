----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2020 02:24:48 PM
-- Design Name: 
-- Module Name: Mux8_16bit_tb - Behavioral
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

entity Mux8_16bittb is
--  Port ( );
end Mux8_16bittb;

architecture Behavioral of Mux8_16bittb is

    component Mux8_16bit is
        Port ( Sel : in STD_LOGIC_VECTOR(2 downto 0);
           Reg1 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg2 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg3 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg4 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg5 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg6 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg7 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg8 : in STD_LOGIC_VECTOR(15 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0));
    end component;
    
    --inputs
    signal Sel : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal Reg1 : STD_LOGIC_VECTOR(15 downto 0) := x"0001";
    signal Reg2 : STD_LOGIC_VECTOR(15 downto 0) := x"0101";
    signal Reg3 : STD_LOGIC_VECTOR(15 downto 0) := x"0011";
    signal Reg4 : STD_LOGIC_VECTOR(15 downto 0) := x"1001";
    signal Reg5 : STD_LOGIC_VECTOR(15 downto 0) := x"0111";
    signal Reg6 : STD_LOGIC_VECTOR(15 downto 0) := x"1111";
    signal Reg7 : STD_LOGIC_VECTOR(15 downto 0) := x"1101";
    signal Reg8 : STD_LOGIC_VECTOR(15 downto 0) := x"1011";
    
    -- output
    
    signal Z: STD_LOGIC_VECTOR(15 downto 0);
    
    constant TIME_CYCLE : time := 15ns;
begin

    uut: Mux8_16bit port map(
        Sel => Sel,
        Reg1 => Reg1,
        Reg2 => Reg2,
        Reg3 => Reg3,
        Reg4 => Reg4,
        Reg5 => Reg5,
        Reg6 => Reg6,
        Reg7 => Reg7,
        Reg8 => Reg8,
        Z => Z
    );
    
    simul: process
        begin
            wait for TIME_CYCLE;
            Sel <= "001";
            wait for TIME_CYCLE;
            Sel <= "010";
            wait for TIME_CYCLE;
            Sel <= "011";
            wait for TIME_CYCLE;
            Sel <= "100";
            wait for TIME_CYCLE;
            Sel <= "101";
            wait for TIME_CYCLE;
            Sel <= "110";
            wait for TIME_CYCLE;
            Sel <= "111";                   
        end process;
        
end Behavioral;
