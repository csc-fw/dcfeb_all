Version 4
SymbolType BLOCK
TEXT 32 32 LEFT 4 sem_core
RECTANGLE Normal 32 32 704 768
LINE Normal 0 80 32 80
PIN 0 80 LEFT 36
PINATTR PinName inject_strobe
PINATTR Polarity IN
LINE Wide 0 112 32 112
PIN 0 112 LEFT 36
PINATTR PinName inject_address[35:0]
PINATTR Polarity IN
LINE Normal 0 144 32 144
PIN 0 144 LEFT 36
PINATTR PinName icap_busy
PINATTR Polarity IN
LINE Wide 0 176 32 176
PIN 0 176 LEFT 36
PINATTR PinName icap_o[31:0]
PINATTR Polarity IN
LINE Normal 0 208 32 208
PIN 0 208 LEFT 36
PINATTR PinName icap_clk
PINATTR Polarity IN
LINE Normal 0 240 32 240
PIN 0 240 LEFT 36
PINATTR PinName icap_csb
PINATTR Polarity OUT
LINE Normal 0 304 32 304
PIN 0 304 LEFT 36
PINATTR PinName icap_rdwrb
PINATTR Polarity OUT
LINE Wide 0 336 32 336
PIN 0 336 LEFT 36
PINATTR PinName icap_i[31:0]
PINATTR Polarity OUT
LINE Normal 0 368 32 368
PIN 0 368 LEFT 36
PINATTR PinName icap_grant
PINATTR Polarity IN
LINE Normal 0 400 32 400
PIN 0 400 LEFT 36
PINATTR PinName icap_request
PINATTR Polarity OUT
LINE Normal 0 432 32 432
PIN 0 432 LEFT 36
PINATTR PinName fecc_crcerr
PINATTR Polarity IN
LINE Normal 0 464 32 464
PIN 0 464 LEFT 36
PINATTR PinName fecc_eccerr
PINATTR Polarity IN
LINE Normal 0 496 32 496
PIN 0 496 LEFT 36
PINATTR PinName fecc_eccerrsingle
PINATTR Polarity IN
LINE Normal 0 528 32 528
PIN 0 528 LEFT 36
PINATTR PinName fecc_syndromevalid
PINATTR Polarity IN
LINE Wide 0 560 32 560
PIN 0 560 LEFT 36
PINATTR PinName fecc_syndrome[12:0]
PINATTR Polarity IN
LINE Wide 0 592 32 592
PIN 0 592 LEFT 36
PINATTR PinName fecc_far[23:0]
PINATTR Polarity IN
LINE Wide 0 624 32 624
PIN 0 624 LEFT 36
PINATTR PinName fecc_synbit[4:0]
PINATTR Polarity IN
LINE Wide 0 656 32 656
PIN 0 656 LEFT 36
PINATTR PinName fecc_synword[6:0]
PINATTR Polarity IN
LINE Normal 736 80 704 80
PIN 736 80 RIGHT 36
PINATTR PinName status_heartbeat
PINATTR Polarity OUT
LINE Normal 736 112 704 112
PIN 736 112 RIGHT 36
PINATTR PinName status_initialization
PINATTR Polarity OUT
LINE Normal 736 144 704 144
PIN 736 144 RIGHT 36
PINATTR PinName status_observation
PINATTR Polarity OUT
LINE Normal 736 176 704 176
PIN 736 176 RIGHT 36
PINATTR PinName status_correction
PINATTR Polarity OUT
LINE Normal 736 208 704 208
PIN 736 208 RIGHT 36
PINATTR PinName status_classification
PINATTR Polarity OUT
LINE Normal 736 240 704 240
PIN 736 240 RIGHT 36
PINATTR PinName status_injection
PINATTR Polarity OUT
LINE Normal 736 272 704 272
PIN 736 272 RIGHT 36
PINATTR PinName status_essential
PINATTR Polarity OUT
LINE Normal 736 304 704 304
PIN 736 304 RIGHT 36
PINATTR PinName status_uncorrectable
PINATTR Polarity OUT
LINE Wide 736 336 704 336
PIN 736 336 RIGHT 36
PINATTR PinName monitor_txdata[7:0]
PINATTR Polarity OUT
LINE Normal 736 368 704 368
PIN 736 368 RIGHT 36
PINATTR PinName monitor_txwrite
PINATTR Polarity OUT
LINE Normal 736 400 704 400
PIN 736 400 RIGHT 36
PINATTR PinName monitor_txfull
PINATTR Polarity IN
LINE Wide 736 432 704 432
PIN 736 432 RIGHT 36
PINATTR PinName monitor_rxdata[7:0]
PINATTR Polarity IN
LINE Normal 736 464 704 464
PIN 736 464 RIGHT 36
PINATTR PinName monitor_rxread
PINATTR Polarity OUT
LINE Normal 736 496 704 496
PIN 736 496 RIGHT 36
PINATTR PinName monitor_rxempty
PINATTR Polarity IN
