-- xmobar config used by Billy Rond
-- Author: Billy Rond
-- Heavily borrowed from Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- Dark_Green = "#3465a4",
-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:Fixed-9",
    bgColor = "#000000",
    fgColor = "#a40000",
    position = Static { xpos = 0, ypos = 0, width = 1280, height = 16 },
    -- position = Static { xpos = 1920, ypos = 0, width = 1800, height = 16 },
    lowerOnStart = True,
    commands = [
        -- Run Weather "KPAO" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#3465a4","-h","#cc9393","-l","#96CBFE"] 36000,
        -- Run PipeReader "/home/bertabus/.xmonad/README.markdown" "log",   
        -- total4 just for testing, remove after observing
        Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#cc9393","-l","#3465a4","-n","#a40000","-w","3"] 10,
        -- Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#cc9393","-l","#3465a4","-n","#a40000","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#cc9393","-l","#3465a4","-n","#a40000"] 10,
        -- Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#cc9393","-l","#3465a4","-n","#a40000"] 10,
        Run Com "/home/bertabus/.config/bin/getVol.sh" [] "Vol" 10,
        Run Network "wls3" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#cc9393","-l","#3465a4","-n","#a40000"] 10,
        Run Date "%a %b %_d %l:%M" "date" 10,
        Run Battery ["-t", "Bat: <left>%","-L","10","-H","11","-l","#CC9393","-h","#3465a4"] 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %multicpu% | %memory% | %Vol% | %wls3% | %battery% | <fc=#3465a4>%date%</fc>"
    -- template = "%StdinReader% }{ %multicpu%   %memory%   %swap%   %wls3%   <fc=#3465a4>%date%</fc>  %battery%   %KPAO%"
}
