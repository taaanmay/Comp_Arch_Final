----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 09:54:33 AM
-- Design Name: 
-- Module Name: Control_Address_Register - Behavioral
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

entity Control_Address_Register is
Port ( 
        Opcode : in STD_LOGIC_VECTOR(7 downto 0);
        Next_instruction : out STD_LOGIC_VECTOR (7 downto 0);
        Sel_S : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Reset: in STD_LOGIC
    );
end Control_Address_Register;

architecture Behavioral of Control_Address_Register is
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
       signal control : STD_LOGIC_VECTOR (3 downto 0) := "0010"; -- always on add
       signal state : STD_LOGIC_VECTOR (7 downto 0);
       
       signal input_sig : STD_LOGIC_VECTOR ( 15 downto 0) := x"0001";
       signal output_sig : STD_LOGIC_VECTOR(15 downto 0);
       
       signal zero_fill : STD_LOGIC_VECTOR(7 downto 0) := x"00";
       
begin
    alu : sixteen_bit_ALU port map(
       A(7 downto 0) => state ,
       A(15 downto 8) => zero_fill,
       B => input_sig,
       S0 => control(1),
       Cin => control(0),
       S1 => control(2),
       S2 => control(3),
       Sum => output_sig
    );
    Next_instruction <= state after 1ns;
    process(Clk, Reset)
    begin
        if(Reset = '1') then
            state <= x"00";
        elsif(Clk = '1' and Sel_S = '0') then
            state <= output_sig (7 downto 0);
        elsif(Clk = '1' and Sel_S = '1') then
            state <= Opcode;
        end if;
    end process;
        
            

end Behavioral;
