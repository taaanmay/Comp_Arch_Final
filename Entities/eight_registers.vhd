----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 09:29:15 AM
-- Design Name: 
-- Module Name: eight_registers - Behavioral
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

entity eight_registers is
    Port ( D : in STD_LOGIC_VECTOR(15 downto 0);
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
           R7 : out STD_LOGIC_VECTOR(15 downto 0));
end eight_registers;

architecture Behavioral of eight_registers is
component reg_8
    Port( D: in STD_LOGIC_VECTOR(15 downto 0);
          Load: in STD_LOGIC;
          Clk: in STD_LOGIC;
          Q: out STD_LOGIC_VECTOR(15 downto 0);
          Reset: in STD_LOGIC
          );
end component;

begin
    reg0 : reg_8 port map(
          D => D,
          Clk => Clk,  
          Load => L0,
          Q => R0,
          Reset => Reset);
    
    reg1 : reg_8 port map(
          D => D,
          Clk => Clk,  
          Load => L1,
          Q => R1,
          Reset => Reset);
    
    reg2 : reg_8 port map(
          D => D,
          Clk => Clk,  
          Load => L2,
          Q => R2,
          Reset => Reset);
    
    reg3 : reg_8 port map(
          D => D,
          Clk => Clk,  
          Load => L3,
          Q => R3,
          Reset => Reset);
    
    reg4 : reg_8 port map(
          D => D,
          Clk => Clk,  
          Load => L4,
          Q => R4,
          Reset => Reset);
    
    reg5 : reg_8 port map(
          D => D,
          Clk => Clk,  
          Load => L5,
          Q => R5,
          Reset => Reset);
    
    reg6 : reg_8 port map(
          D => D,
          Clk => Clk,  
          Load => L6,
          Q => R6,
          Reset => Reset);
    
    reg7 :  reg_8 port map(
          D => D,
          Clk => Clk,  
          Load => L7,
          Q => R7,
          Reset => Reset);

end Behavioral;
