
var Module;

if (typeof Module === 'undefined') Module = eval('(function() { try { return Module || {} } catch(e) { return {} } })()');

if (!Module.expectedDataFileDownloads) {
  Module.expectedDataFileDownloads = 0;
  Module.finishedDataFileDownloads = 0;
}
Module.expectedDataFileDownloads++;
(function() {
 var loadPackage = function(metadata) {

  var PACKAGE_PATH;
  if (typeof window === 'object') {
    PACKAGE_PATH = window['encodeURIComponent'](window.location.pathname.toString().substring(0, window.location.pathname.toString().lastIndexOf('/')) + '/');
  } else if (typeof location !== 'undefined') {
      // worker
      PACKAGE_PATH = encodeURIComponent(location.pathname.toString().substring(0, location.pathname.toString().lastIndexOf('/')) + '/');
    } else {
      throw 'using preloaded data can only be done on a web page or in a web worker';
    }
    var PACKAGE_NAME = 'game.data';
    var REMOTE_PACKAGE_BASE = 'game.data';
    if (typeof Module['locateFilePackage'] === 'function' && !Module['locateFile']) {
      Module['locateFile'] = Module['locateFilePackage'];
      Module.printErr('warning: you defined Module.locateFilePackage, that has been renamed to Module.locateFile (using your locateFilePackage for now)');
    }
    var REMOTE_PACKAGE_NAME = typeof Module['locateFile'] === 'function' ?
    Module['locateFile'](REMOTE_PACKAGE_BASE) :
    ((Module['filePackagePrefixURL'] || '') + REMOTE_PACKAGE_BASE);

    var REMOTE_PACKAGE_SIZE = metadata.remote_package_size;
    var PACKAGE_UUID = metadata.package_uuid;

    function fetchRemotePackage(packageName, packageSize, callback, errback) {
      var xhr = new XMLHttpRequest();
      xhr.open('GET', packageName, true);
      xhr.responseType = 'arraybuffer';
      xhr.onprogress = function(event) {
        var url = packageName;
        var size = packageSize;
        if (event.total) size = event.total;
        if (event.loaded) {
          if (!xhr.addedTotal) {
            xhr.addedTotal = true;
            if (!Module.dataFileDownloads) Module.dataFileDownloads = {};
            Module.dataFileDownloads[url] = {
              loaded: event.loaded,
              total: size
            };
          } else {
            Module.dataFileDownloads[url].loaded = event.loaded;
          }
          var total = 0;
          var loaded = 0;
          var num = 0;
          for (var download in Module.dataFileDownloads) {
            var data = Module.dataFileDownloads[download];
            total += data.total;
            loaded += data.loaded;
            num++;
          }
          total = Math.ceil(total * Module.expectedDataFileDownloads/num);
          if (Module['setStatus']) Module['setStatus']('Downloading data... (' + loaded + '/' + total + ')');
        } else if (!Module.dataFileDownloads) {
          if (Module['setStatus']) Module['setStatus']('Downloading data...');
        }
      };
      xhr.onerror = function(event) {
        throw new Error("NetworkError for: " + packageName);
      }
      xhr.onload = function(event) {
        if (xhr.status == 200 || xhr.status == 304 || xhr.status == 206 || (xhr.status == 0 && xhr.response)) { // file URLs can return 0
          var packageData = xhr.response;
          callback(packageData);
        } else {
          throw new Error(xhr.statusText + " : " + xhr.responseURL);
        }
      };
      xhr.send(null);
    };

    function handleError(error) {
      console.error('package error:', error);
    };

    function runWithFS() {

      function assert(check, msg) {
        if (!check) throw msg + new Error().stack;
      }
      Module['FS_createPath']('/', 'fonts', true, true);
      Module['FS_createPath']('/', 'graphics', true, true);
      Module['FS_createPath']('/', 'lib', true, true);
      Module['FS_createPath']('lib', 'knife', true, true);
      Module['FS_createPath']('/', 'sounds', true, true);
      Module['FS_createPath']('/', 'src', true, true);
      Module['FS_createPath']('src', 'entity', true, true);
      Module['FS_createPath']('src', 'facility', true, true);
      Module['FS_createPath']('src', 'game-event', true, true);
      Module['FS_createPath']('src', 'gui', true, true);
      Module['FS_createPath']('src', 'states', true, true);
      Module['FS_createPath']('src/states', 'entity', true, true);
      Module['FS_createPath']('src/states', 'game', true, true);
      Module['FS_createPath']('src/states', 'game-event', true, true);

      function DataRequest(start, end, crunched, audio) {
        this.start = start;
        this.end = end;
        this.crunched = crunched;
        this.audio = audio;
      }
      DataRequest.prototype = {
        requests: {},
        open: function(mode, name) {
          this.name = name;
          this.requests[name] = this;
          Module['addRunDependency']('fp ' + this.name);
        },
        send: function() {},
        onload: function() {
          var byteArray = this.byteArray.subarray(this.start, this.end);

          this.finish(byteArray);

        },
        finish: function(byteArray) {
          var that = this;

        Module['FS_createDataFile'](this.name, null, byteArray, true, true, true); // canOwn this data in the filesystem, it is a slide into the heap that will never change
        Module['removeRunDependency']('fp ' + that.name);

        this.requests[this.name] = null;
      }
    };

    var files = metadata.files;
    for (i = 0; i < files.length; ++i) {
      new DataRequest(files[i].start, files[i].end, files[i].crunched, files[i].audio).open('GET', files[i].filename);
    }


    var indexedDB = window.indexedDB || window.mozIndexedDB || window.webkitIndexedDB || window.msIndexedDB;
    var IDB_RO = "readonly";
    var IDB_RW = "readwrite";
    var DB_NAME = "EM_PRELOAD_CACHE";
    var DB_VERSION = 1;
    var METADATA_STORE_NAME = 'METADATA';
    var PACKAGE_STORE_NAME = 'PACKAGES';
    function openDatabase(callback, errback) {
      try {
        var openRequest = indexedDB.open(DB_NAME, DB_VERSION);
      } catch (e) {
        return errback(e);
      }
      openRequest.onupgradeneeded = function(event) {
        var db = event.target.result;

        if(db.objectStoreNames.contains(PACKAGE_STORE_NAME)) {
          db.deleteObjectStore(PACKAGE_STORE_NAME);
        }
        var packages = db.createObjectStore(PACKAGE_STORE_NAME);

        if(db.objectStoreNames.contains(METADATA_STORE_NAME)) {
          db.deleteObjectStore(METADATA_STORE_NAME);
        }
        var metadata = db.createObjectStore(METADATA_STORE_NAME);
      };
      openRequest.onsuccess = function(event) {
        var db = event.target.result;
        callback(db);
      };
      openRequest.onerror = function(error) {
        errback(error);
      };
    };

    /* Check if there's a cached package, and if so whether it's the latest available */
    function checkCachedPackage(db, packageName, callback, errback) {
      var transaction = db.transaction([METADATA_STORE_NAME], IDB_RO);
      var metadata = transaction.objectStore(METADATA_STORE_NAME);

      var getRequest = metadata.get("metadata/" + packageName);
      getRequest.onsuccess = function(event) {
        var result = event.target.result;
        if (!result) {
          return callback(false);
        } else {
          return callback(PACKAGE_UUID === result.uuid);
        }
      };
      getRequest.onerror = function(error) {
        errback(error);
      };
    };

    function fetchCachedPackage(db, packageName, callback, errback) {
      var transaction = db.transaction([PACKAGE_STORE_NAME], IDB_RO);
      var packages = transaction.objectStore(PACKAGE_STORE_NAME);

      var getRequest = packages.get("package/" + packageName);
      getRequest.onsuccess = function(event) {
        var result = event.target.result;
        callback(result);
      };
      getRequest.onerror = function(error) {
        errback(error);
      };
    };

    function cacheRemotePackage(db, packageName, packageData, packageMeta, callback, errback) {
      var transaction_packages = db.transaction([PACKAGE_STORE_NAME], IDB_RW);
      var packages = transaction_packages.objectStore(PACKAGE_STORE_NAME);

      var putPackageRequest = packages.put(packageData, "package/" + packageName);
      putPackageRequest.onsuccess = function(event) {
        var transaction_metadata = db.transaction([METADATA_STORE_NAME], IDB_RW);
        var metadata = transaction_metadata.objectStore(METADATA_STORE_NAME);
        var putMetadataRequest = metadata.put(packageMeta, "metadata/" + packageName);
        putMetadataRequest.onsuccess = function(event) {
          callback(packageData);
        };
        putMetadataRequest.onerror = function(error) {
          errback(error);
        };
      };
      putPackageRequest.onerror = function(error) {
        errback(error);
      };
    };

    function processPackageData(arrayBuffer) {
      Module.finishedDataFileDownloads++;
      assert(arrayBuffer, 'Loading data file failed.');
      assert(arrayBuffer instanceof ArrayBuffer, 'bad input to processPackageData');
      var byteArray = new Uint8Array(arrayBuffer);
      var curr;

        // copy the entire loaded file into a spot in the heap. Files will refer to slices in that. They cannot be freed though
        // (we may be allocating before malloc is ready, during startup).
        if (Module['SPLIT_MEMORY']) Module.printErr('warning: you should run the file packager with --no-heap-copy when SPLIT_MEMORY is used, otherwise copying into the heap may fail due to the splitting');
        var ptr = Module['getMemory'](byteArray.length);
        Module['HEAPU8'].set(byteArray, ptr);
        DataRequest.prototype.byteArray = Module['HEAPU8'].subarray(ptr, ptr+byteArray.length);

        var files = metadata.files;
        for (i = 0; i < files.length; ++i) {
          DataRequest.prototype.requests[files[i].filename].onload();
        }
        Module['removeRunDependency']('datafile_game.data');

      };
      Module['addRunDependency']('datafile_game.data');

      if (!Module.preloadResults) Module.preloadResults = {};

      function preloadFallback(error) {
        console.error(error);
        console.error('falling back to default preload behavior');
        fetchRemotePackage(REMOTE_PACKAGE_NAME, REMOTE_PACKAGE_SIZE, processPackageData, handleError);
      };

      openDatabase(
        function(db) {
          checkCachedPackage(db, PACKAGE_PATH + PACKAGE_NAME,
            function(useCached) {
              Module.preloadResults[PACKAGE_NAME] = {fromCache: useCached};
              if (useCached) {
                console.info('loading ' + PACKAGE_NAME + ' from cache');
                fetchCachedPackage(db, PACKAGE_PATH + PACKAGE_NAME, processPackageData, preloadFallback);
              } else {
                console.info('loading ' + PACKAGE_NAME + ' from remote');
                fetchRemotePackage(REMOTE_PACKAGE_NAME, REMOTE_PACKAGE_SIZE,
                  function(packageData) {
                    cacheRemotePackage(db, PACKAGE_PATH + PACKAGE_NAME, packageData, {uuid:PACKAGE_UUID}, processPackageData,
                      function(error) {
                        console.error(error);
                        processPackageData(packageData);
                      });
                  }
                  , preloadFallback);
              }
            }
            , preloadFallback);
        }
        , preloadFallback);

      if (Module['setStatus']) Module['setStatus']('Downloading...');

    }
    if (Module['calledRun']) {
      runWithFS();
    } else {
      if (!Module['preRun']) Module['preRun'] = [];
      Module["preRun"].push(runWithFS); // FS is not initialized yet, wait for it
    }

  }
  loadPackage({"package_uuid":"076294e5-2753-4ffb-8452-d7dbb3ef31c7","remote_package_size":34208741,"files":[{"filename":".DS_Store","crunched":0,"start":0,"end":10244,"audio":false},{"filename":"fonts/font.ttf","crunched":0,"start":10244,"end":29736,"audio":false},{"filename":"graphics/.DS_Store","crunched":0,"start":29736,"end":35884,"audio":false},{"filename":"graphics/credit-adamchen.png","crunched":0,"start":35884,"end":522522,"audio":false},{"filename":"graphics/credit-jazorhe.png","crunched":0,"start":522522,"end":985648,"audio":false},{"filename":"graphics/credit-olivia.png","crunched":0,"start":985648,"end":1839457,"audio":false},{"filename":"graphics/credit-rhodadu.png","crunched":0,"start":1839457,"end":2125332,"audio":false},{"filename":"graphics/credit-toothless.png","crunched":0,"start":2125332,"end":2344445,"audio":false},{"filename":"graphics/cursor.png","crunched":0,"start":2344445,"end":2344663,"audio":false},{"filename":"graphics/earth.png","crunched":0,"start":2344663,"end":2532750,"audio":false},{"filename":"graphics/galaxy.png","crunched":0,"start":2532750,"end":2557696,"audio":false},{"filename":"graphics/game-icon.png","crunched":0,"start":2557696,"end":2567202,"audio":false},{"filename":"graphics/particle.png","crunched":0,"start":2567202,"end":2567352,"audio":false},{"filename":"graphics/purple-background.png","crunched":0,"start":2567352,"end":2598803,"audio":false},{"filename":"graphics/purple-logo.png","crunched":0,"start":2598803,"end":2606735,"audio":false},{"filename":"graphics/purple.png","crunched":0,"start":2606735,"end":2710277,"audio":false},{"filename":"graphics/purple6.png","crunched":0,"start":2710277,"end":2904516,"audio":false},{"filename":"graphics/purple_assets.png","crunched":0,"start":2904516,"end":3007945,"audio":false},{"filename":"graphics/yellow-background.png","crunched":0,"start":3007945,"end":3041297,"audio":false},{"filename":"graphics/yellow-logo.png","crunched":0,"start":3041297,"end":3043735,"audio":false},{"filename":"graphics/yellow.png","crunched":0,"start":3043735,"end":3159996,"audio":false},{"filename":"graphics/yellow6.png","crunched":0,"start":3159996,"end":3228192,"audio":false},{"filename":"lib/class.lua","crunched":0,"start":3228192,"end":3231258,"audio":false},{"filename":"lib/knife/base.lua","crunched":0,"start":3231258,"end":3231678,"audio":false},{"filename":"lib/knife/behavior.lua","crunched":0,"start":3231678,"end":3233490,"audio":false},{"filename":"lib/knife/bind.lua","crunched":0,"start":3233490,"end":3234257,"audio":false},{"filename":"lib/knife/chain.lua","crunched":0,"start":3234257,"end":3234982,"audio":false},{"filename":"lib/knife/convoke.lua","crunched":0,"start":3234982,"end":3236300,"audio":false},{"filename":"lib/knife/event.lua","crunched":0,"start":3236300,"end":3238749,"audio":false},{"filename":"lib/knife/gun.lua","crunched":0,"start":3238749,"end":3238780,"audio":false},{"filename":"lib/knife/memoize.lua","crunched":0,"start":3238780,"end":3240741,"audio":false},{"filename":"lib/knife/serialize.lua","crunched":0,"start":3240741,"end":3243075,"audio":false},{"filename":"lib/knife/system.lua","crunched":0,"start":3243075,"end":3245239,"audio":false},{"filename":"lib/knife/test.lua","crunched":0,"start":3245239,"end":3248734,"audio":false},{"filename":"lib/knife/timer.lua","crunched":0,"start":3248734,"end":3253617,"audio":false},{"filename":"lib/push.lua","crunched":0,"start":3253617,"end":3262559,"audio":false},{"filename":"main.lua","crunched":0,"start":3262559,"end":3265698,"audio":false},{"filename":"moon-heist.love","crunched":0,"start":3265698,"end":19837403,"audio":false},{"filename":"sounds/.DS_Store","crunched":0,"start":19837403,"end":19843551,"audio":false},{"filename":"sounds/bell.wav","crunched":0,"start":19843551,"end":19918105,"audio":true},{"filename":"sounds/blip.wav","crunched":0,"start":19918105,"end":19951359,"audio":true},{"filename":"sounds/error.wav","crunched":0,"start":19951359,"end":19961547,"audio":true},{"filename":"sounds/levelup.wav","crunched":0,"start":19961547,"end":19999101,"audio":true},{"filename":"sounds/moon-gate-dark.mp3","crunched":0,"start":19999101,"end":21382210,"audio":true},{"filename":"sounds/moon-gate.wav","crunched":0,"start":21382210,"end":31462288,"audio":true},{"filename":"sounds/moon-theme.mp3","crunched":0,"start":31462288,"end":33276104,"audio":true},{"filename":"sounds/moon-victory.mp3","crunched":0,"start":33276104,"end":33977731,"audio":true},{"filename":"src/.DS_Store","crunched":0,"start":33977731,"end":33983879,"audio":false},{"filename":"src/Animation.lua","crunched":0,"start":33983879,"end":33985078,"audio":false},{"filename":"src/Dependencies.lua","crunched":0,"start":33985078,"end":33989500,"audio":false},{"filename":"src/Side.lua","crunched":0,"start":33989500,"end":33997050,"audio":false},{"filename":"src/Sky.lua","crunched":0,"start":33997050,"end":33998988,"audio":false},{"filename":"src/StateMachine.lua","crunched":0,"start":33998988,"end":33999848,"audio":false},{"filename":"src/Util.lua","crunched":0,"start":33999848,"end":34002628,"audio":false},{"filename":"src/constants.lua","crunched":0,"start":34002628,"end":34006519,"audio":false},{"filename":"src/entity/Entity.lua","crunched":0,"start":34006519,"end":34007701,"audio":false},{"filename":"src/entity/entity_defs.lua","crunched":0,"start":34007701,"end":34008476,"audio":false},{"filename":"src/facility/Facility.lua","crunched":0,"start":34008476,"end":34022392,"audio":false},{"filename":"src/facility/facility_defs.lua","crunched":0,"start":34022392,"end":34079048,"audio":false},{"filename":"src/game-event/GameEvent.lua","crunched":0,"start":34079048,"end":34080272,"audio":false},{"filename":"src/game-event/gameevent_defs.lua","crunched":0,"start":34080272,"end":34124061,"audio":false},{"filename":"src/gui/Button.lua","crunched":0,"start":34124061,"end":34126358,"audio":false},{"filename":"src/gui/DisplayPanel.lua","crunched":0,"start":34126358,"end":34132805,"audio":false},{"filename":"src/gui/Menu.lua","crunched":0,"start":34132805,"end":34133302,"audio":false},{"filename":"src/gui/Panel.lua","crunched":0,"start":34133302,"end":34134001,"audio":false},{"filename":"src/gui/ProgressBar.lua","crunched":0,"start":34134001,"end":34135018,"audio":false},{"filename":"src/gui/Selection.lua","crunched":0,"start":34135018,"end":34137732,"audio":false},{"filename":"src/gui/Textbox.lua","crunched":0,"start":34137732,"end":34140488,"audio":false},{"filename":"src/states/BaseState.lua","crunched":0,"start":34140488,"end":34141185,"audio":false},{"filename":"src/states/StateStack.lua","crunched":0,"start":34141185,"end":34141787,"audio":false},{"filename":"src/states/entity/EntityBaseState.lua","crunched":0,"start":34141787,"end":34142288,"audio":false},{"filename":"src/states/entity/EntityIdleState.lua","crunched":0,"start":34142288,"end":34142898,"audio":false},{"filename":"src/states/entity/EntityWalkState.lua","crunched":0,"start":34142898,"end":34144694,"audio":false},{"filename":"src/states/entity/PlayerIdleState.lua","crunched":0,"start":34144694,"end":34145370,"audio":false},{"filename":"src/states/entity/PlayerWalkState.lua","crunched":0,"start":34145370,"end":34147041,"audio":false},{"filename":"src/states/game/CreditsState.lua","crunched":0,"start":34147041,"end":34150519,"audio":false},{"filename":"src/states/game/DebugOptionsState.lua","crunched":0,"start":34150519,"end":34151911,"audio":false},{"filename":"src/states/game/DialogueState.lua","crunched":0,"start":34151911,"end":34152725,"audio":false},{"filename":"src/states/game/FadeInState.lua","crunched":0,"start":34152725,"end":34153405,"audio":false},{"filename":"src/states/game/FadeOutState.lua","crunched":0,"start":34153405,"end":34154090,"audio":false},{"filename":"src/states/game/GameEventDisplayState.lua","crunched":0,"start":34154090,"end":34154563,"audio":false},{"filename":"src/states/game/GameOverState.lua","crunched":0,"start":34154563,"end":34155747,"audio":false},{"filename":"src/states/game/NewTurnTransitionState.lua","crunched":0,"start":34155747,"end":34158844,"audio":false},{"filename":"src/states/game/PauseState.lua","crunched":0,"start":34158844,"end":34160129,"audio":false},{"filename":"src/states/game/PlayState.lua","crunched":0,"start":34160129,"end":34177478,"audio":false},{"filename":"src/states/game/PurpleEndingState.lua","crunched":0,"start":34177478,"end":34178898,"audio":false},{"filename":"src/states/game/StartState.lua","crunched":0,"start":34178898,"end":34185355,"audio":false},{"filename":"src/states/game/TutorialState.lua","crunched":0,"start":34185355,"end":34186732,"audio":false},{"filename":"src/states/game/YellowEndingState.lua","crunched":0,"start":34186732,"end":34188143,"audio":false},{"filename":"src/states/game/tutorial_defs.lua","crunched":0,"start":34188143,"end":34201638,"audio":false},{"filename":"src/states/game-event/GameEventBaseState.lua","crunched":0,"start":34201638,"end":34201871,"audio":false},{"filename":"src/states/game-event/GameEventEncounterState.lua","crunched":0,"start":34201871,"end":34205299,"audio":false},{"filename":"src/states/game-event/GameEventPassedState.lua","crunched":0,"start":34205299,"end":34205623,"audio":false},{"filename":"src/states/game-event/GameEventPlannedState.lua","crunched":0,"start":34205623,"end":34205954,"audio":false},{"filename":"src/states/game-event/GameEventProgressingState.lua","crunched":0,"start":34205954,"end":34206313,"audio":false},{"filename":"src/states/game-event/GameEventResolveState.lua","crunched":0,"start":34206313,"end":34208741,"audio":false}]});

})();
