module.exports = {
  mode: "jit",
  purge: ["../lib/*_web/**/*.*ex", "./js/**/*.js"],
  variants: {
    extend: {
      backgroundColor: ["disabled"],
      borderColor: ["disabled"],
      borderWidth: ["disabled"],
      boxShadow: ["disabled"],
      textColor: ["disabled"],
      pointerEvents: ["disabled"],
    },
  },
  theme: {
    fontSize: {
      sm: ".875rem",
      md: "1rem",
      lg: "1.5rem",
      xl: "2.25rem",
    },
    letterSpacing: {
      tighter: "-.04em",
      tight: "-.02em",
      normal: "0em",
      wide: ".02em",
      wider: ".04em",
      widest: ".1em",
    },
    extend: {
      backgroundOpacity: {
        90: "0.90",
      },
      borderWidth: {
        2.5: "2.5px",
        3: "3px",
      },
      screens: {
        xs: "480px",
      },
      fontFamily: {
        sans: ["Montserrat"],
        mono: ["Source Code Pro"],
      },
      inset: {
        "-2": "-0.5rem",
        "-6": "-1.5rem",
      },
      lineHeight: {
        tighter: "1.125",
      },
      height: {
        34: "8.5rem",
      },
      width: {
        34: "8.5rem",
      },
      colors: {
        gray: {
          DEFAULT: "#666",
          200: "#424242",
          900: "#A8A8A8",
        },
        bubblegum: "#FF6492",
        mint: "#08E97D",
        pink: "#FF90B2",
        magenta: "#E50F54",
        fuchsia: "#BE1D4D",
        nero: "#282828",
        night: "#333333",
        iron: "#525252",
        charcoal: "#454545",
        "vt-gray": "#666666",
        steel: "#A0A0A0",
        smoke: "#F1F1F1",
        white: "#FFFFFF",
        mortar: "#454545",
        silver: "#C7C7C7",
        darkGray: "#A3A3A3",
        highlight: "#FFEEEE",
        lightCharcoal: "#626262",
      },
      outline: {
        pink: "1px solid #FFEEEE",
      },
      ringWidth: {
        3: "3px",
      },
      boxShadow: {
        nero: "4px 4px 0px #282828",
        fuchsia: "6px 6px 0px #BE1D4D",
        magenta: "4px 4px 0px #E50F54",
        "inset-fuchsia": "inset 6px 6px 0px rgba(0,0,0,0.12)",
        "inset-silver": "inset 6px 6px 0px #C7C7C7",
        gray: "4px 4px 0px rgba(0, 0, 0, 0.25)",
        "inset-gray": "inset 4px 4px 0px rgba(0, 0, 0, 0.25)",
        "right-bubblegum": "inset -4px 0px 0px #FF6492",
        "lower-bubblegum": "0px 2px 0px #FF6492",
      },
    },
  },
  plugins: [],
};
