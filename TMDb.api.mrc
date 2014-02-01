/*
**********************************************************************************************************************
** * ************************************************************************************************************ * **
** * The Movie Database mIRC API Wrapper  * _/_/_/_/_/  _/   _/    _/_/_/   _/                _/    _/_/_/ _/_/_/ * **
** * Written by ProIcons                  *    _/     _/_/ _/_/   _/   _/  _/               _/_/   _/  _/   _/    * **
** * Version: 1.0.0-Alpha                 *   _/     _/ _/_/ _/  _/    _/ _/_/_/_/  _/_/  _/  _/  _/_/_/   _/     * **
** * API Version: 3                       *  _/    _/   _/  _/  _/   _/  _/    _/       _/_/_/_/ _/       _/      * **
** * TDMb API                             * _/    _/       _/  _/_/_/   _/_/_/_/       _/    _/ _/     _/_/_/     * **
** * ************************************************************************************************************ * **
** * themoviedb.org is a free and community maintained movie database.                                            * **
** * It's completely user built by people like you. TMDb is currently                                             * **
** * used by millions of people every month and with our and powerful                                             * **
** * API, also used by many popular media centers like XBMC, Plex,                                                * **
** * MythTV and MediaPortal.                                                                                      * **
** *                                                                                                              * **
** * API is available for everyone to use, including commercial users.                                            * **
** * A TMDb user account is required to request an API key. Commercial                                            * **
** * users are approved on a per application basis. As always, you must                                           * **
** * attribute TMDb as the source of your data. Please be sure to read                                            * **
** * the API FAQ (http://www.themoviedb.org/faq/api).                                                             * **
** *                                                                                                              * **
** * Terms of Use                                                                                                 * **
** * By using this API you are agreeing to the terms of use. You can read it here.                                * **
** * https://www.themoviedb.org/about/api-terms                                                                   * **
** *                                                                                                              * **
** * Forums: http://www.themoviedb.org/talk                                                                       * **
** *                                                                                                              * **
** * Libraries and Wrappers:                                                                                      * **
** * - ActionScript   ( by swagger     ) https://github.com/swagnag/TheMovieDatabaseAS3                           * **
** * - C#.Net         ( by watway      ) http://wattmdb.codeplex.com/                                             * **
** * - C#.Net         ( by asnoek      ) https://github.com/Fishes/TMDbWrapper                                    * **
** * - C#.Net         ( by LordMike    ) https://github.com/LordMike/TMDbLib                                      * **
** * - Haskell        ( by Peter Jones ) http://hackage.haskell.org/package/themoviedb                            * **
** * - Java/Clojure   ( by runexec     ) https://github.com/runexec/Moov                                          * **
** * - Java           ( by Omertron    ) https://github.com/Omertron/api-themoviedb                               * **
** * - Node.js        ( by raqqa       ) https://github.com/raqqa/node-tmdb                                       * **
** * - Node.js        ( by danzajdband ) https://github.com/danzajdband/moviedb                                   * **
** * - Perl           ( by mithun      ) https://metacpan.org/release/TMDB                                        * **
** * - Perl           ( by MariaB      ) http://search.cpan.org/~mariab/                                          * **
** * - PHP            ( by glamorous   ) https://github.com/glamorous/TMDb-PHP-API                                * **
** * - PHP            ( by pixelead0   ) https://github.com/pixelead0/tmdb_v3-PHP-API-                            * **
** * - PHP            ( by kirboogh    ) https://github.com/kriboogh/TMDB4PHP                                     * **
** * - Python         ( by wagner      ) https://github.com/wagnerrp/pytmdb3/tree/master/tmdb3                    * **
** * - Python         ( by doganaydin  ) https://github.com/doganaydin/themoviedb                                 * **
** * - Ruby           ( by ahmetabdi   ) https://github.com/ahmetabdi/themoviedb                                  * **
** * - Ruby           ( by iriomk      ) https://github.com/Irio/ruby-tmdb                                        * **
** *                                                                                                              * **
** * - mIRC           ( by ProIcons    ) http://www.hawkee.com/snippet/10108/                                                                         * **
** *                                                                                                              * **
** *                                                                                                              * **
** * Requirements                                                                                                 * **
** * - $json_utf8           by ProIcons   (included)                                                              * **
** * - URL Encode           by ZigWap     (included)                                                              * **
** * - mIRC Version 6.35+                                                                                         * **
** * - TMDb API-key                                                                                               * **
** *                                                                                                              * **
** * Known Bugs:                                                                                                  * **
** * - Some instability has been noticed in the long page results. The last socket seems to load faster           * **
** *   than the previous and begin process without them. In the next update a rebuild of the page loading         * **
** *   system will be made , that will load the next page whenever the previous is finished.                      * **
** *                                                                                                              * **
** * Version                                                                                                      * **
** * - v1.0.0                                                                                                     * **
** *  * Initial Release                                                                                           * **
** *                                                                                                              * **
** * Available Methods                                                                                            * **
** * - All method are listed here. Everything is documentated. Optional Parameteres                               * **
** *   are between brackets []. Also look into the TMDb-documentation for better                                  * **
** *   understanding of the possible methods.                                                                     * **
** *                                                                                                              * **
** * Basic Command Concept:                                                                                       * **
** * - /tmdb <method> [-cpaiyrqdls] [ <callback> [<cbheader> <cbfooter>] ] [page] [is_for_adults] [year]          * **
** *                  [primary_release_year] [custom callback arguments variable] [cache] <query>                 * **
** *                                                                                                              * **
** * - $tmdb([<query>]).method(<method>)[.page(<page>).adults(<true/false>).year(<year>).release_year(<year>)     * **
** *                  .language(<lang>).secure().cache().callback(<callback alias>).cbheader(<cbheader>)          * **
** *                  .cbfooter(<cbfooter>)]                                                                      * **
** * -> Methods :                                                                                                 * **
** *    - search/movie                                                                                            * **
** *      - Searches for movies based on your query. Displays 20 Results per Page.                                * **
** *      - Available Switches are: -cpayrq                                                                       * **
** *        * Switch -c [ <callback> [<cbheader> <cbfooter>] ]                                                    * **
** *        * Switch -p [ page (integer) ]                                                                        * **
** *        * Switch -a [ is_for_adults ( true / false ) ]                                                        * **
** *        * Switch -y [ year (integer) ]                                                                        * **
** *        * Switch -r [ primary_release_year ]                                                                  * **
** *        * Switch -q [ custom_callback_arguments_variable (valid variable) ].                                  * **
** *                                                                                                              * **
** *    - search/collection                                                                                       * **
** *      - Searches for movie collections based on your query. Displays 20 Results per Page.                     * **
** *      - Available Switches are: -cpq                                                                          * **
** *        * Switch -c [ <callback> [<cbheader> <cbfooter>] ]                                                    * **
** *        * Switch -p [ page (integer) ]                                                                        * **
** *        * Switch -q [ custom_callback_arguments_variable (valid variable) ].                                  * **
** *                                                                                                              * **
** *    - search/person                                                                                           * **
** *      - Searches for actors/actreess based on your query. Displays 20 Results per Page.                       * **
** *      - Available Switches are: -cpaq                                                                         * **
** *        * Switch -c [ <callback> [<cbheader> <cbfooter>] ]                                                    * **
** *        * Switch -p [ page (integer) ]                                                                        * **
** *        * Switch -a [ is_for_adults ( true / false ) ]                                                        * **
** *        * Switch -q [ custom_callback_arguments_variable (valid variable) ].                                  * **
** *                                                                                                              * **
** *    - search/company                                                                                          * **
** *      - Searches for production companies based on your query. Displays 20 Results per Page.                  * **
** *      - Available Switches are: -cpq                                                                          * **
** *        * Switch -c [ <callback> [<cbheader> <cbfooter>] ]                                                    * **
** *        * Switch -p [ page (integer) ]                                                                        * **
** *        * Switch -q [ custom_callback_arguments_variable (valid variable) ].                                  * **
** *                                                                                                              * **
** *    - search/keyword                                                                                          * **
** *      - Searches for movie keywords based on your query. Displays 20 Results per Page.                        * **
** *      - Available Switches are: -cpaq                                                                         * **
** *        * Switch -c [ <callback> [<cbheader> <cbfooter>] ]                                                    * **
** *        * Switch -p [ page (integer) ]                                                                        * **
** *        * Switch -q [ custom_callback_arguments_variable (valid variable) ].                                  * **
** *                                                                                                              * **
** *    - genre/list                                                                                              * **
** *      - Displays all movies genres.                                                                           * **
** *      - Available Switches are: -cq                                                                           * **
** *        * Switch -c [ <callback> [<cbheader> <cbfooter>] ]                                                    * **
** *        * Switch -q [ custom_callback_arguments_variable (valid variable) ].                                  * **
** *                                                                                                              * **
** *    - clearcache                                                                                              * **
** *      - Clears the database cache.                                                                            * **
** *                                                                                                              * **
** *    - configuration                                                                                           * **
** *      - Gets the API's Configuration                                                                          * **
** *                                                                                                              * **
** *    - movie/{id}                                                                                              * **
** *      - Displays the full info of a movie. Plus casts , alternative_titles , images , keywords , releases     * **
** *        trailers , translations , similar_movies                                                              * **
** *      - Available Switches are: -cld                                                                          * **
** *        * Switch -c [ <callback> [<cbheader> <cbfooter>] ]                                                    * **
** *        * Switch -l [ language ]                                                                              * **
** *        * Switch -d                                                                                           * **
** *                                                                                                              * **
** *      - Accepts a valid INTEGER number, or a VALID IMDb ID.                                                   * **
** *                                                                                                              * **
** *    - movie/latest                                                                                            * **
** *      - Get the latest movie added to the database.                                                           * **
** *      - Available Switches are: -c                                                                            * **
** *                                                                                                              * **
** *    - movie/upcoming                                                                                          * **
** *      - Get the list of upcoming movies. This list refreshes every day.                                       * **
** *      - Available Switches are: -pc                                                                           * **
** *                                                                                                              * **
** *    - movie/now_playing                                                                                       * **
** *      - Get the list of movies playing in theatres. This list refreshes every day.                            * **
** *      - Available Switches are: -pc                                                                           * **
** *                                                                                                              * **
** *    - movie/popular                                                                                           * **
** *      - Get the list of popular movies on The Movie Database. This list refreshes every day.                  * **
** *      - Available Switches are: -pc                                                                           * **
** *                                                                                                              * **
** *    - movie/top_rated                                                                                         * **
** *      - Get the list of top rated movies. By default, this list will only include movies that have 10 or more * **
** *        votes. This list refreshes every day.                                                                 * **
** *      - Available Switches are: -pc                                                                           * **
** *                                                                                                              * **
** *    - person/{id}                                                                                             * **
** *      - Displays the full info of an actor/actress. Plus combined_credits,images,changes                      * **
** *      - Available Switches are: -cd                                                                           * **
** *                                                                                                              * **
** *    - person/latest                                                                                           * **
** *      - Get the latest person added to the database.                                                          * **
** *      - Available Switches are: -c                                                                            * **
** *                                                                                                              * **
** *    - person/popular                                                                                          * **
** *      - Get the list of popular actors on The Movie Database. This list refreshes every day.                  * **
** *      - Available Switches are: -pc                                                                           * **
** *                                                                                                              * **
** *    - list/{id}                                                                                               * **
** *      - Get the selected list of movies that a user has created.                                              * **
** *      - Available Switches are: -cd                                                                           * **
** *                                                                                                              * **
** *    - collection/{id}                                                                                         * **
** *      - Get the selected collection of movies. In movie query check for belongs_to_collection attribute.      * **
** *      - Available Switches are: -cd                                                                           * **
** *                                                                                                              * **
** *    - validate                                                                                                * **
** *      - validates your api-key that is stored in %_tmdb_api_key variable                                      * **
** *      - Available Switches are: -c                                                                            * **
** *                                                                                                              * **
** * -> Switches :                                                                                                * **
** *     Switches are in highly restricted order like it shown in the comand.                                     * **
** *     You CANNOT change the order of the arguments passed in ths command.                                      * **
** *     Example:                                                                                                 * **
** *                                                                                                              * **
** *     (valid)   /tmdb search/movie -cp callback_function 1 Movie                                               * **
** *     (valid)   /tmdb search/mvoie -cp callback_function callback_header callback_footer 1 Movie               * **
** *     (invalid) /tmdb search/movie -pc 1 callback_function Movie                                               * **
** *     (invalid) /tmdb search/movie -pc 1 callback_function callback_header callback_footer Movie               * **
** *     (valid)   /tmdb search/movie -pc callback_function 1 Movie.                                              * **
** *                                                                                                              * **
** *     (valid)   //echo -a $tmdb(Movie).method(search/movie).callback(function).page(1)                         * **
** *     (valid)   //echo -a $tmdb(Movie).method(search/movie).callback(function).cbheader(h).cbfooter(f).page(1) * **
** *     (invalid) //echo -a $tmdb().method(search/movie).movie(Movie).callback(function).page(1)                 * **
** *     (valid)   //echo -a $tmdb().method(genre/list)                                                           * **
** *                                                                                                              * **
** *     No matter how the switches are arranged in the /alias mode. Their OPTIONS are highly restricted in their * **
** *     position as deomnstrated in our default command.                                                         * **
** *                                                                                                              * **
** *     * Switch      : -c [ <callback> [<cbheader> <cbfooter>] ]                                                * **
** *     * Object Call : .callback(<callback>) [.cbheader([<cbheader>]) .cbfooter([<cbfooter>])]                  * **
** *       - defines a default callback alias that all the results will be parsed on it                           * **
** *            also you can define an alias right before the call of the callback alias and                      * **
** *            an alias right after the call of the callback.                                                    * **
** *            Be NOTICED. if you define a <cbheader> you MUST also define a <cbfooter>.                         * **
** *            if you DON't want footer but you want header you can define alias for footer                      * **
** *            _tmdb_void , or for header in the opossite case.                                                  * **
** *            Every callback alias must have in the first line this:                                            * **
** *                                                                                                              * **
** *            if ($isid) return $true .                                                                         * **
** *                                                                                                              * **
** *            So its basic form will be something like:                                                         * **
** *                                                                                                              * **
** *            alias callback [                                                                                  * **
** *              if ($isid) return $true                                                                         * **
** *              ;..commands...                                                                                  * **
** *            ]                                                                                                 * **
** *                                                                                                              * **
** *            For each method some different arguments are passed into them.                                    * **
** *            you can set the default arguments for each method from the _tmdb_init                             * **
** *            alias or you can add on each query different arguments. See switch -q.                            * **
** *            on the cbheader and cbfooter callbacks some other arguments are passed                            * **
** *                                                                                                              * **
** *            by default the alias that callbacks our query is                                                  * **
** *                                                                                                              * **
** *            alias _tmdb_def_cb [                                                                              * **
** *              if ($isid) return $true                                                                         * **
** *              echo -a [ [ $1- ] ]                                                                             * **
** *            ]                                                                                                 * **
** *                                                                                                              * **
** *            So it echoes all the result on your active window.                                                * **
** *                                                                                                              * **
** *            There are default assigned cbheader, cbfooter aliases in _tmdb_init. You                          * **
** *            can change them to _tmdb_void to print only the result you want.                                  * **
** *            %_tmdb_cb_global @socket @timestart @timeend @totalpages @query @method @url @cmd @timeproces     * **
** *                                                                                                              * **
** *                                                                                                              * **
** *            @socket     : Holds the last socket name of the result of the query we made.For example if there's* **
** *                          a query and it have more than 1 page and less and equal than 20, then it will load  * **
** *                          all pages. So the @socket will hold the name of the last processed socket.          * **
** *            @timestart  : Holds the Unix Time/Ticks that the query started. You can define either ctime/ticks * **
** *                          on its variable on _tmdb_init.                                                      * **
** *            @timeend    : Holds the Unix Time/Ticks that the query finished. You can define either            * **
** *                          ctime/ticks on its variable on _tmdb_init.                                          * **
** *            @totalpages : Holds the totalpages [where supported] of the results.                              * **
** *            @query      : Holds the query we made to the api.                                                 * **
** *            @method     : Holds the method we used to the api.                                                * **
** *            @url        : Holds the final encoded url we queried to get the results.                          * **
** *            @cmd        : Holds the EXACT command we pressed in order these results to be shown.              * **
** *            @timeprocess: Holds the Unix Time/Ticks that the process of the data finished. You can define     * **
** *                          either ctime/ticks on  its variable on _tmdb_init.                                  * **
** *                                                                                                              * **
** *            On the callback headers and footers for the method movie/{id} the commas, are replaced with dots. * **
** *            in the @url.                                                                                      * **
** *                                                                                                              * **
** *            Available Arguments for method:                                                                   * **
** *              - search/movie:                                                                                 * **
** *                @is_for_adults @backdrop_path @id @original_title @release_date @year @poster_path            * **
** *                @popularity @title @vote_average @vote_count                                                  * **
** *                Variable Holds Them: %_tmdb_cb_ms                                                             * **
** *                                                                                                              * **
** *                @is_for_adults : Returns if the movie is nsfw*                                                * **
** *                @backdrop_path : Returns the Backdrop Image Path.                                             * **
** *                @id            : Returns the id of the movie (usefull for full movie query)                   * **
** *                @original_title: Returns the Original Title of the movie                                      * **
** *                @release_date  : Returns the full date that movie released                                    * **
** *                @year          : Returns only the year that movie released                                    * **
** *                @poster_path   : Returns the Poster Image Path.                                               * **
** *                @popularity    : Returns a float number of how much popular the movie is.                     * **
** *                @title         : Returns the title of the movie                                               * **
** *                @vote_average  : Returns the vote average of the movie                                        * **
** *                @vote_count    : Returns the Number of Poeple voted in order vote_average to be calculated.   * **
** *                                                                                                              * **
** *              - search/collection                                                                             * **
** *                @backdrop_path @id @name @poster_path                                                         * **
** *                Variable Holds Them: %_tmdb_cb_cs                                                             * **
** *                @name          : Returns the name of the collection.                                          * **
** *                                                                                                              * **
** *              - search/person                                                                                 * **
** *                @profile_path @id @name @popularity @is_for_adults                                            * **
** *                Variable Holds Them: %_tmdb_cb_ps                                                             * **
** *                @profile_path  : Returns the Profile Image path.                                              * **
** *                                                                                                              * **
** *              - search/company                                                                                * **
** *                @logo_path @id @name                                                                          * **
** *                Variable Holds Them: %_tmdb_cb_os                                                             * **
** *                @logo_path     : Returns the Logo Image Path.                                                 * **
** *                                                                                                              * **
** *              - search/keyword                                                                                * **
** *                @id @name                                                                                     * **
** *                Variable Holds Them: %_tmdb_cb_ks                                                             * **
** *                                                                                                              * **
** *              - genre/list                                                                                    * **
** *                @id @name                                                                                     * **
** *                Variable Holds Them: %_tmdb_cb_gl                                                             * **
** *                                                                                                              * **
** *              - movie/{ID}                                                                                    * **
** *                @jsonfile                                                                                     * **
** *                Theres no variable.                                                                           * **
** *                In this method                                                                                * **
** *                                                                                                              * **
** *            All the callbacks are executed as identifiers, so even there's a whole string on one of your      * **
** *            arguments it  will be parsed normaly as one of $1-oo ..                                           * **
** *                                                                                                              * **
** *     * Switch      : -p [ page ]   (INTEGER)                                                                  * **
** *     * Object Call : .page([page]) (INTEGER)                                                                  * **
** *       - defines in what page query must be done. for example in a query with                                 * **
** *         30 pages you can define the page number you want to see.                                             * **
** *         Be noticed YOU MUST NOT make more than 20 simultaneous connections and                               * **
** *         You MUST NOT make more than 30 requests in 10 seconds.                                               * **
** *         If no switch -p, defined by default this wrapper will return all pages                               * **
** *         of the given query as long they are less or equal than 20.                                           * **
** *         You may not define as a page any NON integer and non positive number.                                * **
** *       - Available options: a valid INTEGER number.                                                           * **
** *                                                                                                              * **
** *     * Switch      : -a                 [ is_for_adults ] (BOOL)                                              * **
** *     * Object Call : .adult(true/false) [ is_for_adults ] (BOOL)                                              * **
** *       - Toggle the inclusion of adult titles.                                                                * **
** *       - Accepted values: true/false.                                                                         * **
** *                                                                                                              * **
** *     * Switch      : -y [ year ]     (INTEGER)                                                                * **
** *     * Object Call : .year([ year ]) (INTEGER)                                                                * **
** *       - ilter the results release dates to matches that include this value.                                  * **
** *       - Accepted values: a valid INTEGER Year.                                                               * **
** *                                                                                                              * **
** *     * Switch      : -r [ primary_release_year ]             (INTEGER)                                        * **
** *     * Object Call : .release_year([ primary_release_year ]) (INTEGER)                                        * **
** *       - Filter the results so that only the primary release dates have this value.                           * **
** *       - Accepted values: a valid INTEGER Year.                                                               * **
** *                                                                                                              * **
** *     * Switch      : -q [ custom_callback_arguments_variable ]         (VARIABLE)                             * **
** *     * Object Call : .variable([ custom_callback_arguments_variable ]) (VARIABLE)                             * **
** *       - by default you can define on the init variables on _tmdb_init the arguments you want                 * **
** *         to pass on each callback for each different method. Though this switchs allows you to                * **
** *         define for a query some other arguments without changing the init function.                          * **
** *         For example you create a variable that holds some arguments                                          * **
** *                                                                                                              * **
** *         %arguments @name @id                                                                                 * **
** *                                                                                                              * **
** *         And then you pass it to the command like this                                                        * **
** *         /tmdb search/person -q arguments Angenina Jolie.                                                     * **
** *         And the new arguments are now passed in our default callback.                                        * **
** *         if you want this with a custom call back it is simple...                                             * **
** *         /tmdb search/person -cq custom_callback arguments Angelina Jolie.                                    * **
** *         And you passed it to your own callback with your own arguments and now                               * **
** *         from your callback you can access them like this: $1 for @name $2 for @id.                           * **
** *                                                                                                              * **
** *     * Switch      : -d                                                                                       * **
** *     * Object Call : .cache()                                                                                 * **
** *       - if you have the variable %_tmdb_cache valued to 2. then it will search for cached content. if it     * **
** *         finds it displays data from there. Otherwise it will get results from the main server and then cache * **
** *         them to your local database.                                                                         * **
** *                                                                                                              * **
** *     * Switch      : -l [ lang ]                                                                              * **
** *     * Object Call : .language([ lang ])                                                                      * **
** *       - Specifies the result's language should the API Server return if this language is supported in the    * **
** *         specific search/get of data.                                                                         * **
** *       - Accepted values: 2char language based on ISO 639-1 Codes:                                            * **
** *                          http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes                                * **
** *                                                                                                              * **
** *     * Switch      : -s                                                                                       * **
** *     * Object Call : .secure()                                                                                * **
** *       - Establish a Secure SSL Connection with the API Server. If ssl fail to load, based on your settings   * **
** *         query will continue in insecure connection or will halt                                              * **
** *                                                                                                              * **
** *                                                                                                              * **
** *                                                                                                              * **
** * Versioning                                                                                                   * **
** *  - For transparency and insight into release cycle, and for striving to maintain backward compatibility,     * **
** *    mIRC TMDb will be maintained under the Semantic Versioning guidelines as much as possible.                * **
** *    Releases will be numbered with the following format:                                                      * **
** *                                                                                                              * **
** *    <major>.<minor>.<patch>                                                                                   * **
** *                                                                                                              * **
** *    And constructed with the following guidelines:                                                            * **
** *    * Breaking backward compatibility bumps the major (and resets the minor and patch)                        * **
** *    * New additions without breaking backward compatibility bumps the minor (and resets the patch)            * **
** *    * Bug fixes and misc changes bumps the patch                                                              * **
** *                                                                                                              * **
** *    For more information on SemVer, please visit http://semver.org/.                                          * **
** *                                                                                                              * **
** *                                                                                                              * **
** * Bug tracker                                                                                                  * **
** *  - Have a bug or a feature request? Post comment here.                                                       * **
** *                                                                                                              * **
** **************************************************************************************************************** **
**********************************************************************************************************************
*/                                                                                                                
on *:start:{ set %_tmdb_api_ver 1.0.0-Alpha | _tmdb_init }                                                                                         
on *:load:{ set %_tmdb_api_ver 1.0.0-Alpha | _tmdb_init }                                                                                          
alias _tmdb_init {                                                                                                
  ;TMDB Api Version (Default: 3)
  set %_tmdb_api_version 3

  ;TMDB API Host (Default: api.themoviedb.org)
  set %_tmdb_api_host api.themoviedb.org

  ;TMDB API Port (Default: 80)
  set %_tmdb_api_port 80

  ;TMDB API Secure Port (Default: 443)
  set %_tmdb_api_secure_port 443

  if (!$exists(tmdb)) .mkdir tmdb
  if (!$exists(tmdb\system)) .mkdir tmdb\system
  if (!$exists(tmdb\temp)) .mkdir tmdb\temp
  if (!$exists(tmdb\db)) .mkdir tmdb\db
  if (!$exists(tmdb\process)) .mkdir tmdb\process 
  if (!$exists(tmdb\images)) .mkdir tmdb\images
}
menu * {
  TMDb
  . $style(2) TheMovieDB API:noop
  . $style(3) Version 1.0.0-Alpha:noop
  .-
  .Setup Wizard:_tmdb_wizard

}
alias _tmdb_wizard {
  var %w = @_TMDb_CommandLine
  var %m aline -p %w
  var %b %m ** *************************************************************************** **
  var %f %m *********************************************************************************
  var %h %m **0,0:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::**
  var %t _tmdb_wizard_input
  var %n _tmdb_wizard_input2 
  if (!$1) {
    window -aBCde0k0w0z +l %w 0 0 688 359 $chr(32) Fixedsys 9

    %f | %b
    %m ** 0,0:_________0,0:0,0:______0,0:0,0:0,0:____0,0:0,0:0,0:0,0:____0,0:0,0:__0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:_0,0:0,0:0,0:0,0:0,0:0,0:0,0:_______0,0:0,0:_____0,0:0,0: **
    %m ** |0,0:0,0:_0,0:0,0:0,0:_0,0:0,0:||_0,0:0,0:0,0:_0,0:`.|_0,0:0,0:0,0:\0,0:0,0:/0,0:0,0:0,0:_|[0,0:0,0:|0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:/0,0:\0,0:0,0:0,0:0,0:0,0:|_0,0:0,0:0,0:__0,0:\|_0,0:0,0:0,0:_|0,0: **
    %m ** |_/0,0:|0,0:|0,0:\_|0,0:0,0:|0,0:|0,0:`.0,0:\0,0:|0,0:0,0:0,0:\/0,0:0,0:0,0:|0,0:0,0:0,0:|0,0:|.--.0,0:0,0:0,0:0,0:0,0:0,0:0,0:/0,0:_0,0:\0,0:0,0:0,0:0,0:0,0:0,0:|0,0:|__)0,0:|0,0:|0,0:|0,0:0,0:0,0: **
    %m ** 0,0:0,0:0,0:0,0:|0,0:|0,0:0,0:0,0:0,0:0,0:0,0:|0,0:|0,0:0,0:|0,0:|0,0:|0,0:|\0,0:0,0:/|0,0:|0,0:0,0:0,0:|0,0:'/'`\0,0:\0,0:0,0:0,0:0,0:/0,0:___0,0:\0,0:0,0:0,0:0,0:0,0:|0,0:0,0:___/0,0:0,0:|0,0:|0,0:0,0:0,0: **
    %m ** 0,0:0,0:0,0:_|0,0:|_0,0:0,0:0,0:0,0:_|0,0:|_.'0,0:/_|0,0:|_\/_|0,0:|_0,0:0,0:|0,0:0,0:\__/0,0:|0,0:0,0:_/0,0:/0,0:0,0:0,0:\0,0:\_0,0:0,0:_|0,0:|_0,0:0,0:0,0:0,0:_|0,0:|_0,0:0,0: **
    %m ** 0,0:0,0:|_____|0,0:0,0:|______.'|_____||_____|[__;.__.'0,0:0,0:|____|0,0:|____||_____|0,0:0,0:|_____|0,0: **
    %h | %b
    %t The Movie Database API - mIRC Setup Wizard
    %t API Version: %_tmdb_api_version
    %b
    %t Do you wish to continue ? [Y/n]
    editbox @_TMDb_CommandLine Y
    set %_tmdb_wizard_step 1
  }
  elseif ($1 == 2) {
    %b
    %t mIRC TMDb API Wrapper Version %_tmdb_api_ver
    %t Developed by: ProIcons a.k.a Nikolas
    %t 0,0::____0,0:0,0:0,0:0,0:0,0:0,0:0,0:_0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:__0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:___0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:_0,0:0,0::::::::::::
    %t 0,0:/0,0:___|0,0:0,0:___|0,0:|_0,0:_0,0:0,0:0,0:_0,0:_0,0:__0,0:0,0:0,0:\0,0:\0,0:0,0:0,0:0,0:0,0:0,0:/0,0:(_)______0,0:_0,0:_0,0:__0,0:__|0,0:|0,0::::::;:::::
    %t 0,0:\___0,0:\0,0:/0,0:_0,0:\0,0:__|0,0:|0,0:|0,0:|0,0:'_0,0:\0,0:0,0:0,0:\0,0:\0,0:/\0,0:/0,0:/|0,0:|_0,0:0,0:/0,0:_`0,0:|0,0:'__/0,0:_`0,0:|0,0::::::::;:::
    %t 0,0:0,0:___)0,0:|0,0:0,0:__/0,0:|_|0,0:|_|0,0:|0,0:|_)0,0:|0,0:0,0:0,0:\0,0:V0,0:0,0:V0,0:/0,0:|0,0:|/0,0:/0,0:(_|0,0:|0,0:|0,0:|0,0:(_|0,0:|0,0:::::::;::::
    %t 0,0:|____/0,0:\___|\__|\__,_|0,0:.__/0,0:0,0:0,0:0,0:0,0:\_/\_/0,0:0,0:|_/___\__,_|_|0,0:0,0:\__,_|0,0::::::;:::::
    %t 0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:|_|0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:0,0:::::::;::::
    %t Before you proceed please read the full manual of this Wrapper.
    %t Understanding how this wrapper works will result to its better
    %t configuration and functionality. If you are newbie please enter
    %t every value this wizard have as default. CHANGE SOMETHING ONLY
    %t if you know what it is doing.
    %t There will be a description for every variable wizard ask you to
    %t define. 
    %h
    %b
    %t Do you wish to continue ? [Y/n]
    editbox @_TMDb_CommandLine Y
    set %_tmdb_wizard_step 2
  }
  elseif ($1 == 3) {
    %b
    %h
    %t Allright Lets Get Started. Care what you choose.
    %h
    %b
    %n 0 0 Wrapper Main Configuration0,0 $str(.,13) $+ 1 $p.bar($1 $+ /32,4|,0.)
    %b
    %h
    %t &_tmdb_api_key (Required)
    %n 4 0 This variable holds your UNIQUE API Key. You must define your
    %n 4 0 api key in order to proceed and in order to make queries to the
    %n 4 0 api server. If you don't have an api key you can request one.
    %n 4 0 Please visit: http://themoviedb.org/ to get an api key.
    %h
    %n 4 0 If you feel uncomfortable to enter like this your api key
    %n 4 0 you can type in the editbox exactly this: [pwd]
    %h
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 3
  }
  elseif ($1 == 4) {
    %b
    %n 0 0 Wrapper Main Configuration0,0 $str(.,13) $+ 1 $p.bar($1 $+ /32,4|,0.)
    %b
    %h
    %t &_tmdb_api_version (Required) (Default: 3)
    %n 4 0 This variable holds API Server's Protocol Version. Its highly 
    %n 4 0 recommanded to leave this to its default value. This Wrapper
    %n 4 0 Does not support any previous version, but it is able to support
    %n 4 0 future versions.
    %h
    %n 4 0 This variable holds float or integer numbers
    %n 4 0 Default: 3
    %h | %h | %h | %h  | %h
    %b
    %t Please Enter your Input:
    .timer -ms 1 100 set %_tmdb_wizard_step 4
    editbox @_TMDb_CommandLine 3
  }
  elseif ($1 == 5) {
    %h
    %t &_tmdb_alert (Required) (Default: abc)
    %n 4 0 This variable holds the Alert Message level of this wrapper.
    %n 4 0 Alerts are separated in 3 categories:
    %n 5 0 * Successes: (c) Actions Wrapper took and succeded.
    %n 5 0 * Warnings: (b) Actions Wrapper took and faced dificulties, still 
    %n 7 0 operated  normal.
    %n 5 0 * Errors: (a) Actions Wrapper took and faced dificulties and halted 
    %n 7 0 its operation.
    %n 4 0 Examples:
    %n 5 1 * (Success) - $+ $color(info) * /tmdb: Cache has been cleared 
    %n 5 1 * (Warning) - $+ $color(info) * /tmdb: SSL Failed to Load. Proceeding with 
    %n 28 1  $+ $color(info) $+ No-Secure connection.
    %n 5 4 * (Error)0,0.. - $+ $color(info) * /tmdb: Socket in use - You are using this command 
    %n 28 1  $+ $color(info) $+ extremely fast.
    %n 4 0 [Error: a][Warning: b][Success: c]
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 5
    editbox @_TMDb_CommandLine abc
  }
  elseif ($1 == 6) {
    %b | %n 0 0 Connection Configuration0,0 $str(.,15) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_isid_socket (Required)
    %n 4 0 This variable defines if Wrapper should use mIRC Sockets
    %n 4 0 or VBScript sockets in order to get the data. With mIRC Sockets
    %n 4 0 you have a non-direct result though it is more handled. With VBscript
    %n 4 0 sockets to store the json files, you have the ability with the 
    %n 4 0 identifier to take the file that downloaded instantly as a return value
    %n 4 0 from identifier. Though VBScript Sockets, are not handled very well.
    %n 4 0 Some bugs may appear during its procedure. Though if you want to test 
    %n 4 0 it and give us your feedback you can use it. (Default: vbsocks)
    %h
    %n 4 0 mIRC Sockets: mircsocks
    %n 4 0 VBScript Sockets: vbsocks
    %h
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 6
    set %_tmdb_wizard_more _tmdb_isid_socket
    editbox @_TMDb_CommandLine vbsocks
  }
  elseif ($1 == 7) {
    %b | %h | %b | %n 0 0 Connection Configuration0,0 $str(.,15) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_ssl (Required)
    %n 4 0 This variable defines if by default establish secure connections
    %n 4 0 to the API Server. (Default: 0)
    %h
    %n 4 0 Use SSL By Default: 1
    %n 4 0 Do not use SSL By Default: 0
    %h | %h | %h | %h | %h | %h | %h 
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 7
    editbox @_TMDb_CommandLine 0
  }

  elseif ($1 == 8) {
    %b | %n 0 0 Connection Configuration0,0 $str(.,15) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_ssl_fail (Required)
    %n 4 0 This variable defines if by default when ssl fails should wrapper
    %n 4 0 stop operation or not. (Default: 0)
    %h
    %n 4 0 Halt Operation when SSL Fails: 1
    %n 4 0 Proceed with Non-Secure connecton when SSL Fails: 0
    %h | %h | %h | %h | %h | %h | %h
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 8
    set %_tmdb_wizard_more _tmdb_ssl_fail
    editbox @_TMDb_CommandLine 0
  }
  elseif ($1 == 9) {
    %b | %h | %b | %n 0 0 Data Processor Configuration0,0 $str(.,11) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_clear_process (Required)
    %n 4 0 This variable defines the time in seconds that the jsons marked for
    %n 4 0 process and moved to folder tmdb/process will be erased. (Default: 5)
    %h | %h | %h | %h | %h | %h | %h | %h | %h | %h 
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 9
    set %_tmdb_wizard_more _tmdb_clear_process
    editbox @_TMDb_CommandLine 5
  }
  elseif ($1 == 10) {
    %b | %h | %b | %t Cache Configuration0,0 $str(.,20) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cache (Required)
    %n 4 0 This variable defines if wrapper must keep cache and when to display
    %n 5 0 results directly from cache. When to keep data to cache and when to 
    %n 5 0 make cache work only with custom switch. (Default: 2) 
    %h
    %n 4 0 Do not use cache: (0)
    %n 4 0 Always search for cache, and when is not present cache available 
    %n 5 0 content on cache. Cache wont work with Searches only with static
    %n 5 0 results: (1)
    %n 4 0 Use cache only with switch -d.: (2)
    %h | %h | %h
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 10
    set %_tmdb_wizard_more _tmdb_cache
    editbox @_TMDb_CommandLine 2
  }
  elseif ($1 == 11) {
    %b | %h | %b | %t Cache Configuration0,0 $str(.,20) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cache_images (Required)
    %n 4 0 This variable defines if wrapper must cache/save images to local 
    %n 4 0 database. This works only when &_tmdb_cache > 0 (Default: 1)
    %h
    %n 4 0 Do not cache images: (0)
    %n 4 0 Cache Images: (1)
    %h | %h | %h | %h | %h | %h | %h
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 11
    set %_tmdb_wizard_more _tmdb_cache_images
    editbox @_TMDb_CommandLine 1
  }
  elseif ($1 == 12) {
    %b | %h | %b | %t Cache Configuration0,0 $str(.,20) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cache_movie (Required)
    %n 4 0 This variable defines if wrapper must cache/save movies to local 
    %n 4 0 database. This works only when &_tmdb_cache > 0 (Default: 1)
    %h
    %n 4 0 Do not cache movies: (0)
    %n 4 0 Cache movies: (1)
    %h | %h | %h | %h | %h | %h | %h
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 12
    set %_tmdb_wizard_more _tmdb_cache_movie
    editbox @_TMDb_CommandLine 1
  }
  elseif ($1 == 13) {
    %b | %h | %b | %t Cache Configuration0,0 $str(.,20) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cache_person (Required)
    %n 4 0 This variable defines if wrapper must cache/save actors to local 
    %n 4 0 database. This works only when &_tmdb_cache > 0 (Default: 1)
    %h
    %n 4 0 Do not cache actors: (0)
    %n 4 0 Cache actors: (1)
    %h | %h | %h | %h | %h | %h | %h
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 13
    set %_tmdb_wizard_more _tmdb_cache_person
    editbox @_TMDb_CommandLine 1
  }
  elseif ($1 == 14) {
    %b | %h | %b | %t Cache Configuration0,0 $str(.,20) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cache_collection (Required)
    %n 4 0 This variable defines if wrapper must cache/save collections to 
    %n 4 0 local database. This works only when &_tmdb_cache > 0 (Default: 1)
    %h
    %n 4 0 Do not cache collections: (0)
    %n 4 0 Cache collections: (1)
    %h | %h | %h | %h | %h | %h | %h
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 14
    set %_tmdb_wizard_more _tmdb_cache_collection
    editbox @_TMDb_CommandLine 1
  }
  elseif ($1 == 15) {
    %b | %h | %b | %t Cache Configuration0,0 $str(.,20) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cache_genre (Required)
    %n 4 0 This variable defines if wrapper must cache/save genre list to
    %n 4 0 local database. This works only when &_tmdb_cache > 0 (Default: 1)
    %h
    %n 4 0 Do not cache genre list: (0)
    %n 4 0 Cache genre list: (1)
    %h | %h | %h | %h | %h | %h | %h
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 15
    set %_tmdb_wizard_more _tmdb_cache_genre
    editbox @_TMDb_CommandLine 1
  }
  elseif ($1 == 16) {
    %b | %h | %b | %t Cache Configuration0,0 $str(.,20) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cache_configuration (Required)
    %n 4 0 This variable defines if wrapper must cache/save api configuration  
    %n 4 0 to local database. This works only when &_tmdb_cache>0 (Default: 1)
    %h
    %n 4 0 Do not cache api configuration: (0)
    %n 4 0 Cache api configuration: (1)
    %h | %h | %h | %h | %h | %h | %h
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 16
    set %_tmdb_wizard_more _tmdb_cache_configuration
    editbox @_TMDb_CommandLine 1
  }
  elseif ($1 == 17) {
    %b | %h | %b | %t Search Configuration0,0 $str(.,19) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_search_allpages (Required)
    %n 4 0 If Search contains more than 1 page, and less or equal than 20 display   
    %n 4 -1 them all at once. *HIGHLY NOT RECOMMANDED!*. Some instability has 
    %n 4 0 been noticed, while last socket loads faster than previous ones and  
    %n 4 0 process of the data is getting interupted and some hash tables are 
    %n 4 0 not getting freed, as a result a lot of memory allocation with no 
    %n 4 0 reason. YOU are able to do this with your simple callback functions 
    %n 4 0 until this function get fixed and rebuilded in a way to prevent this 
    %n 4 0 data loss. (Default: 0)
    %h
    %n 4 0 Do not contain all pages on search: (0)
    %n 4 0 Contain all pages on search: (1)
    %h
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 17
    set %_tmdb_wizard_more _tmdb_search_allpages
    editbox @_TMDb_CommandLine 0
  }
  elseif ($1 == 18) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t Callback is a very important feature of this wrapper. Callback allows you
    %t to take advantage of this wrapper, to process the data of the api, to make
    %t new combined requests to api. To post data to the api, to edit your account
    %t information and much more.
    %h
    %t This section needs extreme attention because everything you choose will 
    %t affect Wrappers behaviour.
    %h
    %t There's a detailed explanation of how this feature works on the manual.
    %t You can find this manual in the first 500 lines of the source code of
    %t this wrapper.
    %t Even this wizard works with TMDb Wrapper Callback functions. In order to
    %t take information and then be able to process it you NEED to use callbacks.
    %b
    %t Do you wish to continue ? [Y/n]
    editbox @_TMDb_CommandLine
    set %_tmdb_wizard_step 18
  }
  elseif ($1 == 19) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t Before you proceed there are some things you have to know.
    %h
    %t There are 3 Types of Callbacks.
    %n 2 0 (1) CallBack header (cbheader):
    %n 4 0 This callback is getting executed right before the execute of the
    %n 4 0 main callback alias.
    %n 2 0 (2) Callback Main (callback):
    %n 4 0 This is the callback that all the data of the api are
    %n 4 0 getting parsed on this.
    %n 2 0 (3) Callback footer (cbfooter):
    %n 4 0 This callback is getting executed right after the execute of the
    %n 4 0 main callback alias.
    %h
    %b
    %t Press "a" to continue.
    editbox @_TMDb_CommandLine a
    set %_tmdb_wizard_step 19
  }
  elseif ($1 == 20) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t The required form of a callback alias:
    %n 2 0 alias callback @
    %n 4 0 if ($isid) @
    %n 6 0 if ($prop == chk) @ return $true ^
    %n 6 0 ;Some Commands you want.
    %n 6 0 ;API's data are getting parsed on !1-
    %n 4 0 ^
    %n 2 0 ^
    %t This is mainly required in order the wrapper to determine
    %t whether you are using a valid callback or not, in order
    %t to not halt its proceedure if it finds an invalid alias.
    %t All aliases must be in this type. Main Header and Footer.
    %h 
    %b
    %t Press "a" to continue.
    editbox @_TMDb_CommandLine a
    set %_tmdb_wizard_step 20
  }
  elseif ($1 == 21) {
    var %_tmdb_wizard_resized 1
    window -a +l @_TMDb_CommandLine -1 -1 688 392
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t We have some default functions you may use on the callbacks.
    %h
    %t First of all. If you use except main callback function one more like
    %t cbheader , IT IS REQUIRED to use cbfooter aswell and the opposite.
    %t In any case you don't want to use one of them, as the alias
    %t you can define the predefined alias: _tmdb_void.  As it's name sais,
    %t it voids everything pass into it. There's no process there.
    %h
    %t For each differnet method some different argumenets are getting
    %t parsed in the callbacks. You will set here the default arguments
    %t for each method, but you are able to define for each query different
    %t arguments each time by using the switch -q. You have to read more
    %t on the wrapper's manual about this switch and to get a full
    %t picture of how the callbacks are working.
    %h
    %b
    %t Press "a" to continue.
    editbox @_TMDb_CommandLine a
    set %_tmdb_wizard_step 21
  }
  elseif ($1 == 22) {
    var %_tmdb_wizard_resized 1
    window -a +l @_TMDb_CommandLine -1 -1 688 519
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cb_global (Required)
    %n 2 0 This is the variable that holds every global arguments will be parsed in
    %n 2 0 header,footer callback aliases during the process of a query.
    %h
    %n 2 3 +socket0,0.....: Holds the last socket name of the result of the query
    %n 16 0 we made. 
    %n 2 3 +timestart0,0..: Holds the Unix Time/Ticks that the query started. 
    %n 16 0 You will define either ctime/ticks later. 
    %n 2 3 +timeend0,0....: Holds the Unix Time/Ticks that the query ended. 
    %n 16 0 You will define either ctime/ticks later. 
    %n 2 3 +totalpages0,0.: Holds the totalpages [where supported] of the results.
    %n 2 3 +query0,0......: Holds the query we made to the api.
    %n 2 3 +method0,0.....: Holds the method we used to the api.
    %n 2 3 +url0,0........: Holds the final encoded url we queried to get the
    %n 16 0 results. 
    %n 2 3 +cmd0,0........: Holds the EXACT command we pressed in order these
    %n 16 0 results to be shown.
    %n 2 0 +timeprocess: Holds the Unix Time/Ticks that the process of the data 
    %n 16 0 finished. You will define either ctime/ticks later. 
    %h
    %t (Default: @socket @timestart @timeend @totalpages @query @method @url @cmd
    %n 10 0 +timeprocess +cached)
    %h
    %b
    %t Please enter your input:
    set %_tmdb_wizard_more _tmdb_cb_global
    editbox @_TMDb_CommandLine @socket @timestart @timeend @totalpages @query @method @url @cmd @timeprocess @cached
    set %_tmdb_wizard_step 22     
  }
  elseif ($1 == 23) {
    var %_tmdb_wizard_resized 1
    window -a +l @_TMDb_CommandLine -1 -1 688 458
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cb_ms (Required)
    %n 2 0 This is the variable that holds every search/movie method arguments 
    %n 2 0 will be parsed in main callback alias during the process of a query.
    %h
    %n 2 3 +is_for_adults0,0.: Returns if the movie is nsfw*                                              
    %n 2 3 +backdrop_path0,0.: Returns the Backdrop Image Path.                                           
    %n 2 3 +id0,0............: Returns the id of the movie (usefull for full movie
    %n 19 0 query)                 
    %n 2 0 +original_title: Returns the Original Title of the movie                                    
    %n 2 3 +release_date0,0..: Returns the full date that movie released                                  
    %n 2 3 +year0,0..........: Returns only the year that movie released                                  
    %n 2 3 +poster_path0,0...: Returns the Poster Image Path.                                             
    %n 2 3 +popularity0,0....: Returns a float number of how much popular the movie is.                   
    %n 2 3 +title0,0.........: Returns the title of the movie                                             
    %n 2 3 +vote_average0,0..: Returns the vote average of the movie                                      
    %n 2 3 +vote_count0,0....: Returns the Number of Poeple voted in order vote_average
    %n 19 0 to be calculated.
    %h
    %t (Default: @title @year @id)
    %b
    %t Please enter your input:
    set %_tmdb_wizard_more _tmdb_cb_ms
    editbox @_TMDb_CommandLine @title @year @id
    set %_tmdb_wizard_step 23
  }
  elseif ($1 == 24) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cb_cs (Required)
    %n 2 0 This is the variable that holds every search/collection method arguments 
    %n 2 0 will be parsed in main callback alias during the process of a query.
    %h
    %n 2 3 +name0,0..........: Returns the name of the collection.      
    %n 2 3 +backdrop_path0,0.: Returns the Backdrop Image Path.                                           
    %n 2 3 +id0,0............: Returns the id of the collection (usefull for full
    %n 19 0 collection query)
    %n 2 3 +poster_path0,0...: Returns the Poster Image Path.
    %h
    %t (Default: @name @id)
    %h | %h
    %b
    %t Please enter your input:
    set %_tmdb_wizard_more _tmdb_cb_cs
    editbox @_TMDb_CommandLine @name @id
    set %_tmdb_wizard_step 24
  }
  elseif ($1 == 25) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cb_ps (Required)
    %n 2 0 This is the variable that holds every search/person method arguments 
    %n 2 0 will be parsed in main callback alias during the process of a query.
    %h
    %n 2 3 +name0,0..........: Returns the name of the Person.      
    %n 2 3 +profile_path0,0..: Returns the Profile Image path.                                              
    %n 2 3 +id0,0............: Returns the id of the person (usefull for full
    %n 19 0 person query)
    %n 2 3 +populatiry0,0....: Returns a float number of how much popular the person
    %n 2 3 +is_for_adults0,0.: Returns if the person is nsfw*  
    %n 19 0 is.
    %h
    %t (Default: @name @id)
    %b
    %t Please enter your input:
    set %_tmdb_wizard_more _tmdb_cb_ps
    editbox @_TMDb_CommandLine @name @id
    set %_tmdb_wizard_step 25
  }
  elseif ($1 == 26) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cb_os (Required)
    %n 2 0 This is the variable that holds every search/company method arguments 
    %n 2 0 will be parsed in main callback alias during the process of a query.
    %h
    %n 2 3 +name0,0..........: Returns the name of the company.      
    %n 2 3 +logo_path0,0.....: Returns the Logo Image path.                                              
    %n 2 3 +id0,0............: Returns the id of the company (usefull for full
    %n 19 0 company query)
    %h
    %t (Default: @name @id)
    %h | %h | %h
    %b
    %t Please enter your input:
    set %_tmdb_wizard_more _tmdb_cb_os
    editbox @_TMDb_CommandLine @name @id
    set %_tmdb_wizard_step 26
  }
  elseif ($1 == 27) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cb_ks (Required)
    %n 2 0 This is the variable that holds every search/keyword method arguments 
    %n 2 0 will be parsed in main callback alias during the process of a query.
    %h
    %n 2 3 +name0,0..........: Returns the name of the keyword.                                                
    %n 2 3 +id0,0............: Returns the id of the keyword (usefull for full
    %n 19 0 keyword query)
    %h
    %t (Default: @name @id)
    %h | %h | %h | %h
    %b
    %t Please enter your input:
    set %_tmdb_wizard_more _tmdb_cb_ks
    editbox @_TMDb_CommandLine @name @id
    set %_tmdb_wizard_step 27
  }
  elseif ($1 == 28) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cb_gl (Required)
    %n 2 0 This is the variable that holds every genre/list method arguments 
    %n 2 0 will be parsed in main callback alias during the process of a query.
    %h
    %n 2 3 +name0,0..........: Returns the name of the genre list.                                                
    %n 2 3 +id0,0............: Returns the id of the genre list (usefull for
    %n 19 0 full genre list query)
    %h
    %t (Default: @name @id)
    %h | %h | %h | %h
    %b
    %t Please enter your input:
    set %_tmdb_wizard_more _tmdb_cb_gl
    editbox @_TMDb_CommandLine @name @id
    set %_tmdb_wizard_step 28
  }
  elseif ($1 == 29) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_cb_time_format (Required)
    %n 2 0 This is the variable that holds the begin and end time format 
    %n 2 0 Available Formats: ctime , ticks
    %h
    %n 2 3 ctime0,0..........: Is the current date and time formated in unix time.                                                
    %n 2 3 ticks0,0..........: Is the number of ticks since your operating system 
    %n 19 0 was first started. used for more accurate calculation 
    %n 19 0 of process time.
    %h
    %t (Default: ticks)
    %h | %h | %h
    %b
    %t Please enter your input:
    set %_tmdb_wizard_more _tmdb_cb_time_format
    editbox @_TMDb_CommandLine ticks
    set %_tmdb_wizard_step 29
  }
  elseif ($1 == 30) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_def_cb (Required)
    %n 2 0 This is the variable that holds the default callback alias. 
    %n 2 0 Callback alias is running as identifier and it must be have
    %n 2 0 a "chk" property like mentioned in the guide earlier that it
    %n 2 0 must return $true . This alias will be executing as an
    %n 2 0 identifier with /noop command on default socket "mircsocks"
    %n 2 0 and on the command execution of the function tmdb. (/tmdb).
    %n 2 0 (Default: _tmdb_def_cb).
    %n 2 0 P.S: it would be wise to let it the default value and see
    %n 2 0 how the system interacting with it, in order to create the
    %n 2 0 the perfect callback afterwards. You can change this later.
    %h | %h
    %b
    %t Please enter your input:
    set %_tmdb_wizard_more _tmdb_def_cb
    editbox @_TMDb_CommandLine _tmdb_def_cb
    set %_tmdb_wizard_step 30
  }
  elseif ($1 == 31) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_def_cb_hd (Required)
    %n 2 0 This is the variable that holds the default callback header alias. 
    %n 2 0 Callback header alias is running as identifier and it must be have
    %n 2 0 a "chk" property like mentioned in the guide earlier that it
    %n 2 0 must return $true . This alias will be executing as an
    %n 2 0 identifier with /noop command on default socket "mircsocks"
    %n 2 0 and on the command execution of the function tmdb. (/tmdb).
    %n 2 0 This alias is getting executed right before the main callback alias
    %n 2 0 (Default: _tmdb_def_cb).
    %n 2 0 P.S: it would be wise to let it the default value and see
    %n 2 0 how the system interacting with it, in order to create the
    %n 2 0 the perfect callback afterwards. You can change this later.
    %h
    %b
    %t Please enter your input:
    set %_tmdb_wizard_more _tmdb_def_cb_hd
    editbox @_TMDb_CommandLine _tmdb_def_cb_hd
    set %_tmdb_wizard_step 31
  }
  elseif ($1 == 32) {
    %b | %h | %b | %t Callback Configuration0,0 $str(.,17) $+ 1 $p.bar($1 $+ /32,4|,0.) | %b | %h
    %t &_tmdb_def_cb_ft (Required)
    %n 2 0 This is the variable that holds the default callback footer alias. 
    %n 2 0 Callback footer alias is running as identifier and it must be have
    %n 2 0 a "chk" property like mentioned in the guide earlier that it
    %n 2 0 must return $true . This alias will be executing as an
    %n 2 0 identifier with /noop command on default socket "mircsocks"
    %n 2 0 and on the command execution of the function tmdb. (/tmdb).
    %n 2 0 This alias is getting executed right after the main callback alias
    %n 2 0 (Default: _tmdb_def_cb).
    %n 2 0 P.S: it would be wise to let it the default value and see
    %n 2 0 how the system interacting with it, in order to create the
    %n 2 0 the perfect callback afterwards. You can change this later.
    %h
    %b
    %t Please enter your input:
    set %_tmdb_wizard_more _tmdb_def_cb_ft
    editbox @_TMDb_CommandLine _tmdb_def_cb_ft
    set %_tmdb_wizard_step 32
  }
  elseif ($1 == 33) {
    %b | %h | %b | %t TMDb Setup Wizard. | %b | %h
    %t You have finished your setup wizard. If you read the manual your
    %t configuration will be just fine. If you didn't, you can read it
    %t and run again this wizard by typing /_tmdb_wizard OR by navigating
    %t to the menu TMDb->Setup Wizard.
    %h
    %t If you have any questions feel free to contact with me at my email
    %t nikmaurop@gmail.com , or leave a comment on Hawkee.
    %h | %h | %h | %h | %h
    %b
    %t You may now close this window safely.
    %b
  }
  titlebar @_TMDb_CommandLine Setup Wizard: Step $1 -> $p.bar($iif(!$1,1,$1) $+ / $+ 33).s
  if (!%_tmdb_wizard_resized)   window -a +l @_TMDb_CommandLine -1 -1 688 359

}
alias p.bar {
  var %open.char = 14,0[
  var %clos.char = 14,0]
  var %pbar.fill = 4|
  var %pbar.empt = 0,1.
  if ($3) { var %pbar.fill = $2, %pbar.empt = $3 }
  if ($5) { var %open.char = $2, %pbar.fill = $3, %pbar.empt = $4, %clos.char = $5 }
  if ($regex($1,^\d*/\d*$)) { var %p1 = $gettok($1,1,47)), %p2 = $calc($gettok($1,2,47) - %p1) }
  elseif ($regex($1,^\d*%$)) { var %p1 = $calc($remove($1,%) / 10)), %p2 = $calc(10 - %p1)) }
  if (%p1) {
    var %r = $+(%open.char,$str(%pbar.fill,%p1),$str(%pbar.empt,%p2),%clos.char,$iif($right(%clos.char,-1) != ,))
    return $iif($prop == s,$strip(%r),%r) 
  }
  else { return }
}

