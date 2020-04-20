----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 11:19:05 AM
-- Design Name: 
-- Module Name: eight_reg_bench - Behavioral
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

entity eight_reg_bench is
--  Port ( );
end eight_reg_bench;

architecture Behavioral of eight_reg_bench is
    component eight_registers is
        Port(
           D : in STD_LOGIC_VECTOR(15 downto 0);
           Clk :in STD_LOGIC;
           Reset : in STD_LOGIC;
           L0 : in STD_LOGIC;
           L1 : in STD_LOGIC;
           L2 : in STD_LOGIC;
           L3 : in STD_LOGIC;
           L4 : in STD_LOGIC;
           L5 : in STD_LOGIC;
           L6 : in STD_LOGIC;
           L7 : in STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR(15 downto 0);
           R1 : out STD_LOGIC_VECTOR(15 downto 0);
           R2 : out STD_LOGIC_VECTOR(15 downto 0);
           R3 : out STD_LOGIC_VECTOR(15 downto 0);
           R4 : out STD_LOGIC_VECTOR(15 downto 0);
           R5 : out STD_LOGIC_VECTOR(15 downto 0);
           R6 : out STD_LOGIC_VECTOR(15 downto 0);
           R7 : out STD_LOGIC_VECTOR(15 downto 0)       
        );
    end component;
    
     signal D : STD_LOGIC_VECTOR(15 downto 0) := X"ABCD";
     signal Clk :STD_LOGIC := '0';
     signal Reset : STD_LOGIC := '1';
     signal L0 : STD_LOGIC := '1' ;
     signal L1 : STD_LOGIC := '0';
     signal L2 : STD_LOGIC := '0';
     signal L3 : STD_LOGIC := '0';
     signal L4 : STD_LOGIC := '0';
     signal L5 : STD_LOGIC := '0';
     signal L6 : STD_LOGIC := '0';
     signal L7 : STD_LOGIC := '0';
     signal R0 : STD_LOGIC_VECTOR(15 downto 0);
     signal R1 : STD_LOGIC_VECTOR(15 downto 0);
     signal R2 : STD_LOGIC_VECTOR(15 downto 0);
     signal R3 : STD_LOGIC_VECTOR(15 downto 0);
     signal R4 : STD_LOGIC_VECTOR(15 downto 0);
     signal R5 : STD_LOGIC_VECTOR(15 downto 0);
     signal R6 : STD_LOGIC_VECTOR(15 downto 0);
     signal R7 : STD_LOGIC_VECTOR(15 downto 0);
    
     constant TIME_CYCLE: time := 15 ns;
begin
    uut: eight_registers port map(
        D => D,
        Clk => Clk,
        Reset => Reset,
        L0 => L0,
        L1 => L1,
        L2 => L2,
        L3 => L3,
        L4 => L4,
        L5 => L5,
        L6 => L6,
        L7 => L7,
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7   
    );
    
    clock: process
    begin
        wait for TIME_CYCLE/2;
        Clk <= not Clk;
    end process;
    simul: process
    begin
        wait for TIME_CYCLE;
        Reset <= '0';
        L1 <= '1';
        L0 <= '0';
        wait for TIME_CYCLE;
        L1 <= '0';
        L2 <= '1';
        wait for TIME_CYCLE;
        L2 <= '0';
        L3 <= '1';
        wait for TIME_CYCLE;
        L3 <= '0';
        L4 <= '1';
        wait for TIME_CYCLE;
        L4 <= '0';
        L5 <= '1';
        wait for TIME_CYCLE;
        L5 <= '0';
        L6 <= '1';
        wait for TIME_CYCLE;
        L6 <= '0';
        L7 <= '1';
        wait for TIME_CYCLE;
        L7 <= '0';      
    end process;
end Behavioral;

