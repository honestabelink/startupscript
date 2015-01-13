$(top).on('stonehearthReady', function (cc) {

      App.shellView.addView(App.StonehearthLoadingScreenView);
      var seed =   1234567978;

      radiant.call('stonehearth:new_game', 1, 1, seed, {enable_enemies : false})
            .done(function(e) {
               var map = e.map;

               var x, y;
               do {
                  x = Math.floor(Math.random() * map[0].length);
                  y = Math.floor(Math.random() * map.length);
               } while (map[y][x].terrain_code.indexOf('plains') != 0);

               radiant.call('stonehearth:generate_start_location', 0, 0, e.map_info);

               radiant.call('stonehearth:get_world_generation_progress')
                  .done(function(o) {
                     self.trace = radiant.trace(o.tracker)
                        .progress(function(result) {
                           if (result.progress == 100)
                           {
                              setTimeout(function () {
                                 App.gameView._addViews(App.gameView.views.complete);
                                 App.gameView.getView(App.StonehearthCreateCampView)._hideBanner();
                                 App.gameView.getView(App.StonehearthCreateCampView).destroy();
                                 
                              }, 500);
                           }
                         })
               }); 
            })
            .fail(function(e) {
               console.error('new_game failed:', e)
            });
    }
);

