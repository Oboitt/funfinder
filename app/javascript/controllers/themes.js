document.addEventListener('DOMContentLoaded', function() {
  const themeCards = document.querySelectorAll('.theme-card');
  const selectedThemesInput = document.getElementById('selected_themes');

  themeCards.forEach((card) => {
    card.addEventListener('click', function() {
      card.classList.toggle('selected');

      const selectedThemes = Array.from(themeCards)
        .filter((card) => card.classList.contains('selected'))
        .map((card) => card.dataset.themeId);

      selectedThemesInput.value = selectedThemes.join(',');
    });
  });
});
