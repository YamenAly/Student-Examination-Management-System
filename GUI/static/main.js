// Global utility functions shared across pages
document.addEventListener('DOMContentLoaded', () => {
  // Animate elements on load
  document.querySelectorAll('.portal-card, .exam-card, .admin-card').forEach((el, i) => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(16px)';
    setTimeout(() => {
      el.style.transition = 'opacity .35s ease, transform .35s ease';
      el.style.opacity = '1';
      el.style.transform = 'none';
    }, i * 80);
  });
});
