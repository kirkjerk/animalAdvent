$raw = <<__EOQ__;
snake
spider
bug
chick
turtle
mice
crow
pelican
frog
crab
bat
dachshhund
shaggydog
pig
elephant
deer
fish
octopus
whale
monkey
gorilla
giraffe
alligator
dragon
santa
__EOQ__
$off = 0;


$daynum = 1;
foreach $puppet (split(/\n/,$raw)){
    print '<div data-puppet="'.$puppet.'" class="day day'.$daynum.' locked '.$puppet.'"><div class="daymark">'.$daynum.'</div><div class="img active"></div><div class="img inactive"></div><div class="img seen"></div></div>'."\n";
    $daynum++;
}
exit;
foreach $puppet (split(/\n/,$raw)){
    
    print ".img.".$puppet.".active{\n";
    print "       background-position: 0px ".$off."px\n";
    print "}\n";
$off -= 160;
    print ".img.".$puppet.".inactive{\n";
    print "       background-position: 0px ".$off."px\n";
    print "}\n";
$off -= 160;
    print ".img.".$puppet.".seen{\n";
    print "       background-position: 0px ".$off."px\n";
    print "}\n";
    $off -= 160;

}