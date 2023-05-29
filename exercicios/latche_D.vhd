entity flipflop is 
port (clock : in bit;
     d: in bit;
     Q: out bit;
     Qneg: out bit);
end flipflop;

architecture comportamental of flipflop is
    signal qi : bit;
    begin
        ClockReaction : process(clock);
        begin   
            if(clock = 1) then
                qi <= D;
            end if;
        end process ClockReaction;
        Q <= qi;
        Qneg <= not qi;
    end comportamental;