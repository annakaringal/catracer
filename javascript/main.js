$(document).ready( function(){
  var p1 = {
    name: 'one',
    pos: 1
  }, p2 = {
    name: 'two',
    pos: 1
  }
  finishPos = 10;
  currentPlayer = null;

  $(document).on('keyup', function(event) {
    winner = raceWon([p1,p2]);
    if (!winner){
        // Player 1 - P key | Player 2 - Q key
        if (event.keyCode == 80 ){ currentPlayer = p1; }
        if (event.keyCode == 81){ currentPlayer = p2; }
        currentPlayer.pos++;
        updatePlayerPosition(currentPlayer);
    }
    else {
        $('.' + winner.name).addClass('winner');
    }
  });

});

var updatePlayerPosition = function(player){
  var currentPos = $('.' + player.name + ' > .active');
  currentPos.removeClass('active');
  currentPos.next().addClass('active');
}

var raceWon = function(playersArray){
  for (var i = 0; i < playersArray.length; i++){
    if (playersArray[i].pos >= finishPos) {
      return playersArray[i];
    }
  }
  return null;
}
