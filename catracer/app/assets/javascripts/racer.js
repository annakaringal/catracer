$(document).ready( function(){
  var p1 = {
    className: '.one',
    pos: 1
  }, p2 = {
    className: '.two',
    pos: 1
  }
  p1.name = $(p1.className).data().playerName
  p2.name = $(p2.className).data().playerName
  finishPos = $('.one > .pos').length
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
      $(winner.className).addClass('winner');
      $.ajax ({
        url: '/games/' + $('.racetrack').data().gameId,
        method: 'put',
        data: {winner_name: winner.name},
        dataType: 'json'
      })
      .done (function(response){
        $('.racetrack').append(response.message);
      })
      .fail (function(error){
        console.log(error, "errorrrr!!!")
      })

    }
  });

});

var updatePlayerPosition = function(player){
  var currentPos = $(player.className + ' > .active');
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
