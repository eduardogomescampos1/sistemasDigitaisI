entity StartTrekAssault is
    port (
    clock, reset: in bit; -- sinais de controle globais
    damage: in bit_vector(7 downto 0); -- Entrada de dados: dano
    shield: out bit_vector(7 downto 0); -- Saída: shield atual
    health: out bit_vector(7 downto 0); -- Saída: health atual
    turn: out bit_vector(4 downto 0); -- Saída: rodada atual
    WL: out bit_vector(1 downto 0) -- Saída: vitória e/ou derrota
    );
    end entity;

architecture game of StarTrekAssault is
    end game;