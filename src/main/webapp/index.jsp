<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>How to Build Length Conventer using JavaScript</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='indexx.css'>
    <script src='main.js'></script>
</head>
<body>
    <div class="container">
        <h1 class="para">STOP WATCH</h1>
        <div class="watch">
            <div class="outer-circle">
                <div class="inner-circle">
                    <span class="text minute">0 :</span>
                    <span class="text sec">&nbsp; 0:</span>
                    <span class="text msec">&nbsp; 0</span>
                </div>
            </div>
            <div class="button-wrapper">
                <button class="button reset hidden">Reset</button>
                <button class="button play">Play</button>
                <button class="button lap hidden">Laps</button>
            </div>
        </div>
        <ul class="laps">
            <!-- <li class="lap-item">
                <span class="number">#1</span>
                <span class="time-stamp">01 : 43 : 07</span>
            </li>
            <li class="lap-item">
                <span class="number">#1</span>
                <span class="time-stamp">01 : 43 : 07</span>
            </li>
            <li class="lap-item">
                <span class="number">#1</span>
                <span class="time-stamp">01 : 43 : 07</span>
            </li>
            <li class="lap-item">
                <span class="number">#1</span>
                <span class="time-stamp">01 : 43 : 07</span>
            </li>
            <li class="lap-item">
                <span class="number">#1</span>
                <span class="time-stamp">01 : 43 : 07</span>
            </li>
            <li class="lap-item">
                <span class="number">#1</span>
                <span class="time-stamp">01 : 43 : 07</span>
            </li> -->
            <button class="lap-clear-button hidden">Clear All</button>
        </ul>
        </div>
    </div>
    
    <script>
        const playButton = document.getElementsByClassName("play")[0];
        const lapButton = document.getElementsByClassName("lap")[0];
        const resetButton = document.getElementsByClassName("reset")[0];
        const minute = document.getElementsByClassName("minute")[0];
        const second = document.getElementsByClassName("sec")[0];
        const centiSecond = document.getElementsByClassName("msec")[0];
        const laps = document.getElementsByClassName("laps")[0];
        const clearButton = document.getElementsByClassName("lap-clear-button")[0];
        const bg = document.getElementsByClassName("outer-circle")[0];

        let isPlay = false
        let secCounter = 0;
        let min;
        let sec;
        let centiSec;
        let centiCounter = 0;
        let minCounter = 0
        let isReset = false;
        let lapItem = 0;
        const toogleButton = ()=>{
            lapButton.classList.remove("hidden");
            resetButton.classList.remove("hidden");
        }
        const play = ()=>{
            if(!isPlay && !isReset){
                playButton.innerHTML = 'Pause';
                bg.classList.add("animation-bg");
                min = setInterval(()=>{
                    minute.innerHTML = `${++minCounter} :`;     
                }, 60*1000);
                 sec = setInterval(()=>{
                    if(secCounter === 60){
                        secCounter = 0;
                    }
                    second.innerHTML = `&nbsp;${++secCounter} :`;     
                }, 1000);
                centiSec = setInterval(()=>{
                    if(centiCounter === 100){
                        centiCounter = 0;
                    }
                    centiSecond.innerHTML = `&nbsp;${++centiCounter}`;     
                }, 10);
                isPlay = true;
                isReset = true;
            }else{
                playButton.innerHTML = 'Play';
                clearInterval(min);
                clearInterval(sec);
                clearInterval(centiSec);
                isPlay = false;
                isReset = false;
                bg.classList.remove("animation-bg");
            }
            toogleButton();
        }
        const reset = () =>{
            isReset = true;
            play();
            lapButton.classList.add("hidden");
            resetButton.classList.add("hidden");
            second.innerHTML = '&nbsp;0';
            centiSecond.innerHTML = '&nbsp;0';
            minute.innerHTML = '&nbsp;0 : ';


        }
        const lap = () =>{
            const li = document.createElement("li");
            const number = document.createElement("span");
            const timeStamp = document.createElement("span");

            li.setAttribute("class", "lap-item");
            number.setAttribute("class", "number");
            timeStamp.setAttribute("class","time-stamp");
            number.innerText = `#${++lapItem}`;
            timeStamp.innerHTML = `${minCounter} : ${secCounter} : ${centiCounter}`;
            li.append(number, timeStamp);
            laps.append(li);
            clearButton.classList.remove("hidden");
        }
        const clearAll = () =>{
            laps.innerHTML = '';
            laps.append(clearButton);
            clearButton.classList.add("hidden");
            labItem = 0;
        }
        playButton.addEventListener("click", play);
        resetButton.addEventListener("click", reset);
        lapButton.addEventListener("click", lap);
        clearButton.addEventListener("click", clearAll);

    </script>  
</body>
</html>
