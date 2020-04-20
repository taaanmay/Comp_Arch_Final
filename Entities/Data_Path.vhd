----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 03:47:41 PM
-- Design Name: 
-- Module Name: Data_Path - Behavioral
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


entity data_path is
    Port ( DestSel : in STD_LOGIC_VECTOR (3 downto 0);
           LoadEnable : in STD_LOGIC;
           Asel : in STD_LOGIC_VECTOR (3 downto 0);
           Bsel : in STD_LOGIC_VECTOR (3 downto 0);
           Data_in : in STD_LOGIC_VECTOR (15 downto 0);
           Data_out : out STD_LOGIC_VECTOR (15 downto 0);
           Address_out : out STD_LOGIC_VECTOR (15 downto 0);
           MD_sel : in STD_LOGIC;
           MB_sel : in STD_LOGIC;
           Const_in : in STD_LOGIC_VECTOR (15 downto 0);
           FS : in STD_LOGIC_VECTOR ( 4 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC);
end data_path;

architecture Behavioral of data_path is
    component function_unit is
        Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Gout : out STD_LOGIC_VECTOR (15 downto 0);
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC);
    end component;
    component register_file is
         Port ( src_S0 : in STD_LOGIC_VECTOR (3 downto 0);
           src_S1 : in STD_LOGIC_VECTOR (3 downto 0);
           dst_1 : in STD_LOGIC;
           dst_2 : in STD_LOGIC;
           dst_3 : in STD_LOGIC;
           dst_4 : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data_new : in STD_LOGIC_VECTOR (15 downto 0);
           Reset: in STD_LOGIC;
           Load_enable: in STD_LOGIC;
           Data_b : out STD_LOGIC_VECTOR (15 downto 0);
           Data_a : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    component Mux2_16bit is
        Port ( D0 : in STD_LOGIC_VECTOR(15 downto 0);
           D1 : in STD_LOGIC_VECTOR(15 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0);
           Sel : in STD_LOGIC);
    end component;
    
    signal mux_b_out : STD_LOGIC_VECTOR(15 downto 0);
    signal mux_d_out : STD_LOGIC_VECTOR(15 downto 0);
    signal fu_out : STD_LOGIC_VECTOR (15 downto 0);
    signal a_data : STD_LOGIC_VECTOR (15 downto 0);
    signal b_data : STD_LOGIC_VECTOR (15 downto 0);
    
    
begin
    rg : register_file port map( 
        src_S0 => Asel,
        src_S1 => Bsel,
        dst_1 => DestSel(0),
        dst_2 => DestSel(1),
        dst_3 => DestSel(2),
        dst_4 => DestSel(3),
        Clk => Clk,
        Data_new => mux_d_out,
        Reset => Reset,
        Load_enable => LoadEnable,
        Data_b => b_data,
        Data_a => a_data
    );
    fu : function_unit port map(
        A => a_data,
        B => mux_b_out,
        Gout => fu_out,
        FS => FS,
        C => C,
        V => V,
        N => N,
        Z => Z 
    );
    tto_mux_b : Mux2_16bit port map(
        D0 => b_data,
        D1 => Const_in,
        Z => mux_b_out,
        Sel => MB_sel
    );
    tto_mux_d : Mux2_16bit port map(
        D0 => fu_out,
        D1 => Data_in,
        Z => mux_d_out,
        Sel => MD_sel
    );
    Data_out <= b_data after 1ns;
    Address_out <= a_data after 1ns;


end Behavioral;
