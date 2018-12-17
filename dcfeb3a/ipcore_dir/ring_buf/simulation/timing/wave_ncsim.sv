
 
 
 



 

window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /ring_buf_tb/status
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/CLKA
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/ADDRA
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/DINA
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/WEA
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/SBITERR
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/DBITERR
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/RDADDRECC
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/INJECTSBITERR
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/INJECTDBITERR
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/CLKB
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/ADDRB
      waveform add -signals /ring_buf_tb/ring_buf_synth_inst/bmg_port/DOUTB
console submit -using simulator -wait no "run"
