----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 09:33:42 AM
-- Design Name: 
-- Module Name: decoder_4to9 - Behavioral
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

entity decoder_4to9 is

    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           S3 : in STD_LOGIC;
           R0 : out STD_LOGIC;
           R1 : out STD_LOGIC;
           R2 : out STD_LOGIC;
           R3 : out STD_LOGIC;
           R4 : out STD_LOGIC;
           R5 : out STD_LOGIC;
           R6 : out STD_LOGIC;
           R7 : out STD_LOGIC;
           R8 : out STD_LOGIC);
end decoder_4to9;

architecture Behavioral of decoder_4to9 is

begin
    R0 <= ((not S0) and (not S1) and (not S2));
    R1 <= ((not S0) and (not S1) and S2);
    R2 <= ((not S0) and S1 and (not S2));
    R3 <= ((not S0) and S1 and S2);
    R4 <= (S0 and (not S1) and (not S2));
    R5 <= (S0 and (not S1) and S2);
    R6 <= (S0 and S1 and (not S2));
    R7 <= (S0 and S1 and S2);
    R8 <= (S3 and (not S0) and (not S1) and (not S2));

end Behavioral;
