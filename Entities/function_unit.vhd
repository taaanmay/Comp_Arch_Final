----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 03:26:46 PM
-- Design Name: 
-- Module Name: function_unit - Behavioral
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
entity function_unit is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Gout : out STD_LOGIC_VECTOR (15 downto 0);
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC; -- carry set if no borrow method
           N : out STD_LOGIC;
           Z : out STD_LOGIC);
end function_unit;

architecture Behavioral of function_unit is
    component sixteen_bit_ALU is
        Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC); 
    end component;
    component sixteen_bit_shifter is
        Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           H : out STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           LeftOut : out STD_LOGIC; -- not needed in this implementation, (maybe connect to carry later)
           RightOut : out STD_LOGIC; -- not needed in this implementation, (maybe connect to carry later)
           LeftConst : in STD_LOGIC;
           RightConst : in STD_LOGIC);
    end component;
    component mux2_16bit is
        Port ( D0 : in STD_LOGIC_VECTOR(15 downto 0);
           D1 : in STD_LOGIC_VECTOR(15 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0);
           Sel : in STD_LOGIC);
    end component;
    
    signal ALU_out : STD_LOGIC_VECTOR (15 downto 0);
    signal shifter_out : STD_LOGIC_VECTOR (15 downto 0);
    signal output : STD_LOGIC_VECTOR (15 downto 0);

begin
    ALU : sixteen_bit_ALU port map(
        A => A,
        B => B,
        S0 => FS(1),
        S1 => FS(2),
        S2 => FS(3),
        Sum => ALU_out,
        Cin => FS(0),
        Cout => C
    );
    shifter : sixteen_bit_shifter port map(
        B => B,
        H => shifter_out,
        S => FS(3 downto 2),
        LeftConst => '0',
        RightConst => '0'
    );
    mux : mux2_16bit port map(
        D0 => ALU_out,
        D1 => shifter_out,
        Z => output,
        Sel => FS(4)
    );
    
    N <= '1' after 1ns when output(15) = '1' else
         '0' after 1ns;
    Z <= '1' after 1ns when output = x"0000" else
         '0' after 1ns;
    V <=  '1' after 1ns when A(15) = '0' and B(15) = '1' and output(15) = '1' and FS = "00101" else -- subtraction cases
          '1' after 1ns when A(15) = '1' and B(15) = '0' and output(15) = '0' and FS = "00101" else
          '1' after 1ns when A(15) = '0' and B(15) = '0' and output(15) = '1' else    -- addition cases
          '1' after 1ns when A(15) = '1' and B(15) = '1' and output(15) = '0' else
          '0' after 1ns;
    Gout <= output;


end Behavioral;