on *:input:@_TMDb_CommandLine:{
  var %w = @_TMDb_CommandLine
  var %m aline -p %w
  var %b %m ** *************************************************************************** **
  var %f %m *********************************************************************************
  var %h %m **0,0:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::**
  var %t _tmdb_wizard_input
  var %n _tmdb_wizard_input2 
  var %r _tmdb_wizard_rnput 
  if (%_tmdb_wizard_step) {
    var %s $v1
    if (%s !isnum 21-27) %r $hget(_tmdb_wizard,line) $iif(%s == 3,$str(*,$len($1-)),$1-)

    unset %_tmdb_wizard_step

    if (%s isnum 1-2) || (%s == 18) {
      if ($1 == Y) { _tmdb_wizard $calc(%s + 1)  }
      elseif ($1 == n) { 
        set %_tmdb_wizard_step %s
        %b
        %t Are you sure you want to delete all your
        %t configuration and abort this setup? [T=Yes,F=No]
      }
      elseif ($1 === T) {
        window -c @_TMDb_CommandLine | unset %_tmdb_wizard* | if (%s == 17) { unset %_tmdb_* }
      }
      elseif ($1 == F) {
        set %_tmdb_wizard_step %s
        %b
        %t Do you wish to continue ? [Y/n]
      }
      else {
        set %_tmdb_wizard_step %s
        %r Do you wish to continue ? [Y/n]
      }
    }
    elseif (%s == 3) {
      if ($1 == [skp]) {
        _tmdb_wizard $calc(%s + 1)
      }
      elseif ($1 == [pwd]) { set %_tmdb_wizard_step 3 | _tmdb_safe_pwdrequest }
      else {
        %b
        %t Please wait, until API Server check your api key.
        %b
        if ($len($1) == 32) {
          set %_tmdb_wizard_step 3
          _tmdb_key_check $1-
        }
        else {
          %b
          %t Your API Key is invalid.
          %b
          %t Please Enter your Input:
          set %_tmdb_wizard_step 3
        }
      }
    }
    elseif (%s == 4) {
      if ($1 isnum) {
        %b
        set %_tmdb_api_version 3
        _tmdb_wizard $calc(%s + 1)
      }
      else {
        %b
        %t Invalid Input. Accepted Values: Integer or float Number.
        set %_tmdb_wizard_step 4
        _tmdb_wizard 4

      }
    }
    elseif (%s == 5) {
      set %_tmdb_alert $1-
      _tmdb_wizard $calc(%s + 1)

    }
    elseif (%s == 6) {
      if ($regex($1,/(vbsocks|mircsocks)/)) {
        set % [ $+ [ %_tmdb_wizard_more ] ] $1-
        _tmdb_wizard $calc(%s + 1)
      }
      else {
        %b
        %t Invalid Input. Accepted Values: vbsocks/mircsocks
        %b
        %t Please Enter your Input:
        set %_tmdb_wizard_step %s
        editbox @_TMDb_CommandLine mircsocks
      }

    }
    elseif (%s == 7) {
      if ($1 == 1) && ($sslready) {
        set %_tmdb_ssl 1
        _tmdb_wizard $calc(%s + 1)
      }
      elseif (!$sslready) && ($1 == 1) {
        %b
        %t It seems that SSL is missing from your Computer.
        %t Please visit: http://www.mirc.com/ssl.html
        %t for more information about installing ssl to your
        %t computer.
        %b
        %t Please Enter your Input:
        set %_tmdb_wizard_step 6
        editbox @_TMDb_CommandLine 0
      }
      elseif ($1 == 0) {
        set %_tmdb_ssl 0
        _tmdb_wizard $calc(%s + 1)
      }
    }
    elseif (%s isnum 8-17) {
      if ($1 isnum $iif(%s == 10,0-2,$iif(%s == 9,1-,0-1))) {
        set % [ $+ [ %_tmdb_wizard_more ] ] $1
        unset %_tmdb_wizard_more
        _tmdb_wizard $calc(%s + 1)
      }
      else {
        %b
        %t Invalid Input. Accepted Values: Integer Number $iif(%s == 8,[0-1]) $+ $iif(%s == 10,[0-2]) $+ $iif(%s isnum 11-16,[0-1]) 
        %b
        %t Please Enter your Input:
        set %_tmdb_wizard_step %s
        editbox @_TMDb_CommandLine $iif(%s == 10,2,$iif(%s == 9,5,$iif(%s == 8,0,$iif(%s == 17,0,1))))
      }
    }
    elseif (%s isnum 19-21) {
      if ($1 == a) {
        _tmdb_wizard $calc(%s + 1)
      }
      else {
        %r Press "a" to continue.
        set %_tmdb_wizard_step %s
      }
    }
    elseif (%s isnum 22-28) {
      set % [ $+ [ %_tmdb_wizard_more ] ] $1-
      unset %_tmdb_wizard_more
      _tmdb_wizard $calc(%s + 1)
    }
    elseif (%s == 29) {
      if ($regex($1,/(ticks|ctime)/)) {
        set % [ $+ [ %_tmdb_wizard_more ] ] $regml(1)
        _tmdb_wizard $calc(%s + 1)
      }
      else {
        %b
        %t Invalid Input. Accepted Values: [ticks,ctime] 
        %b
        %t Please Enter your Input:
        set %_tmdb_wizard_step %s
        editbox ticks
      }
    }
    elseif (%s isnum 30-32) {
      set % [ $+ [ %_tmdb_wizard_more ] ] $1-
      unset %_tmdb_wizard_more
      _tmdb_wizard $calc(%s + 1)
    }

  }
}
alias -l len2 {
  var %i = 1
  var %n = 0
  while (%i <= $len($1-)) {
    if ($mid($1-,%i,1) != $chr(3)) { inc %n }
    inc %i
  }
  return %n
}
alias _tmdb_safe_pwdrequest {
  var %w = @_TMDb_CommandLine | var %m aline -p %w | var %b %m ** *************************************************************************** ** | var %f %m ********************************************************************************* 
  var %h %m **0,0:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::** | var %t _tmdb_wizard_input | var %n _tmdb_wizard_input2  
  %b
  var %input $?*="Please enter your 32-character API Key"
  %b
  %t Please wait, until API Server check your api key.
  %b
  if ($len(%input) == 32) {
    _tmdb_key_check %input
  }
  else {
    %b
    %t Your API Key is invalid.
    %b
    %t Please Enter your Input:
    set %_tmdb_wizard_step 3
  }

}
alias -l _tmdb_key_check {
  set %_tmdb_api_key $1
  tmdb validate -c _tmdb_key_check2 $1
}
alias -l _tmdb_key_check2 {
  var %w = @_TMDb_CommandLine | var %m aline -p %w | var %b %m ** *************************************************************************** ** | var %f %m ********************************************************************************* 
  var %h %m **0,0:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::** | var %t _tmdb_wizard_input | var %n _tmdb_wizard_input2  

  if ($isid) {
    if ($prop == chk) { return $true }
    if ($1) {
      %t Your API Key is valid.
      _tmdb_wizard $calc(%_tmdb_wizard_step + 1)
      unset %_tmdb_wizard_step
    }
    else {
      %b
      %t Your API Key is invalid.
      %b
      %t Please Enter your Input:

      set %_tmdb_wizard_step 3
    }
  }
}
alias _tmdb_wizard_input2 {
  aline -p @_TMDb_CommandLine ** 0,0 $+ $str(:,$1) $+  $+ $replace($3-,&,$chr(37),^,$chr(125),@,$chr(123),!,$chr(36),+,@) $+ 0,0 $+ $str(:,$calc(75 - $len2($3-) + $2 + 5 - $len(0 $+ $chr(44) $+ 0 $+ $str(:,$1) $+ ) )) $+  **
}
alias _tmdb_wizard_rnput {
  hadd -m _tmdb_wizard line $1-
  rline -p @_TMDb_CommandLine $line(@_TMDb_CommandLine,0) ** $replace($1-,&,$chr(37),^,$chr(125),@,$chr(123),!,$chr(36),+,@) $+ 0,0 $+ $str(:,$calc(75 - $len($1-) )) $+  **
}

