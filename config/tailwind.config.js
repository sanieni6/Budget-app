const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        'nova': ['proxima-nova-bold', 'sans-serif'],
        'nova-l': ['proxima-nova-light', 'sans-serif'],
      },
      fontWeight: {
        headlines: ['bold'],
        general: ['light'],
      },
      colors: {
        'main': '#3778c2',
        'second': '#5fb523',
        'text': '#434b54',
        'text-light': '#f5f6f8',
        'text-m': '#86898e',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
