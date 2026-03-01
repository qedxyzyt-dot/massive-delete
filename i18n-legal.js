/* i18n-legal.js — Shared language switcher for the site pages */
(function() {
  var lang = (navigator.language || 'en').toLowerCase();
  var L = lang.startsWith('pt') ? 'pt' : lang.startsWith('es') ? 'es' : 'en';

  var nav = {
    pt: { navHome: 'Início', navPrivacy: 'Privacidade', navTerms: 'Termos', navContact: 'Contato',
          e404Msg: 'Esta página não existe — ou talvez já tenha sido excluída.',
          e404Link: 'Voltar ao início' },
    es: { navHome: 'Inicio', navPrivacy: 'Privacidad', navTerms: 'Términos', navContact: 'Contacto',
          e404Msg: 'Esta página no existe — o quizás ya fue eliminada.',
          e404Link: 'Volver al inicio' }
  };

  if (L === 'en') return;
  var dict = nav[L];
  if (!dict) return;

  // Update html lang
  document.documentElement.lang = L === 'pt' ? 'pt-BR' : 'es';

  // Update page titles
  var titleMap = {
    pt: {
      'Privacy Policy': 'Política de Privacidade',
      'Terms of Service': 'Termos de Serviço',
      '404': '404'
    },
    es: {
      'Privacy Policy': 'Política de Privacidad',
      'Terms of Service': 'Términos de Servicio',
      '404': '404'
    }
  };
  var title = document.title;
  for (var en in titleMap[L]) {
    if (title.indexOf(en) >= 0) {
      document.title = title.replace(en, titleMap[L][en]);
      break;
    }
  }

  // Switch data-i18n text
  document.querySelectorAll('[data-i18n]').forEach(function(el) {
    var key = el.getAttribute('data-i18n');
    if (dict[key]) el.textContent = dict[key];
  });

  // Switch data-lang blocks (legal pages: privacy, terms)
  var blocks = document.querySelectorAll('[data-lang]');
  if (blocks.length > 1) {
    blocks.forEach(function(el) {
      el.style.display = el.getAttribute('data-lang') === L ? '' : 'none';
    });
  }
})();
