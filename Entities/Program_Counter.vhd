----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 09:18:38 AM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
Port ( PL : in STD_LOGIC;
         PI : in STD_LOGIC;
         Clk : in STD_LOGIC;
         Displacement : in STD_LOGIC_VECTOR (15 downto 0);
         Instr_out : out STD_LOGIC_VECTOR (15 downto 0);
         Reset: in STD_LOGIC
         );
         
end program_counter;

architecture Behavioral of program_counter is
    component sixteen_bit_ALU is
        Port(   
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC);
       end component;
       signal ALU_control : STD_LOGIC_VECTOR (3 downto 0) := "0010"; -- always on add
       
       signal ALU_input : STD_LOGIC_VECTOR ( 15 downto 0) := x"0000";
       signal ALU_output : STD_LOGIC_VECTOR(15 downto 0);
       
       signal state: STD_LOGIC_VECTOR(15 downto 0);
begin
    alu : sixteen_bit_ALU port map(
       A => state ,
       B => ALU_input,
       S0 => ALU_control(1),
       Cin => ALU_control(0),
       S1 => ALU_control(2),
       S2 => ALU_control(3),
       Sum => ALU_output
    );
    Instr_out <= state after 1ns;
    process( Clk, Reset)
    begin
        if(Reset = '1') then
            state <= x"0000";       
        elsif(Clk = '1' and PI = '1' and PL = '0') then
            state <= ALU_output;
            -- increment the state
        elsif( Clk = '1' and PL = '1' and PI = '0') then
                state <= ALU_output;
                -- add or subtract the displacement of the state
        else 
                state <= state;
        end if;
     end process;
     ALU_input <= X"0001" after 1ns when PI = '1' and PL = '0' else
                  Displacement after 1ns when PL ='1' and PI = '0' else
                  X"0000" after 1ns;
end Behavioral;
