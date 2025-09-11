// script.js - Task Manager logic

document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('task-form');
  const input = document.getElementById('task-input');
  const list = document.getElementById('task-list');
  const filterNav = document.querySelector('.filters');
  const filterBtns = document.querySelectorAll('.filter-btn');
  const darkToggle = document.getElementById('dark-mode-toggle');

  // Dark mode persistence
  function setDarkMode(enabled) {
    document.body.classList.toggle('dark', enabled);
    darkToggle.classList.toggle('active', enabled);
    darkToggle.setAttribute('aria-pressed', enabled ? 'true' : 'false');
    darkToggle.innerText = enabled ? '☀️' : '🌙';
    if (window.localStorage) {
      localStorage.setItem('darkMode', enabled ? '1' : '0');
    }
  }
  // Load dark mode preference
  if (window.localStorage) {
    const darkPref = localStorage.getItem('darkMode');
    setDarkMode(darkPref === '1');
  }
  darkToggle.addEventListener('click', () => {
    const enabled = !document.body.classList.contains('dark');
    setDarkMode(enabled);
  });

  let tasks = [];
  let filter = 'all'; // all, completed, pending

  // Load tasks from localStorage
  if (window.localStorage) {
    const saved = localStorage.getItem('tasks');
    if (saved) tasks = JSON.parse(saved);
  }

  function saveTasks() {
    if (window.localStorage) {
      localStorage.setItem('tasks', JSON.stringify(tasks));
    }
  }

  function getFilteredTasks() {
    if (filter === 'completed') return tasks.filter(t => t.completed);
    if (filter === 'pending') return tasks.filter(t => !t.completed);
    return tasks;
  }

  function renderTasks() {
    list.innerHTML = '';
    const filtered = getFilteredTasks();
    if (filtered.length === 0) {
      const li = document.createElement('li');
      li.textContent = 'No tasks yet.';
      li.setAttribute('aria-live', 'polite');
      li.style.textAlign = 'center';
      list.appendChild(li);
      return;
    }
    filtered.forEach((task, idx) => {
      // Find the index in the main tasks array
      const realIdx = tasks.indexOf(task);
      const li = document.createElement('li');
      li.className = 'task-item' + (task.completed ? ' completed' : '');
      li.setAttribute('role', 'listitem');
      li.tabIndex = 0;
      li.innerHTML = `
        <span>${task.text}</span>
        <div class="task-actions">
          <button class="action complete" aria-label="Mark as ${task.completed ? 'incomplete' : 'completed'}" title="${task.completed ? 'Mark as incomplete' : 'Mark as completed'}">✔️</button>
          <button class="action delete" aria-label="Delete task" title="Delete">🗑️</button>
        </div>
      `;
      // Complete button
      li.querySelector('.complete').onclick = () => {
        tasks[realIdx].completed = !tasks[realIdx].completed;
        saveTasks();
        renderTasks();
      };
      // Delete button
      li.querySelector('.delete').onclick = () => {
        tasks.splice(realIdx, 1);
        saveTasks();
        renderTasks();
      };
      list.appendChild(li);
    });
  }

  form.onsubmit = (e) => {
    e.preventDefault();
    const text = input.value.trim();
    if (!text) {
      input.value = '';
      input.setAttribute('aria-invalid', 'true');
      input.focus();
      return;
    }
    input.setAttribute('aria-invalid', 'false');
    tasks.push({ text, completed: false });
    input.value = '';
    saveTasks();
    renderTasks();
  };

  // Filter button logic
  filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      filterBtns.forEach(b => {
        b.classList.remove('active');
        b.setAttribute('aria-pressed', 'false');
      });
      btn.classList.add('active');
      btn.setAttribute('aria-pressed', 'true');
      filter = btn.getAttribute('data-filter');
      renderTasks();
    });
  });

  renderTasks();
});
