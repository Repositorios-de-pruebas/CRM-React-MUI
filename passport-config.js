const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require("bcrypt");

function initialize(connection, passport) {
  const authenticateUser = async (username, password, done) => {
    connection.query('SELECT * FROM accounts WHERE username = ?', [username], async (error, results) => {
      if (error) {
        return done(error);
      }

      if (results.length > 0) {
        const user = results[0];
        try {
          // Verificar contraseña
          if (await bcrypt.compare(password, user.password)) {
            return done(null, {
              id: user.id,
              username: user.username
            });
          } else {
            return done(null, false, { message: "Wrong password" });
          }
        } catch (e) {
          return done(e);
        }
      } else {
        return done(null, false, { message: "User not found" });
      }
    });
  };

  passport.use(new LocalStrategy(
    {
      usernameField: 'username', // Campo que contiene el nombre de usuario
      passwordField: 'password'  // Campo que contiene la contraseña
    },
    authenticateUser
  ));

  passport.serializeUser((user, done) => {
    done(null, user.id);
  });

  passport.deserializeUser((id, done) => {
    connection.query("SELECT * FROM accounts WHERE id = ?", [id], (err, results) => {
      if (err) {
        return done(err);
      }
      return done(null, results[0]);
    });
  });
}

module.exports = initialize;
