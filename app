<!DOCTYPE html>
<html>
<head>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=DM+Sans:wght@400;500;600&family=DM+Mono:wght@400;500&display=swap');

  * { box-sizing: border-box; margin: 0; padding: 0; }

  :root {
    --font-display: 'Bebas Neue', sans-serif;
    --font-body: 'DM Sans', sans-serif;
    --font-mono: 'DM Mono', monospace;
    --bg: #0a0a0a;
    --surface: #141414;
    --surface2: #1e1e1e;
    --surface3: #252525;
    --border: #2a2a2a;
    --text: #f0f0f0;
    --muted: #888;
    --accent: #c8f135;
    --accent-dim: rgba(200,241,53,0.12);
    --accent-mid: rgba(200,241,53,0.3);
    --red: #ff4444;
    --blue: #4da6ff;
    --orange: #ff8c42;
    --teal: #3de8b0;
  }

  body {
    font-family: var(--font-body);
    background: var(--bg);
    color: var(--text);
    min-height: 100vh;
    font-size: 14px;
  }

  .app { display: flex; flex-direction: column; min-height: 100vh; }

  .header {
    padding: 20px 24px 16px;
    border-bottom: 1px solid var(--border);
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: var(--bg);
    position: sticky;
    top: 0;
    z-index: 10;
  }

  .logo {
    font-family: var(--font-display);
    font-size: 26px;
    letter-spacing: 2px;
    color: var(--accent);
  }

  .logo span { color: var(--text); }

  .nav {
    display: flex;
    gap: 4px;
  }

  .nav-btn {
    padding: 7px 14px;
    border-radius: 6px;
    border: 1px solid transparent;
    background: transparent;
    color: var(--muted);
    font-family: var(--font-body);
    font-size: 13px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.15s;
  }

  .nav-btn.active, .nav-btn:hover {
    background: var(--surface2);
    border-color: var(--border);
    color: var(--text);
  }

  .nav-btn.active { color: var(--accent); border-color: var(--accent-mid); }

  .content { flex: 1; padding: 24px; max-width: 900px; margin: 0 auto; width: 100%; }

  .page { display: none; }
  .page.active { display: block; }

  .section-title {
    font-family: var(--font-display);
    font-size: 36px;
    letter-spacing: 1px;
    margin-bottom: 6px;
    color: var(--text);
  }

  .section-sub { color: var(--muted); font-size: 13px; margin-bottom: 24px; }

  .grid-2 { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; margin-bottom: 12px; }
  .grid-3 { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 12px; margin-bottom: 12px; }
  .grid-4 { display: grid; grid-template-columns: repeat(4, 1fr); gap: 12px; margin-bottom: 12px; }

  .card {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 18px;
    transition: border-color 0.2s;
  }

  .card:hover { border-color: #3a3a3a; }

  .card-label {
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    color: var(--muted);
    margin-bottom: 10px;
    font-weight: 500;
  }

  .card-value {
    font-family: var(--font-display);
    font-size: 38px;
    line-height: 1;
    color: var(--text);
    letter-spacing: 1px;
  }

  .card-value.green { color: var(--accent); }
  .card-value.red { color: var(--red); }
  .card-value.blue { color: var(--blue); }
  .card-value.orange { color: var(--orange); }

  .card-delta {
    margin-top: 6px;
    font-size: 12px;
    color: var(--muted);
    font-family: var(--font-mono);
  }

  .card-delta .pos { color: var(--teal); }
  .card-delta .neg { color: var(--red); }

  .panel {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 12px;
  }

  .panel-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 16px;
  }

  .panel-title {
    font-size: 15px;
    font-weight: 600;
    color: var(--text);
  }

  .badge {
    font-size: 11px;
    padding: 3px 8px;
    border-radius: 4px;
    font-weight: 500;
    font-family: var(--font-mono);
  }

  .badge.green { background: var(--accent-dim); color: var(--accent); border: 1px solid var(--accent-mid); }
  .badge.blue { background: rgba(77,166,255,0.1); color: var(--blue); border: 1px solid rgba(77,166,255,0.3); }
  .badge.orange { background: rgba(255,140,66,0.1); color: var(--orange); border: 1px solid rgba(255,140,66,0.3); }
  .badge.red { background: rgba(255,68,68,0.1); color: var(--red); border: 1px solid rgba(255,68,68,0.3); }

  .progress-row {
    margin-bottom: 14px;
  }

  .progress-header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 6px;
    font-size: 13px;
    color: var(--muted);
  }

  .progress-header strong { color: var(--text); font-weight: 500; }
  .progress-header span { font-family: var(--font-mono); font-size: 12px; }

  .progress-bar {
    height: 6px;
    background: var(--surface3);
    border-radius: 3px;
    overflow: hidden;
  }

  .progress-fill {
    height: 100%;
    border-radius: 3px;
    transition: width 0.5s ease;
  }

  .fill-green { background: var(--accent); }
  .fill-blue { background: var(--blue); }
  .fill-orange { background: var(--orange); }
  .fill-red { background: var(--red); }
  .fill-teal { background: var(--teal); }

  .entry-row {
    display: flex;
    gap: 8px;
    margin-bottom: 12px;
    flex-wrap: wrap;
  }

  .entry-row input, .entry-row select {
    flex: 1;
    min-width: 100px;
    background: var(--surface2);
    border: 1px solid var(--border);
    border-radius: 8px;
    padding: 9px 12px;
    color: var(--text);
    font-family: var(--font-body);
    font-size: 13px;
    outline: none;
    transition: border-color 0.15s;
  }

  .entry-row input:focus, .entry-row select:focus {
    border-color: var(--accent-mid);
  }

  .entry-row input::placeholder { color: var(--muted); }

  .btn {
    padding: 9px 18px;
    border-radius: 8px;
    border: none;
    font-family: var(--font-body);
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.15s;
    white-space: nowrap;
  }

  .btn-primary {
    background: var(--accent);
    color: #0a0a0a;
  }

  .btn-primary:hover { background: #d4f84a; transform: translateY(-1px); }
  .btn-primary:active { transform: scale(0.98); }

  .btn-ghost {
    background: var(--surface2);
    color: var(--text);
    border: 1px solid var(--border);
  }

  .btn-ghost:hover { border-color: #3a3a3a; }

  .log-list { display: flex; flex-direction: column; gap: 8px; }

  .log-item {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 10px 14px;
    background: var(--surface2);
    border-radius: 8px;
    font-size: 13px;
    border: 1px solid transparent;
    transition: border-color 0.2s;
  }

  .log-item:hover { border-color: var(--border); }

  .log-icon {
    width: 32px;
    height: 32px;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 16px;
    flex-shrink: 0;
  }

  .log-icon.gym { background: rgba(200,241,53,0.1); }
  .log-icon.edu { background: rgba(77,166,255,0.1); }
  .log-icon.fin { background: rgba(61,232,176,0.1); }
  .log-icon.goal { background: rgba(255,140,66,0.1); }

  .log-info { flex: 1; }
  .log-title { font-weight: 500; color: var(--text); margin-bottom: 2px; }
  .log-meta { color: var(--muted); font-size: 12px; font-family: var(--font-mono); }
  .log-value { font-family: var(--font-mono); font-size: 13px; color: var(--muted); }

  .mentor-wrap {
    display: flex;
    flex-direction: column;
    height: calc(100vh - 160px);
  }

  .mentor-header {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 16px 20px;
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px 12px 0 0;
    border-bottom: none;
  }

  .mentor-avatar {
    width: 42px;
    height: 42px;
    border-radius: 10px;
    background: var(--accent-dim);
    border: 1px solid var(--accent-mid);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
  }

  .mentor-name {
    font-weight: 600;
    font-size: 15px;
  }

  .mentor-status {
    font-size: 12px;
    color: var(--teal);
    font-family: var(--font-mono);
  }

  .mentor-status::before {
    content: '';
    display: inline-block;
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background: var(--teal);
    margin-right: 6px;
  }

  .mentor-mode {
    margin-left: auto;
    display: flex;
    gap: 6px;
  }

  .mode-tag {
    font-size: 11px;
    padding: 3px 8px;
    border-radius: 4px;
    font-family: var(--font-mono);
    font-weight: 500;
    cursor: pointer;
    border: 1px solid var(--border);
    background: transparent;
    color: var(--muted);
    transition: all 0.15s;
  }

  .mode-tag.active {
    background: var(--accent-dim);
    border-color: var(--accent-mid);
    color: var(--accent);
  }

  .chat-area {
    flex: 1;
    overflow-y: auto;
    padding: 20px;
    background: var(--surface);
    border: 1px solid var(--border);
    border-top: none;
    border-bottom: none;
    display: flex;
    flex-direction: column;
    gap: 16px;
  }

  .chat-area::-webkit-scrollbar { width: 4px; }
  .chat-area::-webkit-scrollbar-track { background: transparent; }
  .chat-area::-webkit-scrollbar-thumb { background: var(--border); border-radius: 2px; }

  .msg {
    display: flex;
    gap: 12px;
    animation: fadeUp 0.2s ease;
  }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(8px); }
    to { opacity: 1; transform: translateY(0); }
  }

  .msg.user { flex-direction: row-reverse; }

  .msg-avatar {
    width: 32px;
    height: 32px;
    border-radius: 8px;
    flex-shrink: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 14px;
    font-weight: 600;
    font-family: var(--font-mono);
  }

  .msg-avatar.mentor {
    background: var(--accent-dim);
    border: 1px solid var(--accent-mid);
    color: var(--accent);
    font-size: 16px;
  }

  .msg-avatar.user {
    background: var(--surface3);
    border: 1px solid var(--border);
    color: var(--muted);
  }

  .msg-bubble {
    max-width: 78%;
    padding: 12px 16px;
    border-radius: 10px;
    font-size: 14px;
    line-height: 1.6;
  }

  .msg.mentor .msg-bubble {
    background: var(--surface2);
    border: 1px solid var(--border);
    color: var(--text);
    border-top-left-radius: 2px;
  }

  .msg.user .msg-bubble {
    background: var(--accent);
    color: #0a0a0a;
    font-weight: 500;
    border-top-right-radius: 2px;
  }

  .typing-indicator {
    display: flex;
    gap: 4px;
    align-items: center;
    padding: 4px 0;
  }

  .typing-dot {
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background: var(--muted);
    animation: pulse 1.2s infinite;
  }

  .typing-dot:nth-child(2) { animation-delay: 0.2s; }
  .typing-dot:nth-child(3) { animation-delay: 0.4s; }

  @keyframes pulse {
    0%, 80%, 100% { opacity: 0.3; transform: scale(0.8); }
    40% { opacity: 1; transform: scale(1); }
  }

  .chat-input-area {
    display: flex;
    gap: 10px;
    padding: 14px 16px;
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 0 0 12px 12px;
    border-top: 1px solid var(--border);
  }

  .chat-input {
    flex: 1;
    background: var(--surface2);
    border: 1px solid var(--border);
    border-radius: 8px;
    padding: 10px 14px;
    color: var(--text);
    font-family: var(--font-body);
    font-size: 14px;
    outline: none;
    resize: none;
    transition: border-color 0.15s;
  }

  .chat-input:focus { border-color: var(--accent-mid); }
  .chat-input::placeholder { color: var(--muted); }

  .quick-prompts {
    display: flex;
    gap: 6px;
    flex-wrap: wrap;
    margin-bottom: 12px;
  }

  .quick-btn {
    padding: 6px 12px;
    border-radius: 20px;
    background: var(--surface2);
    border: 1px solid var(--border);
    color: var(--muted);
    font-size: 12px;
    cursor: pointer;
    transition: all 0.15s;
    font-family: var(--font-body);
  }

  .quick-btn:hover {
    border-color: var(--accent-mid);
    color: var(--accent);
    background: var(--accent-dim);
  }

  .divider { height: 1px; background: var(--border); margin: 20px 0; }

  .goal-card {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 14px;
    background: var(--surface2);
    border-radius: 10px;
    border: 1px solid var(--border);
    margin-bottom: 8px;
    transition: border-color 0.2s;
  }

  .goal-card:hover { border-color: #3a3a3a; }

  .goal-check {
    width: 22px;
    height: 22px;
    border-radius: 6px;
    border: 2px solid var(--border);
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    transition: all 0.15s;
    font-size: 12px;
  }

  .goal-check.done {
    background: var(--accent);
    border-color: var(--accent);
    color: #0a0a0a;
  }

  .goal-text { flex: 1; }
  .goal-title { font-weight: 500; font-size: 14px; }
  .goal-title.done { text-decoration: line-through; color: var(--muted); }
  .goal-cat { font-size: 11px; color: var(--muted); margin-top: 2px; font-family: var(--font-mono); }

  .heatmap { display: grid; grid-template-columns: repeat(13, 1fr); gap: 3px; }
  .heat-cell {
    aspect-ratio: 1;
    border-radius: 2px;
    background: var(--surface2);
    cursor: default;
  }
  .heat-cell.l1 { background: rgba(200,241,53,0.2); }
  .heat-cell.l2 { background: rgba(200,241,53,0.45); }
  .heat-cell.l3 { background: rgba(200,241,53,0.7); }
  .heat-cell.l4 { background: var(--accent); }

  .streak-num {
    font-family: var(--font-display);
    font-size: 48px;
    color: var(--accent);
    letter-spacing: 2px;
    line-height: 1;
  }

  .fin-bar {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 12px;
  }

  .fin-label { font-size: 13px; color: var(--muted); width: 100px; flex-shrink: 0; }
  .fin-bar-track { flex: 1; height: 8px; background: var(--surface3); border-radius: 4px; overflow: hidden; }
  .fin-bar-fill { height: 100%; border-radius: 4px; }
  .fin-amount { font-family: var(--font-mono); font-size: 12px; color: var(--muted); width: 80px; text-align: right; flex-shrink: 0; }
</style>
</head>
<body>
<div class="app">
  <div class="header">
    <div class="logo">FORGE<span>SELF</span></div>
    <nav class="nav">
      <button class="nav-btn active" onclick="switchPage('dashboard')">Dashboard</button>
      <button class="nav-btn" onclick="switchPage('gym')">Gym</button>
      <button class="nav-btn" onclick="switchPage('edu')">Education</button>
      <button class="nav-btn" onclick="switchPage('finance')">Finance</button>
      <button class="nav-btn" onclick="switchPage('goals')">Goals</button>
      <button class="nav-btn" onclick="switchPage('mentor')">Mentor</button>
    </nav>
  </div>

  <div class="content">

    <!-- DASHBOARD -->
    <div class="page active" id="page-dashboard">
      <div class="section-title">OVERVIEW</div>
      <div class="section-sub">Your life at a glance — updated as you log</div>

      <div class="grid-4">
        <div class="card">
          <div class="card-label">Gym Sessions</div>
          <div class="card-value green" id="stat-gym">0</div>
          <div class="card-delta">this month</div>
        </div>
        <div class="card">
          <div class="card-label">Courses Active</div>
          <div class="card-value blue" id="stat-edu">0</div>
          <div class="card-delta">in progress</div>
        </div>
        <div class="card">
          <div class="card-label">Savings Rate</div>
          <div class="card-value orange" id="stat-save">0%</div>
          <div class="card-delta">of income</div>
        </div>
        <div class="card">
          <div class="card-label">Goals Done</div>
          <div class="card-value" id="stat-goals">0/0</div>
          <div class="card-delta">completed</div>
        </div>
      </div>

      <div class="grid-2">
        <div class="panel">
          <div class="panel-header">
            <div class="panel-title">Activity Log</div>
            <span class="badge green" id="streak-badge">0 day streak</span>
          </div>
          <div class="log-list" id="activity-log">
            <div style="color: var(--muted); font-size: 13px; padding: 12px 0; text-align: center;">No entries yet — start logging</div>
          </div>
        </div>
        <div class="panel">
          <div class="panel-header">
            <div class="panel-title">Weekly Activity</div>
            <span class="badge blue">13 weeks</span>
          </div>
          <div class="heatmap" id="heatmap"></div>
          <div style="margin-top: 16px;">
            <div style="font-size: 12px; color: var(--muted); margin-bottom: 4px; font-family: var(--font-mono);">CURRENT STREAK</div>
            <div class="streak-num" id="streak-count">0</div>
            <div style="font-size: 12px; color: var(--muted); margin-top: 2px;">days in a row</div>
          </div>
        </div>
      </div>
    </div>

    <!-- GYM -->
    <div class="page" id="page-gym">
      <div class="section-title">GYM TRACKER</div>
      <div class="section-sub">Log workouts, track PRs, monitor volume</div>

      <div class="panel">
        <div class="panel-title" style="margin-bottom: 14px;">Log Workout</div>
        <div class="entry-row">
          <select id="gym-type">
            <option value="">Workout type...</option>
            <option>Push (Chest/Shoulders/Tris)</option>
            <option>Pull (Back/Biceps)</option>
            <option>Legs</option>
            <option>Full Body</option>
            <option>Cardio</option>
            <option>Rest/Active Recovery</option>
          </select>
          <input type="number" id="gym-duration" placeholder="Duration (min)" min="1" max="300" />
          <button class="btn btn-primary" onclick="logGym()">Log Session</button>
        </div>
        <div class="entry-row">
          <input type="text" id="gym-note" placeholder="Notes (e.g. 'Hit bench PR 120kg, felt strong')" />
        </div>
      </div>

      <div class="grid-3">
        <div class="panel">
          <div class="panel-header">
            <div class="panel-title">Key Lifts</div>
            <span class="badge green">PRs</span>
          </div>
          <div class="progress-row">
            <div class="progress-header"><strong>Bench Press</strong><span id="pr-bench">—</span></div>
            <div class="progress-bar"><div class="progress-fill fill-green" id="bar-bench" style="width:0%"></div></div>
          </div>
          <div class="progress-row">
            <div class="progress-header"><strong>Squat</strong><span id="pr-squat">—</span></div>
            <div class="progress-bar"><div class="progress-fill fill-blue" id="bar-squat" style="width:0%"></div></div>
          </div>
          <div class="progress-row">
            <div class="progress-header"><strong>Deadlift</strong><span id="pr-dead">—</span></div>
            <div class="progress-bar"><div class="progress-fill fill-orange" id="bar-dead" style="width:0%"></div></div>
          </div>
          <div class="progress-row">
            <div class="progress-header"><strong>OHP</strong><span id="pr-ohp">—</span></div>
            <div class="progress-bar"><div class="progress-fill fill-teal" id="bar-ohp" style="width:0%"></div></div>
          </div>
          <div style="margin-top: 12px; font-size: 12px; color: var(--muted);">Tap "Mentor" to log specific lift PRs</div>
        </div>
        <div class="panel" style="grid-column: span 2;">
          <div class="panel-header">
            <div class="panel-title">Session History</div>
            <span class="badge blue" id="total-sessions">0 sessions</span>
          </div>
          <div class="log-list" id="gym-log">
            <div style="color: var(--muted); font-size: 13px; padding: 12px 0; text-align: center;">No workouts logged yet</div>
          </div>
        </div>
      </div>
    </div>

    <!-- EDUCATION -->
    <div class="page" id="page-edu">
      <div class="section-title">EDUCATION</div>
      <div class="section-sub">Books, courses, certifications, and skills</div>

      <div class="panel">
        <div class="panel-title" style="margin-bottom: 14px;">Add Learning Entry</div>
        <div class="entry-row">
          <input type="text" id="edu-name" placeholder="Course / Book / Skill name..." />
          <select id="edu-type">
            <option value="">Type...</option>
            <option>Book</option>
            <option>Online Course</option>
            <option>Certification</option>
            <option>Skill Practice</option>
            <option>Podcast/Video</option>
          </select>
        </div>
        <div class="entry-row">
          <input type="number" id="edu-hours" placeholder="Hours spent" min="0" step="0.5" />
          <input type="number" id="edu-progress" placeholder="Progress % (0-100)" min="0" max="100" />
          <button class="btn btn-primary" onclick="logEdu()">Add Entry</button>
        </div>
      </div>

      <div class="panel">
        <div class="panel-header">
          <div class="panel-title">Active Learning</div>
          <span class="badge blue" id="total-hours">0 hrs total</span>
        </div>
        <div id="edu-list">
          <div style="color: var(--muted); font-size: 13px; padding: 12px 0; text-align: center;">Nothing added yet</div>
        </div>
      </div>
    </div>

    <!-- FINANCE -->
    <div class="page" id="page-finance">
      <div class="section-title">FINANCE</div>
      <div class="section-sub">Income, savings, and financial progress</div>

      <div class="panel">
        <div class="panel-title" style="margin-bottom: 14px;">Set Monthly Numbers</div>
        <div class="entry-row">
          <input type="number" id="fin-income" placeholder="Monthly income (€)" min="0" />
          <input type="number" id="fin-expenses" placeholder="Monthly expenses (€)" min="0" />
          <input type="number" id="fin-saved" placeholder="Amount saved this month (€)" min="0" />
          <button class="btn btn-primary" onclick="logFinance()">Update</button>
        </div>
      </div>

      <div class="grid-2">
        <div class="panel">
          <div class="panel-header">
            <div class="panel-title">Financial Snapshot</div>
          </div>
          <div class="fin-bar">
            <div class="fin-label">Income</div>
            <div class="fin-bar-track"><div class="fin-bar-fill fill-teal" id="fbar-income" style="width:100%; background: var(--teal);"></div></div>
            <div class="fin-amount" id="fin-income-show">€—</div>
          </div>
          <div class="fin-bar">
            <div class="fin-label">Expenses</div>
            <div class="fin-bar-track"><div class="fin-bar-fill" id="fbar-expenses" style="width:0%; background: var(--red);"></div></div>
            <div class="fin-amount" id="fin-expenses-show">€—</div>
          </div>
          <div class="fin-bar">
            <div class="fin-label">Saved</div>
            <div class="fin-bar-track"><div class="fin-bar-fill" id="fbar-saved" style="width:0%; background: var(--accent);"></div></div>
            <div class="fin-amount" id="fin-saved-show">€—</div>
          </div>
          <div class="divider"></div>
          <div style="display: flex; justify-content: space-between; align-items: baseline;">
            <div style="font-size: 13px; color: var(--muted);">Savings rate</div>
            <div style="font-family: var(--font-display); font-size: 32px; color: var(--accent);" id="savings-rate-big">0%</div>
          </div>
        </div>
        <div class="panel">
          <div class="panel-header">
            <div class="panel-title">Financial Goals</div>
          </div>
          <div class="entry-row">
            <input type="text" id="fin-goal-name" placeholder="Goal name (e.g. Emergency Fund)" />
            <input type="number" id="fin-goal-target" placeholder="Target (€)" />
            <input type="number" id="fin-goal-current" placeholder="Current (€)" />
            <button class="btn btn-ghost" onclick="addFinGoal()">Add</button>
          </div>
          <div id="fin-goals-list">
            <div style="color: var(--muted); font-size: 13px; padding: 12px 0; text-align: center;">No financial goals yet</div>
          </div>
        </div>
      </div>
    </div>

    <!-- GOALS -->
    <div class="page" id="page-goals">
      <div class="section-title">GOALS</div>
      <div class="section-sub">What you're working toward — nothing vague allowed</div>

      <div class="panel">
        <div class="panel-title" style="margin-bottom: 14px;">Add Goal</div>
        <div class="entry-row">
          <input type="text" id="goal-title" placeholder="Be specific: 'Bench 100kg by June 2025'" />
          <select id="goal-cat">
            <option>Gym</option>
            <option>Education</option>
            <option>Finance</option>
            <option>Mindset</option>
            <option>Career</option>
            <option>Health</option>
            <option>Other</option>
          </select>
          <input type="date" id="goal-deadline" />
          <button class="btn btn-primary" onclick="addGoal()">Add Goal</button>
        </div>
      </div>

      <div class="grid-2">
        <div class="panel">
          <div class="panel-header">
            <div class="panel-title">Active Goals</div>
            <span class="badge orange" id="active-count">0</span>
          </div>
          <div id="goals-active">
            <div style="color: var(--muted); font-size: 13px; padding: 12px 0; text-align: center;">No active goals — add some</div>
          </div>
        </div>
        <div class="panel">
          <div class="panel-header">
            <div class="panel-title">Completed</div>
            <span class="badge green" id="done-count">0</span>
          </div>
          <div id="goals-done">
            <div style="color: var(--muted); font-size: 13px; padding: 12px 0; text-align: center;">None completed yet</div>
          </div>
        </div>
      </div>
    </div>

    <!-- MENTOR -->
    <div class="page" id="page-mentor">
      <div class="mentor-wrap">
        <div class="mentor-header">
          <div class="mentor-avatar">⚡</div>
          <div>
            <div class="mentor-name">Your Mentor</div>
            <div class="mentor-status">Online — no filter mode</div>
          </div>
          <div class="mentor-mode">
            <button class="mode-tag active" id="mode-raw" onclick="setMode('raw')">RAW</button>
            <button class="mode-tag" id="mode-coach" onclick="setMode('coach')">COACH</button>
            <button class="mode-tag" id="mode-analyze" onclick="setMode('analyze')">ANALYZE</button>
          </div>
        </div>

        <div class="quick-prompts" style="padding: 10px 16px; background: var(--surface); border-left: 1px solid var(--border); border-right: 1px solid var(--border);">
          <button class="quick-btn" onclick="quickAsk('Am I making real progress or just going through the motions?')">Am I actually progressing?</button>
          <button class="quick-btn" onclick="quickAsk('What should I focus on this week?')">This week's priority</button>
          <button class="quick-btn" onclick="quickAsk('Be brutally honest — what is my biggest weakness holding me back?')">Brutally honest weak spots</button>
          <button class="quick-btn" onclick="quickAsk('Give me a no-excuses action plan for the next 30 days')">30-day action plan</button>
          <button class="quick-btn" onclick="quickAsk('How do I actually build discipline that sticks?')">Build real discipline</button>
        </div>

        <div class="chat-area" id="chat-area">
          <div class="msg mentor">
            <div class="msg-avatar mentor">⚡</div>
            <div class="msg-bubble">I'm your mentor. No sugarcoating, no generic advice, no babying.<br><br>Tell me where you're at — gym, money, education, mindset — and I'll tell you exactly what you need to hear. Use the tabs to log your progress and I'll factor it all in.<br><br>What do you want to work on?</div>
          </div>
        </div>

        <div class="chat-input-area">
          <textarea class="chat-input" id="chat-input" rows="1" placeholder="Ask anything — be real with me..." onkeydown="handleKey(event)"></textarea>
          <button class="btn btn-primary" onclick="sendMsg()">Send</button>
        </div>
      </div>
    </div>

  </div>
</div>

<script>
  const state = {
    gymSessions: [],
    eduEntries: [],
    finances: { income: 0, expenses: 0, saved: 0 },
    finGoals: [],
    goals: [],
    activityDates: [],
    mentorMode: 'raw'
  };

  const modePrompts = {
    raw: `You are a brutally honest, no-BS life mentor. You speak directly, call out excuses immediately, never sugarcoat. Think: no-nonsense coach who genuinely wants this person to succeed. Use short, punchy sentences. Be harsh when needed. Never be rude for its own sake — only truth. When someone makes an excuse, name it directly. When they're on the right track, acknowledge it briefly then push harder.`,
    coach: `You are an experienced life coach — direct, strategic, and supportive. You give structured guidance with clear steps. You acknowledge effort but always push for more. Ask good questions to help the person think clearly.`,
    analyze: `You are an analytical advisor. When asked questions, break down the situation logically, identify patterns, give data-driven perspective. Point out what the numbers say about their habits. Be precise and insightful.`
  };

  function getSystemPrompt() {
    const gymCount = state.gymSessions.length;
    const eduHours = state.eduEntries.reduce((a,e) => a + (e.hours||0), 0);
    const saveRate = state.finances.income > 0 ? Math.round((state.finances.saved / state.finances.income) * 100) : 0;
    const doneGoals = state.goals.filter(g => g.done).length;
    const totalGoals = state.goals.length;
    const context = gymCount || eduHours || state.finances.income ? `\n\nUser's current data: ${gymCount} gym sessions logged, ${Math.round(eduHours)} education hours, ${saveRate}% savings rate, ${doneGoals}/${totalGoals} goals completed.` : '';
    return modePrompts[state.mentorMode] + context;
  }

  function switchPage(page) {
    document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
    document.querySelectorAll('.nav-btn').forEach(b => b.classList.remove('active'));
    document.getElementById('page-' + page).classList.add('active');
    event.target.classList.add('active');
    updateDashboard();
  }

  function setMode(mode) {
    state.mentorMode = mode;
    document.querySelectorAll('.mode-tag').forEach(t => t.classList.remove('active'));
    document.getElementById('mode-' + mode).classList.add('active');
  }

  function addToActivity(icon, iconClass, title, meta, value) {
    state.activityDates.push(new Date().toDateString());
    const log = document.getElementById('activity-log');
    const empty = log.querySelector('[style*="text-align: center"]');
    if (empty) empty.remove();
    const item = document.createElement('div');
    item.className = 'log-item';
    item.innerHTML = `<div class="log-icon ${iconClass}">${icon}</div><div class="log-info"><div class="log-title">${title}</div><div class="log-meta">${meta} · just now</div></div><div class="log-value">${value}</div>`;
    log.prepend(item);
    if (log.children.length > 5) log.lastChild.remove();
    updateStreak();
    updateHeatmap();
  }

  function logGym() {
    const type = document.getElementById('gym-type').value;
    const dur = document.getElementById('gym-duration').value;
    const note = document.getElementById('gym-note').value;
    if (!type) return;
    const session = { type, duration: dur || '?', note, date: new Date() };
    state.gymSessions.push(session);
    addToActivity('🏋️', 'gym', type, dur ? dur + ' min' : 'duration not set', note ? '✓' : '');
    const logEl = document.getElementById('gym-log');
    const empty = logEl.querySelector('[style*="text-align: center"]');
    if (empty) empty.remove();
    const item = document.createElement('div');
    item.className = 'log-item';
    item.innerHTML = `<div class="log-icon gym">🏋️</div><div class="log-info"><div class="log-title">${type}</div><div class="log-meta">${dur ? dur + ' min · ' : ''}${note || 'No notes'}</div></div><div class="log-value" style="color: var(--accent);">${new Date().toLocaleDateString()}</div>`;
    logEl.prepend(item);
    document.getElementById('gym-type').value = '';
    document.getElementById('gym-duration').value = '';
    document.getElementById('gym-note').value = '';
    document.getElementById('total-sessions').textContent = state.gymSessions.length + ' sessions';
    updateDashboard();
  }

  function logEdu() {
    const name = document.getElementById('edu-name').value.trim();
    const type = document.getElementById('edu-type').value;
    const hours = parseFloat(document.getElementById('edu-hours').value) || 0;
    const progress = parseInt(document.getElementById('edu-progress').value) || 0;
    if (!name) return;
    const entry = { name, type, hours, progress, date: new Date() };
    state.eduEntries.push(entry);
    addToActivity('📚', 'edu', name, type || 'Learning', hours + 'h');
    renderEduList();
    document.getElementById('edu-name').value = '';
    document.getElementById('edu-hours').value = '';
    document.getElementById('edu-progress').value = '';
    updateDashboard();
  }

  function renderEduList() {
    const list = document.getElementById('edu-list');
    list.innerHTML = '';
    let totalHours = 0;
    state.eduEntries.forEach(e => {
      totalHours += e.hours || 0;
      const div = document.createElement('div');
      div.className = 'progress-row';
      const colorClass = e.progress >= 100 ? 'fill-green' : e.progress >= 50 ? 'fill-blue' : 'fill-orange';
      div.innerHTML = `<div class="progress-header"><strong>${e.name}</strong> <span>${e.type || ''} · ${e.hours}h · ${e.progress}%</span></div><div class="progress-bar"><div class="progress-fill ${colorClass}" style="width:${e.progress}%"></div></div>`;
      list.appendChild(div);
    });
    document.getElementById('total-hours').textContent = Math.round(totalHours) + ' hrs total';
  }

  function logFinance() {
    const income = parseFloat(document.getElementById('fin-income').value) || 0;
    const expenses = parseFloat(document.getElementById('fin-expenses').value) || 0;
    const saved = parseFloat(document.getElementById('fin-saved').value) || 0;
    state.finances = { income, expenses, saved };
    const rate = income > 0 ? Math.round((saved / income) * 100) : 0;
    document.getElementById('fin-income-show').textContent = '€' + income.toLocaleString();
    document.getElementById('fin-expenses-show').textContent = '€' + expenses.toLocaleString();
    document.getElementById('fin-saved-show').textContent = '€' + saved.toLocaleString();
    document.getElementById('savings-rate-big').textContent = rate + '%';
    document.getElementById('fbar-expenses').style.width = income > 0 ? Math.min(100, Math.round((expenses/income)*100)) + '%' : '0%';
    document.getElementById('fbar-saved').style.width = income > 0 ? Math.min(100, Math.round((saved/income)*100)) + '%' : '0%';
    addToActivity('💰', 'fin', 'Finance updated', 'Monthly snapshot', rate + '% saved');
    updateDashboard();
  }

  function addFinGoal() {
    const name = document.getElementById('fin-goal-name').value.trim();
    const target = parseFloat(document.getElementById('fin-goal-target').value) || 0;
    const current = parseFloat(document.getElementById('fin-goal-current').value) || 0;
    if (!name || !target) return;
    state.finGoals.push({ name, target, current });
    renderFinGoals();
    document.getElementById('fin-goal-name').value = '';
    document.getElementById('fin-goal-target').value = '';
    document.getElementById('fin-goal-current').value = '';
  }

  function renderFinGoals() {
    const list = document.getElementById('fin-goals-list');
    list.innerHTML = '';
    state.finGoals.forEach(g => {
      const pct = Math.min(100, Math.round((g.current / g.target) * 100));
      const div = document.createElement('div');
      div.className = 'progress-row';
      div.innerHTML = `<div class="progress-header"><strong>${g.name}</strong><span>€${g.current.toLocaleString()} / €${g.target.toLocaleString()}</span></div><div class="progress-bar"><div class="progress-fill fill-teal" style="width:${pct}%"></div></div>`;
      list.appendChild(div);
    });
  }

  function addGoal() {
    const title = document.getElementById('goal-title').value.trim();
    const cat = document.getElementById('goal-cat').value;
    const deadline = document.getElementById('goal-deadline').value;
    if (!title) return;
    state.goals.push({ title, cat, deadline, done: false, id: Date.now() });
    document.getElementById('goal-title').value = '';
    document.getElementById('goal-deadline').value = '';
    renderGoals();
    updateDashboard();
  }

  function toggleGoal(id) {
    const goal = state.goals.find(g => g.id === id);
    if (goal) { goal.done = !goal.done; renderGoals(); updateDashboard(); }
  }

  function renderGoals() {
    const active = document.getElementById('goals-active');
    const done = document.getElementById('goals-done');
    active.innerHTML = '';
    done.innerHTML = '';
    let activeCount = 0, doneCount = 0;
    const catColors = { Gym: 'green', Education: 'blue', Finance: 'teal', Mindset: 'orange', Career: 'blue', Health: 'green', Other: 'blue' };
    state.goals.forEach(g => {
      const div = document.createElement('div');
      div.className = 'goal-card';
      div.innerHTML = `<div class="goal-check ${g.done ? 'done' : ''}" onclick="toggleGoal(${g.id})">${g.done ? '✓' : ''}</div><div class="goal-text"><div class="goal-title ${g.done ? 'done' : ''}">${g.title}</div><div class="goal-cat">${g.cat}${g.deadline ? ' · ' + g.deadline : ''}</div></div><span class="badge ${catColors[g.cat] || 'blue'}">${g.cat}</span>`;
      if (g.done) { done.appendChild(div); doneCount++; }
      else { active.appendChild(div); activeCount++; }
    });
    if (activeCount === 0) active.innerHTML = '<div style="color: var(--muted); font-size: 13px; padding: 12px 0; text-align: center;">No active goals — add some</div>';
    if (doneCount === 0) done.innerHTML = '<div style="color: var(--muted); font-size: 13px; padding: 12px 0; text-align: center;">None completed yet</div>';
    document.getElementById('active-count').textContent = activeCount;
    document.getElementById('done-count').textContent = doneCount;
  }

  function updateDashboard() {
    document.getElementById('stat-gym').textContent = state.gymSessions.length;
    const inProgress = state.eduEntries.filter(e => e.progress < 100).length;
    document.getElementById('stat-edu').textContent = inProgress;
    const rate = state.finances.income > 0 ? Math.round((state.finances.saved / state.finances.income) * 100) : 0;
    document.getElementById('stat-save').textContent = rate + '%';
    const done = state.goals.filter(g => g.done).length;
    document.getElementById('stat-goals').textContent = done + '/' + state.goals.length;
  }

  function updateStreak() {
    const today = new Date().toDateString();
    const unique = [...new Set(state.activityDates)];
    let streak = 0;
    const now = new Date();
    for (let i = 0; i < 30; i++) {
      const d = new Date(now);
      d.setDate(d.getDate() - i);
      if (unique.includes(d.toDateString())) streak++;
      else if (i > 0) break;
    }
    document.getElementById('streak-count').textContent = streak;
    document.getElementById('streak-badge').textContent = streak + ' day streak';
  }

  function updateHeatmap() {
    const hm = document.getElementById('heatmap');
    hm.innerHTML = '';
    const now = new Date();
    for (let i = 90; i >= 0; i--) {
      const d = new Date(now);
      d.setDate(d.getDate() - i);
      const ds = d.toDateString();
      const count = state.activityDates.filter(x => x === ds).length;
      const cell = document.createElement('div');
      cell.className = 'heat-cell' + (count === 0 ? '' : count === 1 ? ' l1' : count === 2 ? ' l2' : count === 3 ? ' l3' : ' l4');
      hm.appendChild(cell);
    }
  }

  function quickAsk(q) {
    document.getElementById('chat-input').value = q;
    sendMsg();
  }

  function handleKey(e) {
    if (e.key === 'Enter' && !e.shiftKey) { e.preventDefault(); sendMsg(); }
  }

  async function sendMsg() {
    const input = document.getElementById('chat-input');
    const msg = input.value.trim();
    if (!msg) return;
    input.value = '';
    appendMsg('user', msg);
    const typing = appendTyping();
    try {
      const resp = await fetch('https://api.anthropic.com/v1/messages', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          model: 'claude-sonnet-4-20250514',
          max_tokens: 1000,
          system: getSystemPrompt(),
          messages: chatHistory.concat([{ role: 'user', content: msg }])
        })
      });
      const data = await resp.json();
      const reply = data.content?.map(c => c.text || '').join('') || 'Something went wrong. Try again.';
      typing.remove();
      appendMsg('mentor', reply);
      chatHistory.push({ role: 'user', content: msg });
      chatHistory.push({ role: 'assistant', content: reply });
      if (chatHistory.length > 20) chatHistory = chatHistory.slice(-20);
    } catch(e) {
      typing.remove();
      appendMsg('mentor', 'Connection issue. Check your network and try again.');
    }
  }

  let chatHistory = [];

  function appendMsg(who, text) {
    const area = document.getElementById('chat-area');
    const div = document.createElement('div');
    div.className = 'msg ' + who;
    const avatar = who === 'mentor' ? '<div class="msg-avatar mentor">⚡</div>' : '<div class="msg-avatar user">YOU</div>';
    div.innerHTML = avatar + `<div class="msg-bubble">${text.replace(/\n/g, '<br>')}</div>`;
    area.appendChild(div);
    area.scrollTop = area.scrollHeight;
    return div;
  }

  function appendTyping() {
    const area = document.getElementById('chat-area');
    const div = document.createElement('div');
    div.className = 'msg mentor';
    div.innerHTML = '<div class="msg-avatar mentor">⚡</div><div class="msg-bubble"><div class="typing-indicator"><div class="typing-dot"></div><div class="typing-dot"></div><div class="typing-dot"></div></div></div>';
    area.appendChild(div);
    area.scrollTop = area.scrollHeight;
    return div;
  }

  updateHeatmap();
  updateDashboard();
</script>
</body>
</html>
