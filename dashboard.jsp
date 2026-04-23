<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>MoviesHub – Home</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"/>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { background: #111; color: #fff; font-family: 'Poppins', sans-serif; font-size: 14px; }

    .top-nav { background: #1c1c1c; display: flex; align-items: center; padding: 10px 20px; position: relative; }
    .brand { font-size: 22px; font-weight: 700; color: #f5c518; text-decoration: none; white-space: nowrap; }
    .search-wrap { position: absolute; left: 50%; transform: translateX(-50%); width: 380px; }
    .search-wrap input {
      width: 100%; background: #2b2b2b; border: 1px solid #3a3a3a;
      border-radius: 20px; padding: 7px 16px 7px 34px;
      color: #fff; font-size: 13px; font-family: 'Poppins', sans-serif; outline: none;
    }
    .search-wrap input::placeholder { color: #777; }
    .search-icon { position: absolute; left: 11px; top: 50%; transform: translateY(-50%); color: #888; font-size: 13px; pointer-events: none; }
    .nav-links { display: flex; gap: 22px; margin-left: auto; align-items: center; }
    .nav-links a { color: #ccc; text-decoration: none; font-size: 14px; font-weight: 500; }
    .nav-links a.active { color: #fff; font-weight: 600; }
    .nav-links a:hover { color: #f5c518; }

    .outer-wrap {
      background: #1e1e1e; margin: 14px; border-radius: 10px; padding: 18px;
      display: grid; grid-template-columns: 148px 1fr 175px; gap: 18px;
      min-height: calc(100vh - 90px);
    }

    .col-title { font-size: 16px; font-weight: 700; color: #fff; margin-bottom: 12px; }
    .genre-item {
      display: flex; align-items: center; gap: 7px;
      padding: 7px 9px; border-radius: 6px;
      color: #ccc; text-decoration: none; font-size: 14px; font-weight: 500;
      margin-bottom: 2px; transition: background 0.15s, color 0.15s;
    }
    .genre-item:hover, .genre-item.active { background: #2a2a2a; color: #f5c518; }

    .section-title { font-size: 17px; font-weight: 700; color: #fff; margin-bottom: 14px; }
    .movie-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 13px; }
    .movie-card {
      background: #2a2a2a; border-radius: 7px; overflow: hidden;
      text-decoration: none; color: inherit; display: block; transition: transform 0.18s;
    }
    .movie-card:hover { transform: translateY(-3px); color: inherit; }
    .poster-wrap {
      width: 100%; aspect-ratio: 3/4; background: #2a2a2a;
      position: relative; overflow: hidden;
      display: flex; align-items: center; justify-content: center;
    }
    .poster-wrap .poster-emoji { font-size: 32px; opacity: 0.5; }
    .poster {
      position: absolute; inset: 0;
      width: 100%; height: 100%; object-fit: cover; display: block;
    }
    .poster-placeholder {
      width: 100%; aspect-ratio: 3/4; background: #222;
      display: flex; align-items: center; justify-content: center; font-size: 32px;
    }
    .card-info { padding: 7px 9px 9px; }
    .card-title { font-size: 13px; font-weight: 600; color: #fff; margin-bottom: 3px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
    .card-rating { color: #f5c518; font-size: 13px; font-weight: 600; }

    .tr-item {
      display: flex; align-items: center; gap: 9px;
      padding: 10px 0; border-bottom: 1px solid #2a2a2a;
      text-decoration: none; color: inherit; cursor: pointer;
    }
    .tr-item:last-child { border-bottom: none; }
    .tr-item:hover .tr-name { color: #f5c518; }
    .tr-thumb { width: 42px; height: 56px; border-radius: 5px; object-fit: cover; flex-shrink: 0; background: #222; }
    .tr-name { font-size: 13px; font-weight: 600; color: #fff; margin-bottom: 3px; transition: color 0.15s; }
    .tr-rating { font-size: 12px; color: #f5c518; font-weight: 600; }
  </style>
</head>
<body>

  <div class="top-nav">
    <a class="brand" href="dashboard.jsp">MoviesHub</a>
    <div class="search-wrap">
      <span class="search-icon">🔍</span>
      <input type="text" id="searchInput" placeholder="Search movies, actors, genres..."/>
    </div>
    <div class="nav-links">
      <a href="dashboard.jsp" class="active">Home</a>
      <a href="movie.html">Movies</a>
      <a href="watchlist.html">Watchlist</a>
      <a href="#">Sign In</a>
    </div>
  </div>

  <div class="outer-wrap">
    <aside>
      <div class="col-title">Genres</div>
      <a href="#" class="genre-item active">🎭 Comedy</a>
      <a href="#" class="genre-item">👻 Horror</a>
      <a href="#" class="genre-item">🚀 Sci-Fi</a>
      <a href="#" class="genre-item">💕 Romance</a>
      <a href="#" class="genre-item">✨ Animation</a>
    </aside>

    <main>
      <div class="section-title">Trending Movies</div>
      <div class="movie-grid" id="movieGrid">
        <!-- Cards injected by JS using live TMDB data -->
      </div>
    </main>

    <aside>
      <div class="col-title">Top Rated</div>
      <div id="topRatedList">
        <!-- Injected by JS -->
      </div>
    </aside>
  </div>

  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    const IMG = 'https://image.tmdb.org/t/p/';

    // Hardcoded poster paths — avoids TMDB API key dependency
    // Poster paths are stable and don't require authentication to load images
    const TRENDING_IDS = [
      { id: 157336,  title: 'Interstellar',              rating: '8.6', poster: '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg' },
      { id: 299534,  title: 'Avengers: Endgame',         rating: '8.4', poster: '/or06FN3Dka5tukK1e9sl16pB3iy.jpg' },
      { id: 872585,  title: 'Oppenheimer',                rating: '8.5', poster: '/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg' },
      { id: 238,     title: 'The Godfather',              rating: '9.2', poster: '/3bhkrj58Vtu7enYsLebQ3LX7YZe.jpg' },
      { id: 27205,   title: 'Inception',                  rating: '9.0', poster: '/ljsZTbVsrQSqZgWeep2B1QiDKuh.jpg' },
      { id: 155,     title: 'The Dark Knight',            rating: '9.1', poster: '/qJ2tW6WMUDux911r6m7haRef0WH.jpg' },
      { id: 693134,  title: 'Dune: Part Two',             rating: '8.7', poster: '/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg' },
      { id: 361743,  title: 'Top Gun: Maverick',          rating: '8.3', poster: '/62HCnUTziyWcpDaBO2i1DX17ljH.jpg' },
      { id: 634649,  title: 'Spider-Man: No Way Home',    rating: '8.2', poster: '/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg' },
      { id: 558449,  title: 'Gladiator II',               rating: '7.2', poster: '/2cxhvwyE0RYHeIVDqxiAoOwOS1T.jpg' },
      { id: 76600,   title: 'Avatar: Way of Water',       rating: '7.6', poster: '/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg' },
      { id: 911430,  title: 'F1',                         rating: '7.8', poster: '/2uVFm3HXt1OvEKHAAIFgwkVNyN8.jpg' }
    ];

    const TOP_RATED_IDS = [
      { id: 27205,  title: 'Inception',          rating: '9.0', poster: '/ljsZTbVsrQSqZgWeep2B1QiDKuh.jpg' },
      { id: 157336, title: 'Interstellar',        rating: '8.6', poster: '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg' },
      { id: 155,    title: 'The Dark Knight',     rating: '9.1', poster: '/qJ2tW6WMUDux911r6m7haRef0WH.jpg' },
      { id: 299534, title: 'Avengers: Endgame',   rating: '8.4', poster: '/or06FN3Dka5tukK1e9sl16pB3iy.jpg' }
    ];

    function buildGrid() {
      const grid = document.getElementById('movieGrid');
      for (const m of TRENDING_IDS) {
        const card = document.createElement('a');
        card.href      = 'movie.html';
        card.className = 'movie-card';
        card.innerHTML = `
          <div class="poster-wrap">
            <span class="poster-emoji">🎬</span>
            <img class="poster" src="${IMG}w342${m.poster}" alt="${m.title}" onerror="this.remove()"/>
          </div>
          <div class="card-info">
            <div class="card-title">${m.title}</div>
            <div class="card-rating">⭐ ${m.rating}</div>
          </div>`;
        grid.appendChild(card);
      }
    }

    function buildTopRated() {
      const list = document.getElementById('topRatedList');
      for (const m of TOP_RATED_IDS) {
        const item = document.createElement('a');
        item.href      = 'movie.html';
        item.className = 'tr-item';
        // Wrap thumb in a fixed-size box so layout holds even if image breaks
        item.innerHTML = `
          <div style="width:42px;height:56px;border-radius:5px;background:#2a2a2a;flex-shrink:0;overflow:hidden;display:flex;align-items:center;justify-content:center;font-size:16px;">
            <img class="tr-thumb" src="${IMG}w92${m.poster}" alt="${m.title}" style="width:100%;height:100%;object-fit:cover;" onerror="this.remove()"/>
            <span>🎬</span>
          </div>
          <div>
            <div class="tr-name">${m.title}</div>
            <div class="tr-rating">⭐ ${m.rating}</div>
          </div>`;
        list.appendChild(item);
      }
    }

    buildGrid();
    buildTopRated();

    $('.genre-item').on('click', function(e) {
      e.preventDefault();
      $('.genre-item').removeClass('active');
      $(this).addClass('active');
    });

    $('#searchInput').on('input', function() {
      const q = $(this).val().toLowerCase().trim();
      if (!q) { $('.movie-card').show(); return; }
      $('.movie-card').each(function() {
        $(this).toggle($(this).find('.card-title').text().toLowerCase().includes(q));
      });
    });
  </script>
</body>
</html>
