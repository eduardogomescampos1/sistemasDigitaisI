
-------------------------------------------------------
--! @file fa_1bit_tb.vhd
--! @brief Testbench for 1-bit adder
--! @author Edson S. Gomi (gomi@usp.br)
--! @date 2020-03-21
-------------------------------------------------------

--  A testbench has no ports.
entity fa_1bit_tb is
end entity fa_1bit_tb;

architecture testbench of fa_1bit_tb is

  --  Declaration of the component to be tested.  
  component fa_1bit
    port (
      A,B : in bit;       -- adends
      CIN : in bit;       -- carry-in
      SUM : out bit;      -- sum
      COUT : out bit      -- carry-out
    );
  end component fa_1bit;

  -- Declaration of signals
  signal a,b : bit;
  signal cin : bit;
  signal sum : bit;
  signal cout : bit;

begin
  -- Component instantiation
  -- DUT = Device Under Test 
  DUT: entity work.fa_1bit(wakerly) port map (
    A => a,
    B => b,
    CIN => cin,
    SUM => sum,
    COUT => cout
    );

  --  This process does the real job.
  stimulus_process: process is
  begin
    cin <= '0';
    a <= '0';
    b <= '0';
    wait for 1 ns;
    assert(sum = '0') report "Sum fail (cin,a,b) = (0,0,0)" severity error;
    assert(cout = '0') report "Cout fail (cin,a,b) = (0,0,0)" severity error;
    
    cin <= '0';    
    a <= '0';
    b <= '1';
    wait for 1 ns;
    assert(sum = '1') report "Sum fail (cin,a,b) = (0,0,1)" severity error;
    assert(cout = '0') report "Cout fail (cin,a,b) = (0,0,1)" severity error;    

    cin <= '0';    
    a <= '1';
    b <= '0';
    wait for 1 ns;
    assert(sum = '1') report "Sum fail (cin,a,b) = (0,1,0)" severity error;
    assert(cout = '0') report "Cout fail (cin,a,b) = (0,1,0)" severity error;
    
    cin <= '0';    
    a <= '1';
    b <= '1';
    wait for 1 ns;
    assert(sum = '0') report "Sum fail (cin,a,b) = (0,1,1)" severity error;
    assert(cout = '1') report "Cout fail (cin,a,b) = (0,1,1)" severity error;

    cin <= '1';    
    a <= '0';
    b <= '0';
    wait for 1 ns;    
    assert(sum = '1') report "Sum fail (cin,a,b) = (1,0,0)" severity error;
    assert(cout = '0') report "Cout fail (cin,a,b) = (1,0,0)" severity error;

    cin <= '1';    
    a <= '0';
    b <= '1';
    wait for 1 ns;    
    assert(sum = '0') report "Sum fail (cin,a,b) = (1,0,1)" severity error;
    assert(cout = '1') report "Cout fail (cin,a,b) = (1,0,1)" severity error;

    cin <= '1';    
    a <= '1';
    b <= '0';
    wait for 1 ns ;   
    assert(sum = '0') report "Sum fail (cin,a,b) = (1,1,0)" severity error;
    assert(cout = '1') report "Cout fail (cin,a,b) = (1,1,0)" severity error;

    cin <= '1';    
    a <= '1';
    b <= '1';
    wait for 1 ns;    
    assert(sum = '1') report "Sum fail (cin,a,b) = (1,1,1)" severity error;
    assert(cout = '1') report "Cout fail (cin,a,b) = (1,1,1)" severity error;

    assert false report "End of test" severity note;        
    wait; -- End simulation

end process stimulus_process;
    
end architecture testbench;
  

