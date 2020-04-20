----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 10:01:10 AM
-- Design Name: 
-- Module Name: Processor - Behavioral
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

entity Processor is
Port ( 
        Clk: in STD_LOGIC;
        Reset: in STD_LOGIC
  );
end Processor;

architecture Behavioral of Processor is
    component data_path is
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
    end component;
    component control_address_register is
    Port ( 
        Opcode : in STD_LOGIC_VECTOR(7 downto 0);
        Next_instruction : out STD_LOGIC_VECTOR (7 downto 0);
        Sel_S : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Reset: in STD_LOGIC
    );
    end component;
    component program_counter is
      Port ( PL : in STD_LOGIC;
         PI : in STD_LOGIC;
         Clk : in STD_LOGIC;
         Displacement : in STD_LOGIC_VECTOR (15 downto 0);
         Instr_out : out STD_LOGIC_VECTOR (15 downto 0);
         Reset: in STD_LOGIC
         );
    end component;
    component CPSR is
         Port ( V : in STD_LOGIC;
           C : in STD_LOGIC;
           N : in STD_LOGIC;
           Z : in STD_LOGIC;
           Flag_out : out STD_LOGIC;
           MS : in STD_LOGIC_VECTOR (2 downto 0));
    end component;
    component control_memory is
        Port (  MW : out std_logic;
                MM : out std_logic;
                RW : out std_logic;
                MD : out std_logic;
                FS : out std_logic_vector(4 downto 0);
                MB : out std_logic;
                TB : out std_logic;
                TA : out std_logic;
                TD : out std_logic;
                PL : out std_logic;
                PI : out std_logic;
                IL : out std_logic;
                MC : out std_logic;
                MS : out std_logic_vector(2 downto 0);
                NA : out std_logic_vector(7 downto 0);
                IN_CAR : in std_logic_vector(7 downto 0));
    end component;
    component instruction_register is
        Port( Inst_in : in STD_LOGIC_VECTOR (15 downto 0);
          IL : in STD_LOGIC;
          Opcode : out STD_LOGIC_VECTOR (7 downto 0);
          DR: out STD_LOGIC_VECTOR (2 downto 0);
          SA: out STD_LOGIC_VECTOR (2 downto 0);
          SB: out STD_LOGIC_VECTOR (2 downto 0);
          Clk: in STD_LOGIC;
          Reset: in STD_LOGIC
    );
    end component;
    component memory is
        Port (   address : in std_logic_vector(15 downto 0);
                 write_data : in std_logic_vector(15 downto 0);
                 MemWrite, MemRead : in std_logic;
                 read_data : out std_logic_vector(15 downto 0);
                 Clk: in std_logic
        );
    end component;
    component extend_sign is
        Port ( DR : in STD_LOGIC_VECTOR (2 downto 0);
           SB : in STD_LOGIC_VECTOR( 2 downto 0);
           Z : out STD_LOGIC_VECTOR ( 15 downto 0));
    end component;
    component zero_fill is
        Port ( A : in STD_LOGIC_VECTOR(2 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0));
    end component;
    component Mux_2to1_8_bit is
        Port ( Sel : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR(7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           Z : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    component Mux2_16bit is
        Port ( D0 : in STD_LOGIC_VECTOR(15 downto 0);
           D1 : in STD_LOGIC_VECTOR(15 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0);
           Sel : in STD_LOGIC);
    end component;
    signal zero_filled : STD_LOGIC_VECTOR (15 downto 0);
    signal Z_flag : STD_LOGIC;
    signal v_flag : STD_LOGIC;
    signal c_flag :  STD_LOGIC;
    signal n_flag : STD_LOGIC;
    signal fs_sig : STD_LOGIC_VECTOR(4 downto 0);
    signal MB_sel_sig: STD_LOGIC;
    signal MD_sel_sig: STD_LOGIC;
    signal addr_out_sign : STD_LOGIC_VECTOR (15 downto 0);
    signal data_out_sign : STD_LOGIC_VECTOR (15 downto 0);
    signal data_in_from_mem : STD_LOGIC_VECTOR (15 downto 0);
    signal reg_B_sel : STD_LOGIC_VECTOR (3 downto 0);
    signal reg_A_sel : STD_LOGIC_VECTOR (3 downto 0);
    signal load_en_reg: STD_LOGIC;
    signal dest_sel_reg : STD_LOGIC_VECTOR (3 downto 0);
    signal opcode_sig: STD_LOGIC_VECTOR( 7 downto 0);
    signal next_inst: STD_LOGIC_VECTOR( 7 downto 0);
    signal flag_out : STD_LOGIC;
    signal flag_select : STD_LOGIC_VECTOR( 2 downto 0);
    signal PL_sig : STD_LOGIC;
    signal PI_sig : STD_LOGIC;
    signal Displacement_for_pc : STD_LOGIC_VECTOR (15 downto 0);
    signal Instr_out_pc :  STD_LOGIC_VECTOR (15 downto 0);
    signal IL_sig :STD_LOGIC;
    signal DR_sig : STD_LOGIC_VECTOR (2 downto 0);
    signal SA_sig : STD_LOGIC_VECTOR (2 downto 0);
    signal SB_sig : STD_LOGIC_VECTOR (2 downto 0);
    signal MC_sig : STD_LOGIC;
    signal NA_sig : STD_LOGIC_VECTOR (7 downto 0);
    signal MM_sig : STD_LOGIC;
    signal MW_sig : STD_LOGIC;
    signal opcode_sig_mux : STD_LOGIC_VECTOR(7 downto 0);
    signal mux_m_out : STD_LOGIC_VECTOR(15 downto 0);
    signal Mem_read : STD_LOGIC;
    
begin
    data_p : data_path port map(
        DestSel => dest_sel_reg ,
        LoadEnable => load_en_reg,
        Asel => reg_A_sel,
        Bsel => reg_B_sel,
        Data_in => data_in_from_mem,
        Data_out => data_out_sign,
        Address_out => addr_out_sign,
        MD_sel => MD_sel_sig,
        MB_sel => MB_sel_sig,
        Const_in => zero_filled,
        FS => FS_sig,
        Clk => Clk,
        Reset => Reset,
        V => V_flag,
        C => C_flag,
        N => N_flag,
        Z => z_flag
    );
    car : control_address_register port map(
        Opcode => opcode_sig_mux,
        Next_instruction => next_inst,
        Sel_S => flag_out,
        Clk => Clk,
        Reset => Reset
    );
    pc : program_counter port map(
         PL => PL_sig,
         PI => PI_sig,
         Clk => Clk,
         Displacement => Displacement_for_pc,
         Instr_out => Instr_out_pc,
         Reset => Reset
    );
    CPSReg: CPSR port map(
           V => v_flag,
           C => c_flag,
           N => n_flag,
           Z => z_flag,
           Flag_out => flag_out,
           MS => flag_select
    ); 
    control_mem : control_memory port map(
          MW => MW_sig,
          MM => MM_sig,
          RW => load_en_reg,
          MD => MD_sel_sig,
          FS => FS_sig,
          MB => MB_sel_sig,
          TB => reg_B_sel(3),
          TA => reg_A_sel(3),
          TD => dest_sel_reg(3),
          PL => PL_sig,
          PI => PI_sig,
          IL => IL_sig,
          MC => MC_sig,
          MS => flag_select,
          NA => NA_sig,
          IN_CAR => next_inst
    );
    IR: instruction_register port map(
          Inst_in => data_in_from_mem,
          IL => IL_sig,
          Opcode => opcode_sig,
          DR => DR_sig,
          SA => SA_sig,
          SB => SB_sig,
          Clk => Clk,
          Reset => Reset
    );
    main_mem : memory port map(
        address => mux_m_out,
        write_data => data_out_sign,
        MemWrite => MW_sig, 
        MemRead => Mem_read,
        read_data => data_in_from_mem,
        Clk => Clk 
    );
    sign_ex : extend_sign port map(
        DR => DR_sig,
        SB => SB_sig,
        Z => Displacement_for_pc
    );
    zero_fll : zero_fill port map(
        A => SB_sig,
        Z => zero_filled
    );
    mux_c : Mux_2to1_8_bit port map(
        Sel => MC_sig,
        A => NA_sig,
        B => opcode_sig,
        Z => opcode_sig_mux
    );
    mux_m : Mux2_16bit port map(
        D0 => addr_out_sign,
        D1 => instr_out_pc,
        Z => mux_m_out,
        Sel => MM_sig
    );
    
    mem_read <= not MW_sig;
    reg_A_sel(2 downto 0) <= SA_sig;
    reg_B_sel(2 downto 0) <= SB_sig;
    dest_sel_reg(2 downto 0) <= DR_sig;
    

end Behavioral;
