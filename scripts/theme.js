const darkModeQuery = window.matchMedia('(prefers-color-scheme: dark)');

function loadTheme() {
	var cssId = 'myCss';

	if (!document.getElementById(cssId)) {
		var head = document.getElementsByTagName('head')[0];
		var link = document.createElement('link');

		link.id = cssId;
		link.rel = 'stylesheet';
		link.type = 'text/css';
		link.media = 'all';

    		if (darkModeQuery.matches) {
			link.href = 'themes/dark.css';
		} else {
			link.href = 'themes/light.css';
		}

		head.appendChild(link);
	}
}

loadTheme();
darkModeQuery.addEventListener('change', loadTheme);
