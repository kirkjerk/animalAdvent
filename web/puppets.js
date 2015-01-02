var puppetMaster = (function(){
    
    var puppetsOpened = {};

    function activateHeaderBirdGif(){
        setTimeout(shakeThatTailFeather,Math.random() * 10000);
    }
    function shakeThatTailFeather(){
        var bird = document.getElementById("bird");
        bird.src = 'img/shakeATailFeather.gif';
        setTimeout(shakeThatTailFeather,Math.random() * 20000);
    }
    //start off unlocking
    function initialUnlock(){
        //reset all days
        $(".day").removeClass("today").removeClass("unlocked").addClass("locked");
        //we unlock everything if it's not December, otherwise unlock up to the day
        var maxDay = 25;
        var now = new Date();
        if(now.getMonth() + 1 == 12){
            maxDay = now.getDate();
        }
        
        unlockDay(1, maxDay)
    }
    
    function unlockDay(day, target){
        if(day > 25) return;
            var jqo = $(".day"+day);
            if(day <= target){
                jqo.removeClass("locked");
                jqo.addClass("unlocked");
            }
            var puppet = jqo.attr("data-puppet");              
            if(day == target){
                    jqo.addClass("today");  
            }            
            if(puppetsOpened[puppet]){ //if it was seen
                showDayAsPuppetNotSymbols(jqo);
            }
            
            setTimeout(function() {unlockDay(day+1,target);},1000 / target);
    }
    
    function showDayAsPuppetNotSymbols(jqo){
        jqo.removeClass("unlocked").removeClass("locked").addClass("seen");;
        jqo.find(".img").hide();
        jqo.find(".img.seen").fadeIn();
        jqo.find(".daymark").empty();
    }
    
    var lastDayClickedJqo;
    function clickDay(){
        var jqo = $(this);
        lastDayClickedJqo = jqo;
        if(jqo.hasClass("unlocked") || jqo.hasClass("seen")  ){
            jqo.addClass("picked").removeClass("unpicked");
            var puppet = jqo.attr("data-puppet");            
            $("#puppetframe").attr("src","puppet.html?puppet="+puppet);
            $('#dialog').jqmShow();
            recordPreviouslyOpened(puppet);
        } 
    }

    function closePuppetModal(hash){
        hash.w.hide()&& hash.o && hash.o.remove(); //clean up jqmodal
        $("#puppetframe").attr("src","blank.html"); //empty contents
        $(".day").removeClass("picked").addClass("unpicked");
        showDayAsPuppetNotSymbols(lastDayClickedJqo);
        return true;
    }    
    
    function init(){        
        activateHeaderBirdGif();
        //$("#daypick").change(function(){ unlock($("#daypick").val());}); //former preview thing
        $(".advcal .day").click(clickDay).addClass("unpicked"); //for all the days, make clickable, and then not picked (picked is currently open)
        loadPreviouslyOpened();
        initialUnlock();
        $('#dialog').jqm({onHide:closePuppetModal});
        //preload the buttom close image
        var closePreload = new Image();
        closePreload.src = "img/close_on.png";
        
    }

    function loadPreviouslyOpened(){
        var read = localStorage.getItem("advent_puppets");
        if(read != undefined){
            puppetsOpened = JSON.parse(read);
        }
    }
    function recordPreviouslyOpened(puppet){
        puppetsOpened[puppet] = true;
        localStorage.setItem("advent_puppets",JSON.stringify(puppetsOpened));
    }
        
   $(document).ready(init);   
}());