alias _tmdb_wizard_input {
  hadd -m _tmdb_wizard line $1-
  aline -p @_TMDb_CommandLine ** $replace($1-,&,$chr(37)) $+ 0,0 $+ $str(:,$calc(75 - $len($1-) )) $+  **
}
menu @_TMDB_CommandLine {
  sclick:{ movewin $active $calc($mouse.dx -$window($active).x) $calc($mouse.dy -$window($active).y)  }
}
alias tmdb {
  if ($isid) {
    return $_tmdb_isid($1-). [ $+ [ $prop ] ]
  }
  else {
    _tmdb_alias $1-
  }
}
alias _tmdb_alias {
  ;_tmdb_init
  var %e,%w,%s
  if (a isin %_tmdb_alert) { %w = echo $color(info) * /tmdb: Warning: }
  else { %w = noop }
  if (b isin %_tmdb_alert) { %e = echo $color(info) * /tmdb: Error: }
  else { %e = noop }
  if (c isin %_tmdb_alert) { %s = echo $color(info) * /tmdb: }
  else { %s = noop }
  var %_tmdb_method $1
  var %more
  ;Search
  if ($1 == search/movie) {
    var %_tmdb_switch_allow cpayrql
  }

  elseif ($1 === search/collection) {
    var %_tmdb_switch_allow cpql
  }
  elseif ($1 === search/person) {
    var %_tmdb_switch_allow cpaql
  }
  elseif ($1 === search/company) {
    var %_tmdb_switch_allow cpql
  }
  elseif ($1 === search/keyword) {
    var %_tmdb_switch_allow cpql
  }
  elseif ($1 === genre/list) {
    var %_tmdb_switch_allow cqld
  }
  elseif ($1 === configuration) {
    var %_tmdb_switch_allow cd
  }
  ;Validate
  elseif ($1 === validate) {
    var %_tmdb_switch_allow c
  }
  ;Movie
  elseif ($1 === movie/latest) {
    var %_tmdb_switch_allow cl
  }
  elseif ($1 === movie/upcoming) {
    var %_tmdb_switch_allow pcl
  }
  elseif ($1 === movie/popular) {
    var %_tmdb_switch_allow pcl
  }
  elseif ($1 === movie/top_rated) {
    var %_tmdb_switch_allow pcl
  }
  elseif ($1 === movie/now_playing) {
    var %_tmdb_switch_allow pcl
  }
  ;Person
  elseif ($1 === person/popular) {
    var %_tmdb_switch_allow pc
  }
  elseif ($1 === person/latest) {
    var %_tmdb_switch_allow c
  }
  elseif ($1 === person/latest) {
    var %_tmdb_switch_allow c
  }

  elseif (genre/*/movies iswmcs $1) {
    if ($remove($1,genre/,/movies) isnum) {
      var %_tmdb_switch_allow cpald
    }
    else {
      %e Invalid ID for method genre/{id}/movies. ID must be an integer.
      goto halt
    }
  }

  elseif (movie/* iswmcs $1) {
    if ($remove($1,movie/) isnum) || (($left($remove($1,movie/),2) == tt) && ($right($remove($1,movie/),$calc($len($remove($1,movie/)) - 2)) isnum)) {
      var %_tmdb_switch_allow cld
      var %more = %more $+ &append_to_response=alternative_titles,casts,images,releases,trailers,translations,similar_movies
    }
    else {
      %e Invalid ID for method movie/{id}. ID must be a valid integer movie id or a valid IMDb id.
      goto halt
    }
  }
  elseif (list/* iswmcs $1) {
    if ($len($remove($1,list/)) == 24) {
      var %_tmdb_switch_allow cd
      var %more = %more $+ &append_to_response=item_status
    }
    else {
      %e Invalid ID for method list/{id}. ID must be a valid 24-character string.
      goto halt
    }
  }

  elseif (collection/* iswmcs $1) {
    if ($remove($1,collection/) isnum)  {
      var %_tmdb_switch_allow cld
      var %more = %more $+ &append_to_response=images
    }
    else {
      %e Invalid ID for method collection/{id}. ID must be a valid integer collection id.
      goto halt
    }
  }
  elseif (person/* iswmcs $1) {
    if ($remove($1,person/) isnum)  {
      var %_tmdb_switch_allow cld
      var %more = %more $+ &append_to_response=images,changes,credits
    }
    else {
      %e Invalid ID for method person/{id}. ID must be a valid integer person id.
      goto halt
    }
  }

  elseif ($1 == clearcache) {
    write i.vbs Const DeleteReadOnly = TRUE
    write i.vbs Set objFSO = CreateObject("Scripting.FileSystemObject")
    write i.vbs objFSO.DeleteFile("tmdb\db\*"), DeleteReadOnly
    write i.vbs objFSO.DeleteFolder("tmdb\db\*"),DeleteReadOnly
    .run wscript.exe i.vbs
    .timer -ms 1 1000 .remove i.vbs 
    %s Cache has been cleared.
    goto halt
  }
  else {
    %e Unknown Method.
    goto halt

  }
  var %count = 0
  var %_tmdb_tmp_socket $+(_tmdb_sock_,$rand(a,z),.,$ticks,.,$rand(0,9999))
  hadd -m %_tmdb_tmp_socket timestart $ [ $+ [ %_tmdb_cb_time_format ] ]
  hadd -m %_tmdb_tmp_socket language en
  if (-* iswm $2) {
    _tmdb_switch_check $2 %_tmdb_switch_allow $1
    if (c isincs $2) {
      inc %count
      if ($ [ $+ [ $calc(2 + %count) ] ]) {
        if ($ [ $+ [ $ [ $+ [ $calc(2 + %count) ] ] ] ] [ $+ [ ().chk ] ]) {
          hadd -m %_tmdb_tmp_socket callback $ [ $+ [ $calc(2 + %count) ] ]
        }
        else {
          %e Callback $ [ $+ [ $calc(2 + %count) ] ] is not a valid alias.
          goto halt

        }

        if ($ [ $+ [ $calc(2 + %count + $len($2) + 1 ) ] ]) {
          if ($ [ $+ [ $ [ $+ [ $calc(2 + %count + 1) ] ] ] ] [ $+ [ ().chk ] ]) {
            hadd -m %_tmdb_tmp_socket cbheader $ [ $+ [ $calc(2 + %count + 1) ] ]
          }
          else {
            %e Callback header $ [ $+ [ $calc(2 + %count + 1) ] ] is not a valid alias.
            goto halt

          }
          if ($ [ $+ [ $ [ $+ [ $calc(2 + %count + 2) ] ] ] ] [ $+ [ ().chk ] ]) {
            hadd -m %_tmdb_tmp_socket cbfooter $ [ $+ [ $calc(2 + %count + 2) ] ]
          }
          else {
            %e Callback footer $ [ $+ [ $calc(2 + %count + 2) ] ] is not a valid alias.
            goto halt

          }
          inc %count 2
        }
      }
      else {
        %e You must specify a callback alias name.
        goto halt
      }
    }
    if (p isincs $2) {
      inc %count
      if ($ [ $+ [ $calc(2 + %count) ] ] isnum) {

        %more = $+(%more,&,page=,$ [ $+ [ $calc(2 + %count) ] ])
      }
      else {
        %e Invalid value $iif($v1,$v1,null) for switch p. Value must be a valid integer.
        goto halt
      }
    }
    if (a isincs $2) {
      inc %count
      if ($ [ $+ [ $calc(2 + %count) ] ] == true) || ($ [ $+ [ $calc(2 + %count) ] ] == false) {
        %more = $+(%more,&,include_adult=,$ [ $+ [ $calc(2 + %count) ] ])
      }
      else {
        %e Invalid value $ [ $+ [ $calc(2 + %count) ] ] for switch a. Value must be true/false
        goto halt
      }
    }
    if (y isincs $2) {
      inc %count
      if ($ [ $+ [ $calc(2 + %count) ] ] isnum) {
        %more = $+(%more,&,year=,$int($ [ $+ [ $calc(2 + %count) ] ]))
      }
      else {
        %e Invalid value $ [ $+ [ $calc(2 + %count) ] ] for switch y. Value must be integer
        goto halt
      }
    }
    if (r isincs $2) {
      inc %count
      if ($ [ $+ [ $calc(2 + %count) ] ]) {
        %more = $+(%more,&,primary_release_year=,$ [ $+ [ $calc(2 + %count) ] ])
      }
      else {
        %e Invalid value $iif($ [ $+ [ $calc(2 + %count) ] ],$v1,Null) for switch r. Value must be a valid date.
        goto halt
      }
    }
    if (q isincs $2) {
      inc %count
      if ($ [ $+ [ $calc(2 + %count) ] ]) {
        if (% [ $+ [ $v1 ] ]) {
          hadd -m %_tmdb_tmp_socket args $v1
        }
        else {
          %e Invalid variable $ [ $+ [ $calc(2 + %count) ] ] for switch q. Value must be a valid variable.
          goto halt
        }
      }
    }
    if (l isincs $2) {
      inc %count
      if ($ [ $+ [ $calc(2 + %count) ] ] isalpha) && ($len($ [ $+ [ $calc(2 + %count) ] ]) == 2) {
        hadd -m %_tmdb_tmp_socket language $ [ $+ [ $calc(2 + %count) ] ]
        %more = $+(%more,&language=,$ [ $+ [ $calc(2 + %count) ] ])
      }
      else {
        %e Invalid language $ [ $+ [ $calc(2 + %count) ] ] for switch l. Value must be a valid language. http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes#Partial_ISO_639_table (ISO 639-1)
        goto halt
      }

    }
    if (m isincs $2) {
      inc %count
      if ($ [ $+ [ $calc(2 + %count) ] ] isnum) {
        %mode = $+(%more,&movie_id=,$ [ $+ [ $calc(2 + %count) ] ])
      }
      else {
        %e Invalid movie id $ [ $+ [ $calc(2 + %count) ] ] for switch m. Value must be a valid movie id.
        goto halt
      }
    }
    if (n isincs $2) {
      hadd -m %_tmdb_tmp_socket cont 1
    }
    inc %count
  }
  if (%_tmdb_search_allpages == 1) {
    hadd -m %_tmdb_tmp_socket allpages 1
  }
  else {
    hadd -m %_tmdb_tmp_socket allpages 0
  }
  if ($ [ $+ [ $calc(2 + %count) ] ]) || (*search* !iswm $1) {
    var %query = $ [ $+ [ $calc(2 + %count) $+ - ] ]

  }
  elseif (%_tmdb_method != configuration) && (%_tmdb_method != validate) {
    %e Query must not be null.
    goto halt
  }
  var %_tmdb_sport %_tmdb_api_port
  if (-*s* iswmcs $2) || (%_tmdb_ssl == 1) {
    if ($sslready) {
      var %_tmdb_sport %_tmdb_api_secure_port
      var %_tmdb_sswitch -e
    }
    elseif (%_tmdb_ssl_fail == 1) {
      %e SSL Failed to Load. Have you SSL Installed on your machine?
      goto halt
    }
    else {
      %w SSL Failed to Load. Proceeding with No-Secure connection.
    }
  }
  if (%_tmdb_cache == 1) || ((%_tmdb_cache == 2) && (-*d* iswmcs $2)) {
    if ($regex(%_tmdb_method,/(collection|movie|person|genre|configuration)/)) {
      if (%_tmdb_cache_ [ $+ [ $gettok(%_tmdb_method,1,47) ] ] == 1) {

        if ($exists(tmdb/db/ $+ $regml(1) $+ . $+ $remove(%_tmdb_method,$regml(1),/) $+ . $+ $iif(l isin $2,$remove($gettok(%more,$numtok(%more,38),38),language=) $+ .,en.) $+ db)) || ($exists(tmdb/system/ $+ $regml(1) $+ .json)) {
          if ($exists(tmdb/system/ $+ $regml(1) $+ .json)) { var %f = $regml(1) $+ .json | var %file tmdb/system/ $+ %f }
          else { var %f = $regml(1) $+ . $+ $remove(%_tmdb_method,$regml(1),/) $+ . $+ $iif(l isin $2,$remove($gettok(%more,$numtok(%more,38),38),language=) $+ .,en.) $+ db | var %file tmdb/db/ $+ %f }
          hfree %_tmdb_tmp_socket
          var %_tmdb_tmp_socket = %f

          hadd -m %_tmdb_tmp_socket cached $true
          hadd -m %_tmdb_tmp_socket cmd /tmdb $1-
          hadd -m %_tmdb_tmp_socket query $iif(%query,$v1,null)
          hadd -m %_tmdb_tmp_socket method %_tmdb_method
          hadd -m %_tmdb_tmp_socket url $longfn(%file)
          hadd -m %_tmdb_tmp_socket timestart $ [ $+ [ %_tmdb_cb_time_format ] ]
          hadd -m %_tmdb_tmp_socket timeend $ [ $+ [ %_tmdb_cb_time_format ] ]
          _tmdb_process %_tmdb_tmp_socket
          goto finish
        }
      }
    }
  }
  if (!$sock(%_tmdb_tmp_socket)) {

    if (%_tmdb_valid_api_key) {
      hadd -m %_tmdb_tmp_socket cmd /tmdb $1-
      hadd -m %_tmdb_tmp_socket cached $false
      hadd -m %_tmdb_tmp_socket query $iif(%query,$v1,null)
      hadd -m %_tmdb_tmp_socket method %_tmdb_method
      if (%_tmdb_method == validate) { %_tmdb_method = configuration }
      hadd -m %_tmdb_tmp_socket url $+(/,%_tmdb_api_version,/,%_tmdb_method,?,api_key=,%_tmdb_api_key,$iif(%query,&query= $+ $urlencode(%query)),%more)
      if (%_tmdb_isid_socket == mircsocks) {
        sockopen %_tmdb_sswitch %_tmdb_tmp_socket %_tmdb_api_host %_tmdb_sport
      }
      elseif (%_tmdb_isid_socket == vbsocks) {

        var %file = $json_utf8($+($iif(%_tmdb_sport == 80,http://,https://),%_tmdb_api_host,$hget(%_tmdb_tmp_socket,url)),tmdb\temp\ $+ %_tmdb_tmp_socket).savetofile().nocache()
        if (%file) {
          _tmdb_process %_tmdb_tmp_socket
        }
        else {
          %e VBScript Socket Failed.
          goto halt
        }
      }
      else { %e Unknown Socket to use. Please define socket and try again. | goto halt }
    }
    else {
      if (%_tmdb_method != validate) { 
        hadd -m %_tmdb_tmp_socket fcmd /tmdb $1-
      }

      hadd -m %_tmdb_tmp_socket method validate
      if (%_tmdb_method == validate) { %_tmdb_method = configuration }
      hadd -m %_tmdb_tmp_socket url $+(/,%_tmdb_api_version,/configuration,?,api_key=,%_tmdb_api_key)
      sockopen %_tmdb_tmp_socket %_tmdb_api_host %_tmdb_sport
    }
  }
  else {
    %e Socket in use - You are using this command extremely fast.
    goto halt
  }
  goto finish
  :halt
  if ($hget(%_tmdb_tmp_socket)) hfree %_tmdb_tmp_socket
  :finish
}
alias -l _tmdb_switch_check {
  var %s = $remove($1,-)
  var %i = 1
  while (%i <= $len(%s)) {
    if ($mid(%s,%i,1) !isincs $2) && (!$regex($mid(%s,%i,1),/(n|s)/)) {
      echo $color(info) * /tmdb: Invalid switch $mid(%s,%i,1) for method $3
      halt
    }
    inc %i
  }
}

alias _tmdb_isid {
  var %i = 1
  var %prop
  var %id = _tmdb_isid. $+ $calc($ctime + $ticks + $rand(1,9999))
  var %e,%w,%s
  if (a isin %_tmdb_alert) { %w = echo $color(info) * $tmdb: Warning: }
  else { %w = noop }
  if (b isin %_tmdb_alert) { %e = echo $color(info) * $tmdb: Error: }
  else { %e = noop }
  if (c isin %_tmdb_alert) { %s = echo $color(info) * $tmdb: }
  else { %s = noop }
  var %query $1-
  .timer 1 2 _tmdb_isid_clear %id
  while (%i <= $numtok($remove($prop,.jpg),46) ) {
    var %entry = $gettok($remove($prop,.jpg),%i,46)
    var %method = $gettok(%entry,1,40)
    var %property = [ [ $mid($gettok(%entry,2,40),1,$calc($len($gettok(%entry,2,40)) - 1)) ] ]
    var %fmethod = %method $+ ( $+ %property $+ )
    var %prop = %prop $+ . $+ %method $+ ( $+ %property $+ )
    hadd -m %id $gettok(%entry,1,40) %property
    inc %i
  }
  if (!$hget(%id,method)) {
    %e No method supplied.
    goto false
  }
  else {
    tokenize 32 $hget(%id,method)
    if ($1 == search/movie) { var %_tmdb_switch_allow cpayrqls }
    elseif ($1 === search/collection) { var %_tmdb_switch_allow cpqls }
    elseif ($1 === search/person) { var %_tmdb_switch_allow cpaqls }
    elseif ($1 === search/company) { var %_tmdb_switch_allow cpqls }
    elseif ($1 === search/keyword) { var %_tmdb_switch_allow cpqls }
    elseif ($1 === genre/list) { var %_tmdb_switch_allow cqlds }
    elseif ($1 === configuration) { var %_tmdb_switch_allow cds }
    elseif ($1 === validate) { var %_tmdb_switch_allow cs }
    elseif ($1 === movie/latest) { var %_tmdb_switch_allow cls }
    elseif ($1 === movie/upcoming) { var %_tmdb_switch_allow pcls }
    elseif ($1 === movie/popular) { var %_tmdb_switch_allow pcls }
    elseif ($1 === movie/top_rated) { var %_tmdb_switch_allow pcls }
    elseif ($1 === movie/now_playing) { var %_tmdb_switch_allow pcls }
    elseif ($1 === person/popular) { var %_tmdb_switch_allow pcs }
    elseif ($1 === person/latest) { var %_tmdb_switch_allow cs }
    elseif ($1 === person/latest) { var %_tmdb_switch_allow cs }
    elseif ($1 === authentication) { var %_tmdb_switch_allow cs }
    elseif (genre/*/movies iswmcs $1) {
      if ($remove($1,genre/,/movies) isnum) { var %_tmdb_switch_allow cpalds }
      else { %e Invalid ID for method genre/{id}/movies. ID must be an integer. | goto false }
    }
    elseif (movie/* iswmcs $1) {
      if ($remove($1,movie/) isnum) || (($left($remove($1,movie/),2) == tt) && ($right($remove($1,movie/),$calc($len($remove($1,movie/)) - 2)) isnum)) { var %more = &append_to_response=alternative_titles,casts,images,releases,trailers,translations,similar_movies | var %_tmdb_switch_allow clds }
      else { %e Invalid ID for method movie/{id}. ID must be a valid integer movie id or a valid IMDb id. | goto false }
    }
    elseif (list/* iswmcs $1) {
      if ($len($remove($1,list/)) == 24) { var %_tmdb_switch_allow cds | var more = %more $+ &append_to_response=item_status }
      else { %e Invalid ID for method list/{id}. ID must be a valid 24-character string. | goto false }
    }
    elseif (collection/* iswmcs $1) {
      if ($remove($1,collection/) isnum) { var %_tmdb_switch_allow clds | var %more = %more $+ &append_to_response=images }
      else { %e Invalid ID for method collection/{id}. ID must be a valid integer collection id. | goto false }
    }
    elseif (person/* iswmcs $1) {
      if ($remove($1,person/) isnum)  { var %_tmdb_switch_allow clds | var %more = %more $+ &append_to_response=images,changes,credits,combined_cretids }
      else { %e Invalid ID for method person/{id}. ID must be a valid integer person id. | goto false }
    }
    elseif (image/* iswmcs $1) {
      var %_data $remove($1,image/)
      var %_image = $gettok(%_data,2,$asc(/)) $+ .jpg
      var %_data = $gettok(%_data,1,$asc(/))
      var %_img_type = $left(%_data,2)
      var %_img_size = $mid(%_data,3,$len(%_data))
      if (%_img_type == ba) { var %_img_type_f backdrop_sizes }
      elseif (%_img_type == lo) { var %_img_type_f logo_sizes }
      elseif (%_img_type == po) { var %_img_type_f poster_sizes }
      elseif (%_img_type == pr) { var %_img_type_f profile_sizes }
      elseif (%_img_type == st) { var %_img_type_f still_sizes }
      else { %e Invalid image type on /image/{image_type}{image_size}/{image_url}. | goto false }
      var %conf $tmdb().method(configuration).cache() 
      if ($istok($json_utf8(%conf,images,%_img_type_f),%_img_size,44)) {
        if ($exists(tmdb/images/ $+ $remove(%_img_type_f,_sizes) $+ s $+ / $+ %_image)) { return $longfn(tmdb/images/ $+ $remove(%_img_type_f,_sizes) $+ s $+ / $+ %_image) }
        else {
          return $vbs_download($json_utf8(%conf,images,base_url) $+ %_img_size $+ / $+ %_image $+ ,tmdb/images/ $+ $remove(%_img_type_f,_sizes) $+ s $+ / $+ %_image $+ )
        }
        return $false
      }
      else { %e Invalid image size on /image/{image_type}{image_size}/{image_url}. | goto false }

    }
    elseif ($1 == clearcache) {
      write i.vbs Const DeleteReadOnly = TRUE
      write i.vbs Set objFSO = CreateObject("Scripting.FileSystemObject")
      write i.vbs objFSO.DeleteFile("tmdb\db\*"), DeleteReadOnly
      write i.vbs objFSO.DeleteFolder("tmdb\db\*"),DeleteReadOnly
      .run wscript.exe i.vbs
      .timer -ms 1 1000 .remove i.vbs 
      %s Cache has been cleared.
      return $true
    }
    else { %e Unknown Method. | goto false }
  }
  var %i = 1
  var %c = callback cbheader cbfooter
  var %p = page
  var %l = language
  var %a = adult
  var %y = year
  var %r = release_year
  var %q = variable
  var %d = cache
  var %m = movie_id
  var %s = secure
  while (%i <= $len(%_tmdb_switch_allow) ) {
    var %k $mid(%_tmdb_switch_allow,%i,1)
    var %z = 1
    while (%z <= $numtok(% [ $+ [ %k ] ],32) ) {
      if ($hget(%id,$gettok(% [ $+ [ %k ] ],%z,32))) {
        var % $+ $gettok(% [ $+ [ %k ] ],%z,32) = $true
      }
      inc %z
    }
    inc %i
  }
  var %i = 1
  while (%i <= $hfind(%id,*,0,w) ) {
    var %t $hfind(%id,*,%i,w)
    if (!% [ $+ [ %t ] ]) {
      var %string = %string . $+ %t $+ ()
    }
    inc %i
  }
  if (%string) { %w Properties(s): %string , Won't have any effects on this method. }
  var %count = 0

  var %_tmdb_tmp_socket $+(_tmdb_sock_,$rand(a,z),.,$ticks,.,$rand(0,9999))
  hmake %_tmdb_tmp_socket
  var %_tmdb_sport %_tmdb_api_port
  hadd -m %_tmdb_tmp_socket timestart $ [ $+ [ %_tmdb_cb_time_format ] ]
  hadd -m %_tmdb_tmp_socket language en
  if ($hget(%id,callback)) {
    var %value $v1 
    if ($ [ $+ [ %value ] ] [ $+ [ ().chk ] ]) { hadd -m %_tmdb_tmp_socket callback %value }
    else { %e Invalid value $iif(%value,$v1,null) for method .callback(). Value must be a valid callback-alias* | goto false }
  }
  if ($hget(%id,cbheader)) {
    var %value $v1 | if ($ [ $+ [ %value ] ] [ $+ [ ().chk ] ]) { hadd -m %_tmdb_tmp_socket cbheader %value }
    else { %e Invalid value $iif(%value,$v1,null) for method .cbheader(). Value must be a valid callback-alias* | goto false }
  }
  if ($hget(%id,cbfooter)) {
    var %value $v1 | if ($ [ $+ [ %value ] ] [ $+ [ ().chk ] ]) { hadd -m %_tmdb_tmp_socket cbfooter %value }
    else { %e Invalid value $iif(%value,$v1,null) for method .cbfooter(). Value must be a valid callback-alias* | goto false }
  }
  if ($hget(%id,page)) {
    var %value $v1 | if (%value isnum) { %more = $+(%more,&,page=,%value) }
    else { %e Invalid value $iif(%value,$v1,null) for method .page(). Value must be a valid integer. | goto false }
  }
  if ($hget(%id,adult)) {
    var %value $v1 | if ($regex($1,/(true|false)/)) { %more = $+(%more,&,include_adult=,$regml(1)) }
    else { %e Invalid value $iif(%value,$v1,null) for method .adult(). Value must be a valid boolean (true/false). | goto false }
  }
  if ($hget(%id,year) isnum 1800-2100) {
    var %value $v1 | if (%value isnum) { %more = $+(%more,&,year=,%value) }
    else { %e Invalid value $iif(%value,$v1,null) for method .year(). Value must be a valid year 4-digit integer. | goto false }
  }
  if ($hget(%id,realease_year) isnum 1800-2100) {
    var %value $v1 | if (%value isnum) { %more = $+(%more,&,primary_release_year=,%value) }
    else { %e Invalid value $iif(%value,$v1,null) for method .release_year(). Value must be a valid year 4-digit integer. | goto false }
  }
  if ($hget(%id,variable)) {
    var %value $v1 | if (% [ $+ [ %value ] ]) { hadd -m %_tmdb_tmp_socket args %value }
    else { %e Invalid value $iif(%value,$v1,null) for method .variable(). Value must be a valid variable | goto false }
  }
  if ($hget(%id,language)) {
    var %value $v1 | if (%value isalpha) && ($len(%value) == 2) { hadd -m %_tmdb_tmp_socket language %value | %more = $+(%more,&language=,%value) }
    else { %e Invalid value $iif(%value,$v1,null) for method .language(). Value must be a valid 2-character language: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes#Partial_ISO_639_table | goto false }
  }
  if ($hget(%id,movie_id)) {
    var %value $v1 | if (%value isnum) { %more = $+(%more,&movie_id=,%value) }
    else { %e Invalid value $iif(%value,$v1,null) for method .movie_id(). Value must be a valid integer | goto false }
  }
  if ($hget(%id,secure)) {
    if ($sslready) { | var %_tmdb_sport %_tmdb_api_secure_port | var %_tmdb_sswitch -e }
    elseif (%_tmdb_ssl_fail == 1) { %e SSL Failed to Load. Have you SSL Installed on your machine? | goto false }
    else { %w SSL Failed to Load. Proceeding with insecure connection. }
  }
  if ($hget(%id,cache)) { var %cache 1 }
  if (%_tmdb_search_allpages == 1) { hadd -m %_tmdb_tmp_socket allpages 1 }
  else { hadd -m %_tmdb_tmp_socket allpages 0 }

  ;Finaly
  if (%_tmdb_cache == 1) || ((%_tmdb_cache == 2) && (%cache)) {
    if ($regex($hget(%id,method),/(collection|movie|person|list|genre|configuration)/)) {
      if (%_tmdb_cache_ [ $+ [ $gettok($hget(%id,method),1,47) ] ] == 1) {
        if ($exists(tmdb/db/ $+ $regml(1) $+ . $+ $remove($hget(%id,method),$regml(1),/) $+ . $+ $iif($hget(%_tmdb_tmp_socket,language),$v1 $+ .,en.) $+ db)) || ($exists(tmdb/system/ $+ $regml(1) $+ .json)) {
          if ($exists(tmdb/system/ $+ $regml(1) $+ .json)) { var %f = $regml(1) $+ .json | var %file tmdb/system/ $+ %f }
          else { var %f = $regml(1) $+ . $+ $remove($hget(%id,method),$regml(1),/) $+ . $+ $iif($hget(%_tmdb_tmp_socket,language), $v1 $+ .,en.) $+ db | var %file tmdb/db/ $+ %f }
          hfree %_tmdb_tmp_socket
          var %_tmdb_tmp_socket = %f
          hadd -m %_tmdb_tmp_socket cached $true
          hadd -m %_tmdb_tmp_socket cmd $!chr(36) $ [ $!+ [ + ] ]  tmdb( $+ %query $+ ) $+ %prop
          hadd -m %_tmdb_tmp_socket query $iif(%query,$v1,null)
          hadd -m %_tmdb_tmp_socket method $hget(%id,method)
          hadd -m %_tmdb_tmp_socket url $longfn(%file)
          hadd -m %_tmdb_tmp_socket timestart $ [ $+ [ %_tmdb_cb_time_format ] ]
          hadd -m %_tmdb_tmp_socket timeend $ [ $+ [ %_tmdb_cb_time_format ] ]
          if (!$hget(%id,callback)) { return $_tmdb_process(%_tmdb_tmp_socket) }
          else { _tmdb_process %_tmdb_tmp_socket | return $true }


        } 
      }
    }
  }
  if (!$sock(%_tmdb_tmp_socket)) {
    if (%_tmdb_valid_api_key) {
      hadd -m %_tmdb_tmp_socket cmd $!chr(36) $ [ $!+ [ + ] ]  tmdb( $+ %query $+ ) $+ %prop
      hadd -m %_tmdb_tmp_socket cached $false
      hadd -m %_tmdb_tmp_socket query $iif(%query,$v1,null)
      hadd -m %_tmdb_tmp_socket method $hget(%id,method)
      if ($hget(%id,method) == validate) { hadd -m %id method configuration }
      elseif ($hget(%id,method) == authentication) { hadd -m %id method authentication/token/new }
      hadd -m %_tmdb_tmp_socket url $+(/,%_tmdb_api_version,/,$hget(%id,method),?,api_key=,%_tmdb_api_key,$iif(%query,&query= $+ $urlencode(%query)),%more)
      if (%_tmdb_isid_socket == mircsocks) {
        sockopen %_tmdb_sswitch %_tmdb_tmp_socket %_tmdb_api_host %_tmdb_sport
      }
      elseif (%_tmdb_isid_socket == vbsocks) {
        var %file = $json_utf8( $+($iif(%_tmdb_sport == 80,http://,https://),%_tmdb_api_host,$hget(%_tmdb_tmp_socket,url)) , tmdb\temp\ $+ %_tmdb_tmp_socket ).savetofile().nocache()
        if (%file) {
          if ($hget(%id,method) == authentication/token/new) {
            var %r_token = $json_utf8(%file,request_token)
            hadd -m %id method authentication/session/new
            var %more = &request_token= $+ %r_token
            hadd -m %_tmdb_tmp_socket url $+(/,%_tmdb_api_version,/,$hget(%id,method),?,api_key=,%_tmdb_api_key,$iif(%query,&query= $+ $urlencode(%query)),%more)
            var %file = $json_utf8( $+($iif(%_tmdb_sport == 80,http://,https://),%_tmdb_api_host,$hget(%_tmdb_tmp_socket,url)) , tmdb\temp\ $+ %_tmdb_tmp_socket ).savetofile().nocache()
            if (%file) {
              return %file $ json_utf8( %file ,session_id)
            }
            else { goto false }
          }
          else {
            if (!$hget(%id,callback)) { return $_tmdb_process(%_tmdb_tmp_socket) }
            else { _tmdb_process %_tmdb_tmp_socket | return $true }
          }
        }
        else {
          %e VBScript Socket Failed.
          goto false
        }
      }
      else { %e Undefined Socket Type. Please define socket type and try again. | goto false }
      return $true
    }
    else {
      if (%_tmdb_method != validate) { 
        hadd -m %_tmdb_tmp_socket fcmd noop $!chr(36) $ [ $!+ [ + ] ]  tmdb( $+ %query $+ ) $+ %prop
      }
      hadd -m %_tmdb_tmp_socket method validate
      if ($hget($1,method) == validate) { hadd -m %id method configuration }
      hadd -m %_tmdb_tmp_socket url $+(/,%_tmdb_api_version,/configuration,?,api_key=,%_tmdb_api_key)
      sockopen %_tmdb_tmp_socket %_tmdb_api_host %_tmdb_sport
      return $true
    }
  }
  else {
    %e Socket in use - Wow Woaah Keep it down cow-boy. You are using this command extremely fast. This should even appear... never...
    goto false
  }
  return $false
  :false
  if ($hget(%_tmdb_tmp_socket)) hfree %_tmdb_tmp_socket 
  return $false
}
alias _tmdb_isid_clear { if ($hget($1)) hfree $1 }
on *:sockopen:_tmdb_*:{
  sockwrite -tn $sockname GET $hget($sockname,url) HTTP/1.1
  sockwrite -tn $sockname Host: api.themoviedb.org
  sockwrite -tn $sockname User-Agent: mIRC-API/v1-Alpha
  sockwrite -tn $sockname Accept: application/json
  sockwrite -tn $sockname Accept-Charset: UTF-8
  sockwrite -tn $sockname Connection: close
  sockwrite -tn $sockname $crlf $+ $crlf
}
on *:sockread:_tmdb_sock_*:{
  if ($sock($sockname).mark == read) {
    goto nextread
  }
  sockread -f %tmdb
  goto next
  :nextread
  sockread -f &tmdb
  :next
  if ($sock($sockname).mark == read) {
    if (!$exists(temp)) { mkdir temp }
    bwrite tmdb\temp\ $+ $sockname -1 -1 &tmdb
  }
  if (%tmdb == $null) {
    sockmark $sockname read
  }
  ;else { echo -a [Header] %tmdb }
}
on *:sockclose:_tmdb_sock_* {
  hadd -m $sockname timeend $ [ $+ [ %_tmdb_cb_time_format ] ]
  _tmdb_process $sockname
}
alias -l _tmdb_process {
  .timer[_tmdb_timer_ $+ $1 $+ ] -ms 1 3099 _tmdb_clear $1
  var %e,%w,%s
  if (a isin %_tmdb_alert) { %w = echo $color(info) * /tmdb: Warning: }
  else { %w = noop }
  if (b isin %_tmdb_alert) { %e = echo $color(info) * /tmdb: Error: }
  else { %e = noop }
  if (c isin %_tmdb_alert) { %s = echo $color(info) * /tmdb: }
  else { %s = noop }
  var %hashtable $1
  if (%_tmdb_cache > 0) {
    if (!$hget($nopath($1),cached)) {
      var %json = tmdb\temp\ $+ $1
    }
    else {
      var %json = tmdb\db\ $+ $1-
    }
  }
  else {
    var %json = tmdb\temp\ $+ $1
  }
  if ($hget($1,method) == validate) {
    if (!$isid) {
      if ($hget($1,callback)) {
        if ($json_utf8(%json,status_message)) {
          noop $ [ $+ [ $hget($1,callback) ] ] [ $+ [ ($false) ] ] 
        }
        else {
          noop $ [ $+ [ $hget($1,callback) ] ] [ $+ [ ($true) ] ] 
        }
      }
      else {
        if ($json_utf8(%json,status_message)) {
          %e Your API Key is invalid. $v1
          set %_tmdb_valid_api_key $false
          goto end
        }
        else {
          %s Your API Key is valid.
          set %_tmdb_valid_api_key $true
          if ($hget($1,fcmd)) { $v1 }
          goto end
        }
      }
    }
    else {
      if ($json_utf8(%json,status_message)) {
        return $false
      }
      else {
        return $true
      }
    }
  }
  if ($json_utf8(%json,status_code) && $json_utf8(%json,status_code) != 1) {
    var %id = $v1
    if (%id isnum 2-22) {
      %e $json_utf8(%json,status_message)
    }
    goto end
  }
  elseif ($hget($1,method) == configuration) {
    if (%_tmdb_cache_configuration == 1) && (%_tmdb_cache > 0) && (!$hget($1,cached)) {
      .copy -o %json tmdb\system\configuration.json
      var %json tmdb\system\configuration.json
    }
    if (!$isid) {
      noop $ [ $+ [ $iif($hget($1,cbheader),$v1,%_tmdb_def_cb_hd) ] ] [ $+ [ $+ [ ( [ [ $replacecs(%_tmdb_cb_global,$chr(32),$chr(44),@cmd,$hget($1,cmd),@url,$hget($1,url),@query,$hget($1,query),@method,$hget($1,method),@timestart,$hget($1,timestart), $&
        @timeend,$hget($1,timeend),@timeprocess,null,@socket,$1,@totalpages,null,@cached,$hget($1,cached)) ] ] ) ] ]
      noop $ [ $+ [ $iif($hget($1,callback),$v1,_tmdb_def_cb) ] ] [ $+ [ (tmdb\system\configuration.json) ] ]
      noop $ [ $+ [ $iif($hget($1,cbfooter),$v1,%_tmdb_def_cb_ft) ] ] [ $+ [ ( [ [ $replacecs(%_tmdb_cb_global,$chr(32),$chr(44),@cmd,$hget($1,cmd),@url,$hget($1,url),@query,$hget($1,query),@method,$hget($1,method),@timestart,$hget($1,timestart),@timeend, $&
        $hget($1,timeend),@timeprocess,$chr(36) $+ %_tmdb_cb_time_format,@socket,$1,@totalpages,null,@cached,$hget($1,cached)) ] ] ) ] ]
    }
    else {
      return $longfn(tmdb\system\configuration.json)
    }
  }
  elseif ($gettok($hget($1,method),1,47) == search) || (genre/*/movies iswm $hget($1,method)) || ((($gettok($hget($1,method),1,47) == movie) || ($gettok($hget($1,method),1,47) == person)) && ($right($gettok($hget($1,method),2,47),4) !isnum) && ($gettok($hget($1,method),2,47) != latest)) {
    if ($hget($1,allpages) == 1) {
      if ($json_utf8(%json,total_pages) <= 20) {
        if ($json_utf8(%json,page) != $json_utf8(%json,total_pages)) && ($json_utf8(%json,total_pages)) {
          .copy -o %json tmdb\temp\ $+ $replace($hget($1,query),$chr(32),$chr(46)) $+ . $+ $json_utf8(%json,page)
          var %i = 2
          while (%i <= $json_utf8(%json,total_pages)) {
            if (-* iswm $gettok($hget($1,cmd),3,32)) {
              if (*c* iswm $gettok($hget($1,cmd),3,32)) { $gettok($hget($1,cmd),1-3,32) $+ pn $gettok($hget($1,cmd),4,32) %i $gettok($hget($1,cmd),5-,32) }
              else { $gettok($hget($1,cmd),1-3,32) $+ pn %i  $gettok($hget($1,cmd),4-,32) }
            }
            else { $gettok($hget($1,cmd),1-2,32) -pn %i $gettok($hget($1,cmd),3-,32) }
            inc %i
          }
          goto end
        }
      }
      else {
        %w Result pages are over 20. Only first page will be shown.
      }
    }
    if ($hget($1,cont) == 1) {
      .copy -o %json $shortfn(tmdb\temp\ $+ $replace($hget($1,query),$chr(32),$chr(46)) $+ . $+ $json_utf8(%json,page))
      if ($json_utf8(%json,page) == $json_utf8(%json,total_pages)) {
        goto continue

      }
      else {
        goto end
      }
    }
    :continue


    if ($gettok($hget($1,method),2,47) == movie) || (genre/*/movies iswm $hget($1,method)) || ($gettok($hget($1,method),1,47) == movie) {
      var %set = $!replace($iif($hget($1,args),$v1,%_tmdb_cb_ms),$chr(32),$chr(44),@is_for_adults,$json_utf8(%json_new,results,%c,adult),@backdrop_path,$json_utf8(%json_new,results,%c,backdrop_path),@id,$json_utf8(%json_new,results,%c,id), $&
        @original_title,$json_utf8(%json_new,results,%c,original_title), @release_date,$json_utf8(%json_new,results,%c,release_date),@poster_path,$json_utf8(%json_new,results,%c,poster_path),@popularity,$json_utf82(%json_new,results,%c,popularity), $&
        @title,$json_utf8(%json_new,results,%c,title),@vote_average,$json_utf8(%json_new,results,%c,vote_average),@vote_count,$json_utf8(%json_new,results,%c,vote_count),@year,$left($json_utf8(%json_new,results,%c,release_date),4) )
    }
    elseif ($gettok($hget($1,method),2,47) == person) || ($gettok($hget($1,method),1,47) == person) {
      var %set = $!replace($iif($hget($1,args),$v1,%_tmdb_cb_ps),$chr(32),$chr(44),@profile_path,$json_utf8(%json_new,results,%c,profile_path),@id,$json_utf8(%json_new,results,%c,id),@name,$json_utf8(%json_new,results,%c,name),@popularity, $&
        $iif($json_utf8(%json_new,results,%c,popularity),$v1,$false) )
    }
    elseif ($gettok($hget($1,method),2,47) == company) {
      var %set = $!replace($iif($hget($1,args),$v1,%_tmdb_cb_os),$chr(32),$chr(44),@logo_path,$json_utf8(%json_new,results,%c,logo_path),@id,$json_utf8(%json_new,results,%c,id),@name,$json_utf8(%json_new,results,%c,name))
    }
    elseif ($gettok($hget($1,method),2,47) == collection) {
      var %set = $!replace($iif($hget($1,args),$v1,%_tmdb_cb_cs),$chr(32),$chr(44),@backdrop_path,$json_utf8(%json_new,results,%c,backdrop_path),@id,$json_utf8(%json_new,results,%c,id),@name,$json_utf8(%json_new,results,%c,name),@poster_path, $&
        $json_utf8(%json_new,results,%c,poster_path) )
    }
    elseif ($gettok($hget($1,method),2,47) == keyword) {
      var %set = $!replace($iif($hget($1,args),$v1,%_tmdb_cb_ks),$chr(32),$chr(44),@id,$json_utf8(%json_new,results,%c,id),@name,$json_utf8(%json_new,results,%c,name))
    }

    if ($hget($1,cont) == 1) {

      var %i = 1
      noop $ [ $+ [ $iif($hget($1,cbheader),$v1,%_tmdb_def_cb_hd) ] ] [ $+ [ $+ [ ( [ [ $replacecs(%_tmdb_cb_global,$chr(32),$chr(44),@cmd,$hget($1,cmd),@url,$hget($1,url),@query,$hget($1,query),@method,$hget($1,method),@timestart, $&
        $hget($1,timestart),@timeend,$hget($1,timeend),@timeprocess,null,@socket,$1,@totalpages,$json_utf8(%json_new,total_pages),@cached,$hget($1,cached)) ] ] ) ] ]
      while (%i <= $json_utf8(%json,page)) {
        var %json_new = $shortfn(tmdb\temp\ $+ $replace($hget($1,query),$chr(32),$chr(46)) $+ . $+ %i)
        var %c = 0
        while ($json_utf8(%json_new,results,%c)) {  
          var %_tmdb_result = $replace([ [ %set ] ],@query,$hget($1,query),@method,$hget($1,method),@url,$hget($1,url),@cmd,$hget($1,cmd),@timestart,$hget($1,timestart),@timeend,$hget($1,timeend),@cached,$hget($1,cached))
          noop $ [ $+ [ $iif($hget($1,callback),$v1,_tmdb_def_cb) ] ] [ $+ [ ( [ [ $iif(%_tmdb_result,$utfdecode($v1,161),Null) ] ] ) ] ]
          inc %c
        }
        .remove %json_new
        inc %i
      }
      noop $ [ $+ [ $iif($hget($1,cbfooter),$v1,%_tmdb_def_cb_ft) ] ] [ $+ [ ( [ [ $replacecs(%_tmdb_cb_global,$chr(32),$chr(44),@cmd,$hget($1,cmd),@url,$hget($1,url),@query,$hget($1,query),@method,$hget($1,method),@timestart, $&
        $hget($1,timestart),@timeend,$hget($1,timeend),@timeprocess,$chr(36) $+ %_tmdb_cb_time_format,@socket,$1,@totalpages,$json_utf8(%json_new,total_pages),@cached,$hget($1,cached)) ] ] ) ] ]
    }
    else {
      var %json_new = %json
      if (!$isid) {
        var %c = 0
        noop $ [ $+ [ $iif($hget($1,cbheader),$v1,%_tmdb_def_cb_hd) ] ] [ $+ [ ( [ [ $replacecs(%_tmdb_cb_global,$chr(32),$chr(44),@cmd,$hget($1,cmd),@url,$hget($1,url),@query,$hget($1,query),@method,$hget($1,method),@timestart, $&
          $hget($1,timestart),@timeend,$hget($1,timeend),@timeprocess,null,@socket,$1,@totalpages,$json_utf8(%json_new,total_pages),@cached,$hget($1,cached)) ] ] ) ] ]
        while ($json_utf8(%json_new,results,%c)) {
          var %_tmdb_result = $replace([ [ %set ] ],@query,$hget($1,query),@method,$hget($1,method),@url,$hget($1,url),@cmd,$hget($1,cmd),@timestart,$hget($1,timestart),@timeend,$hget($1,timeend),@cached,$hget($1,cached))
          noop $ [ $+ [ $iif($hget($1,callback),$v1,_tmdb_def_cb) ] ] [ $+ [ ( [ [ $iif(%_tmdb_result,$utfdecode($v1,161),Null) ] ] ) ] ]
          inc %c
        }
        noop $ [ $+ [ $iif($hget($1,cbfooter),$v1,%_tmdb_def_cb_ft) ] ] [ $+ [ ( [ [ $replacecs(%_tmdb_cb_global,$chr(32),$chr(44),@cmd,$hget($1,cmd),@url,$hget($1,url),@query,$hget($1,query),@method,$hget($1,method),@timestart, $&
          $hget($1,timestart),@timeend,$hget($1,timeend),@timeprocess,$chr(36) $+ %_tmdb_cb_time_format,@socket,$1,@totalpages,$json_utf8(%json_new,total_pages),@cached,$hget($1,cached)) ] ] ) ] ]
      }
      else { return $longfn(%json) }
    }
  }
  elseif ($hget($1,method) == genre/list) {
    if (%_tmdb_cache_genre == 1) && (%_tmdb_cache > 0) && (!$hget($1,cached)) {
      .copy -o %json tmdb\db\genre.list. $+ $iif($hget($1,language),$v1 $+ .,en.) $+ db
      var %json tmdb\db\genre.list. $+ $iif($hget($1,language),$v1 $+ .,en.) $+ db
    }
    if (!$isid) {
      noop $ [ $+ [ $iif($hget($1,cbheader),$v1,%_tmdb_def_cb_hd) ] ] [ $+ [ ( [ [ $replacecs(%_tmdb_cb_global,$chr(32),$chr(44),@cmd,$hget($1,cmd),@url,$hget($1,url),@query,$hget($1,query),@method,$hget($1,method),@timestart, $&
        $hget($1,timestart),@timeend,$hget($1,timeend),@timeprocess,null,@socket,$1,@totalpages,null,@cached,$hget($1,cached)) ] ] ) ] ]
      var %json_new = %json
      var %i = 1
      while ($json_utf8(%json,genres,%i)) {
        var %_tmdb_result = $replace($replace($iif($hget($1,args),$v1,%_tmdb_cb_gl),$chr(32),$chr(44),@name,$json_utf8(%json_new,genres,%i,name),@id,$json_utf8(%json_new,genres,%i,id)),@query,$hget($1,query),@method,$hget($1,method),@url, $&
          $hget($1,url),@cmd,$hget($1,cmd),@timestart,$hget($1,timestart),@timeend,$hget($1,timeend),@cached,$hget($1,cached))
        noop $ [ $+ [ $iif($hget($1,callback),$v1,_tmdb_def_cb) ] ] [ $+ [ ( [ [ $iif(%_tmdb_result,$v1,Null) ] ] ) ] ]
        inc %i
      }
      noop $ [ $+ [ $iif($hget($1,cbfooter),$v1,%_tmdb_def_cb_ft) ] ] [ $+ [ ( [ [ $replacecs(%_tmdb_cb_global,$chr(32),$chr(44),@cmd,$hget($1,cmd),@url,$hget($1,url),@query,$hget($1,query),@method,$hget($1,method),@timestart,$hget($1,timestart), $&
        @timeend,$hget($1,timeend),@timeprocess,$chr(36) $+ %_tmdb_cb_time_format,@socket,$1,@totalpages,null,@cached,$hget($1,cached)) ] ] ) ] ]
    }
    else {
      return $longfn(%json)
    }
  }

  elseif ($regex($hget($1,method),/(collection/|movie/|person/|list/)/)) {

    if (%_tmdb_cache_ [ $+ [ $remove($regml(1),/) ] ] == 1) && (%_tmdb_cache > 0) && (!$hget($1,cached)) {

      .copy -o %json tmdb\db\ $+ $remove($regml(1),/) $+ . $+ $json_utf8(%json,id) $+ . $+ $iif($hget($1,language),$v1 $+ .,en.) $+ db
      var %json tmdb\db\ $+ $remove($regml(1),/) $+ . $+ $json_utf8(%json,id) $+ . $+ $iif($hget($1,language),$v1 $+ .,en.) $+ db
      if ($gettok($hget($1,method),2,47) == latest) {
        .copy -o %json tmdb\db\ $+ $remove($regml(1),/) $+ .latest. $+ $iif($hget($1,language),$v1 $+ .,en.) $+ db
        var %json tmdb\db\ $+ $remove($regml(1),/) $+ .latest. $+ $iif($hget($1,language),$v1 $+ .,en.) $+ db
      }
    }
    elseif ($hget($1,cached)) {
      var %json tmdb\db\ $+ $remove($regml(1),/) $+ . $+ $json_utf8(%json,id) $+ . $+ $iif($hget($1,language),$v1 $+ .,en.) $+ db
      if ($gettok($hget($1,method),2,47) == latest) {
        var %json tmdb\db\ $+ $remove($regml(1),/) $+ .latest. $+ $iif($hget($1,language),$v1 $+ .,en.) $+ db
      }
    }
    else {
      .copy -o %json tmdb\process\ $+ $nopath(%json)
      var %json = tmdb\process\ $+ $nopath(%json)
      .timer[_tmdb_procces_ $+ $1 $+ ] 1 %_tmdb_clear_process _tmdb_clear_process %json
    }
    if (!$isid) {
      noop $ [ $+ [ $iif($hget($1,cbheader),$v1,%_tmdb_def_cb_hd) ] ] [ $+ [ ( [ [ $replacecs(%_tmdb_cb_global,$chr(32),$chr(44),@cmd,$hget($1,cmd),@url,$replace($hget($1,url),$chr(44),$chr(46)),@query,$hget($1,query),@method,$hget($1,method),@timestart,$hget($1,timestart), $&
        @timeend,$hget($1,timeend),@timeprocess,null,@socket,$1,@totalpages,null,@cached,$hget($1,cached)) ] ] ) ] ]

      noop $ [ $+ [ $iif($hget($1,callback),$v1,_tmdb_def_cb) ] ] [ $+ [ ( %json ) ] ]
      noop $ [ $+ [ $iif($hget($1,cbfooter),$v1,%_tmdb_def_cb_ft) ] ] [ $+ [ ( [ [ $replacecs(%_tmdb_cb_global,$chr(32),$chr(44),@cmd,$hget($1,cmd),@url,$replace($hget($1,url),$chr(44),$chr(46)),@query,$hget($1,query),@method,$hget($1,method),@timestart,$hget($1,timestart), $&
        @timeend,$hget($1,timeend),@timeprocess,$chr(36) $+ %_tmdb_cb_time_format,@socket,$1,@totalpages,null,@cached,$hget($1,cached)) ] ] ) ] ]
    }
    else {
      return $longfn(%json)
    }
  }

  :end
  if (!$hget($nopath($1),cached)) {
    .timer -ms 1 %_tmdb_clear_process .remove tmdb\temp\ $+ $1
  }
  .timer[_tmdb_timer_ $+ $1 $+ ] off
  if ($hget(%hashtable)) .hfree %hashtable
}
alias -l _tmdb_clear_process {
  if ($exists($1-)) .remove $1-
}
alias -l _tmdb_clear {
  hfree $1
  if ($exists(tmdb\temp\ $+ $1)) .remove tmdb\temp\ $+ $1
}
alias -l _tmdb_def_cb_hd {
  if ($isid) { 
    if ($prop == chk)  return $true
    echo -a Starting Results:
    echo -a -
  }
}
alias _tmdb_def_cb {
  if ($isid) { 
    if ($prop == chk)  return $true
    echo -a [ [ $1- ] ]
  }
}
alias -l _tmdb_def_cb_ft {
  if ($isid) { 
    if ($prop == chk)  return $true
    echo -a -
    echo -a Finished Query: $5 On Socket: $1 With total time of process: $iif(%_tmdb_cb_time_format == ctime,$calc($9 - $2) Secs,$calc( ($9 - $2) / 1000 ) Secs) (Cached? $10 $+ )
    echo -a CMD:  $8 
    echo -a URL:  $7 
  }
}
alias -l _tmdb_void { if ($isid) return $true }
/*
***********************************************************
** URL Encode                                            **
** Link http://www.zigwap.com/mirc/sockets.php           **
** By ZigWap                                             **
** Platform:  mIRC                                       **
** Published  Unknown                                    **
***********************************************************
*/
alias urlEncode return $regsubex($$1,/([\W\s])/Sg,$+(%,$base($asc(\t),10,16,2)))
/*
***********************************************************
** $json_utf8                                            **
** Link http://www.hawkee.com/snippet/9969/              **
** By ProIcons                                           **
** Platform:  mIRC                                       **
** Published  Jun 22, 2013                               **
***********************************************************
*/
alias json_utf8 {
  if ($isid) {
    var %c = json_utf8,%x = 2,%str,%p,%v
    while (%x <= $0) {
      %p = $($+($,%x),2)
      if (%p == $null) { noop }
      elseif (%p isnum || $qt($noqt(%p)) == %p) { %str = $+(%str,[,%p,]) }
      else { %str = $+(%str,[',%p,']) }
      inc %x
    }
    if (!$com(%c)) {
      .comopen %c MSScriptControl.ScriptControl
      noop $com(%c,language,4,bstr*,VBScript)
      var %code Function filejson(json) $crlf Dim objStream, strData $crlf Set objStream = CreateObject("ADODB.Stream") $crlf $&
        objStream.CharSet = "utf-8" $crlf objStream.Open $crlf objStream.LoadFromFile(json) $crlf strData = objStream.ReadText() $crlf $&
        filejson = strData $crlf End Function $crlf Function http2json(url) $crlf Set http = CreateObject("MSXML2.ServerXMLHTTP") $crlf $&
        http.open "GET", url, FALSE $crlf http.send "" $crlf http2json=http.responseText $crlf End Function $crlf $&
        Function str2json(json,value) $crlf Set scriptControl = CreateObject("MSScriptControl.ScriptControl") $crlf $&
        scriptControl.Language = "JScript"  $crlf scriptControl.AddCode("x="& json & ";") $crlf str2json= scriptControl.Eval( "x"& value  ) $crlf  $&
        End Function $crlf Function get_json_from_file(json,value) $crlf get_json_from_file=str2json(filejson(json),value) $crlf End Function $crlf $&
        Function get_json_from_http(url,value) $crlf get_json_from_http=str2json(http2json(url),value) $crlf End Function $crlf $&
        Function save_json_from_http(url,loc) $crlf Set fso = CreateObject("Scripting.FileSystemObject") $crlf fullpath = fso.GetAbsolutePathName(loc) $crlf $&
        Dim objStream, strData $crlf Set objStream = CreateObject("ADODB.Stream") $crlf objStream.CharSet = "utf-8" $crlf objStream.Open $crlf $&
        objStream.WriteText http2json(url) $crlf objStream.SaveToFile fullpath, 2 $crlf save_json_from_http=fullpath $crlf End Function
      noop $com(%c,addcode,1,bstr*,%code)
    }
    var %i = 1
    var %save_to_file $false
    var %nocache $false
    while (%i <= $numtok($prop,46) ) {
      if ($gettok($prop,%i,46) == count()) { %str = %str $+ .length }
      if ($gettok($prop,%i,46) == nocache()) { var %nocache $true }
      if ($gettok($prop,%i,46) == savetofile()) { var %save_to_file $true }
      inc %i
    }

    if ($isfile($1)) {
      var %t $+(get_json_from_file,$chr(40),$qt($shortfn($replace($1,\,\\,;,\u003b))),$chr(44),$qt(%str),$chr(41)))
      if ($com(%c,eval,1,bstr*,%t))  return $com(%c).result 
    }
    elseif (http*://* iswm $1) {
      if (%nocache) { var %url = $1 $+ &_ctime_json_= $+ $ctime $+ . $+ $ticks }
      else { var %url = $1 }
      if (!%save_to_file) { var %t $+(get_json_from_http,$chr(40),$qt($replace($qt(%url),;,\u003b)),$chr(44),$qt(%str),$chr(41))) }
      else { var %t $+(save_json_from_http,$chr(40),$qt($replace($qt(%url),;,\u003b)),$chr(44),$qt($2),$chr(41))) }
      if ($com(%c,eval,1,bstr*,%t))  return $com(%c).result
    }
    else {

      var %t $+(str2json,$chr(40),$qt($replace($1,",')),$chr(44),$qt(%str),$chr(41))
      if ($com(%c,eval,1,bstr*,%t))  return $com(%c).result 
    }
  } 
}
alias vbs_download {
  if ($isid) {
    var %c = vbdownload
    if (!$com(%c)) {
      .comopen %c MSScriptControl.ScriptControl
      noop $com(%c,language,4,bstr*,VBScript)
      var %code Function download(url,file) $crlf Dim objStream, strData $crlf Set xml = CreateObject("MSXML2.ServerXMLHTTP") $crlf xml.Open "GET", url, False $crlf xml.Send $crlf $&
        set objStream = CreateObject("ADODB.Stream") $crlf objStream.type=1 $crlf objStream.open $crlf objStream.write xml.responseBody $crlf objStream.savetofile file,2 $crlf $&
        objStream.close $crlf set objStream = nothing $crlf set xml = nothing $crlf download=file $crlf End Function
      write test.vbs %code
      noop $com(%c,addcode,1,bstr*,%code)
    }
    var %t $+(download,$chr(40),$replace($qt($1),;,\u003b),$chr(44),$qt($2),$chr(41)))
    if ($com(%c,eval,1,bstr*,%t)) return $longfn($com(%c).result)

  }
}
alias jsonclearcache { if ($com(jsonidentifier)) { noop $com(jsonidentifier,executestatement,1,bstr,urlcache = {}) } }
/*
***********************************************************
** Copy/Remove Patch                                     **
** By ProIcons                                           **
** Platform:  mIRC                                       **
***********************************************************
*/
alias -l remove {
  remove $qt($1-)
}
alias -l copy {
  if ($1 == -o) {
    var %b = 2
  }
  else { %b = 1 } 
  var %i = 1
  while (!$isfile($gettok($ [ $+ [ [ [ %b $+ - ] ] ] ],1 $+ - $+ %i,32))) {
    if ($calc(%i - 5) > $numtok($ [ $+ [ [ [ %b $+ - ] ] ] ],32)) break
    inc %i
  }
  var %file1 = $gettok($ [ $+ [ [ [ %b $+ - ] ] ] ],1 $+ - $+ %i,32)
  var %file2 = $gettok($ [ $+ [ [ [ %b $+ - ] ] ] ],$calc(%i + 1) $+ -,32)
  if (%b == 2) { if ($exists(%file2)) .remove %file2 }
  .copy $qt(%file1) $qt(%file2)
}
