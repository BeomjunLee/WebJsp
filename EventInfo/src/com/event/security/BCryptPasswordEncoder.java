package com.event.security;


import java.security.SecureRandom;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BCryptPasswordEncoder implements PasswordEncoder {
	private Pattern BCRYPT_PATTERN = Pattern
			.compile("\\A\\$2(a|y|b)?\\$(\\d\\d)\\$[./0-9A-Za-z]{53}");
	
	private final int strength;
	private final BCryptVersion version;

	private final SecureRandom random;


	public BCryptPasswordEncoder() {
		this(-1);
	}

	public BCryptPasswordEncoder(int strength) {
		this(strength, null);
	}

	public BCryptPasswordEncoder(BCryptVersion version) {
		this(version, null);
	}

	public BCryptPasswordEncoder(BCryptVersion version, SecureRandom random) {
		this(version, -1, random);
	}

	public BCryptPasswordEncoder(int strength, SecureRandom random) {
		this(BCryptVersion.$2A, strength, random);
	}

	public BCryptPasswordEncoder(BCryptVersion version, int strength) {
		this(version, strength, null);
	}

	public BCryptPasswordEncoder(BCryptVersion version, int strength, SecureRandom random) {
		if (strength != -1 && (strength < BCrypt.MIN_LOG_ROUNDS || strength > BCrypt.MAX_LOG_ROUNDS)) {
			throw new IllegalArgumentException("Bad strength");
		}
		this.version = version;
		this.strength = strength == -1 ? 10 : strength;
		this.random = random;
	}

	public String encode(CharSequence rawPassword) {
		if (rawPassword == null) {
			throw new IllegalArgumentException("rawPassword cannot be null");
		}

		String salt;
		if (random != null) {
			salt = BCrypt.gensalt(version.getVersion(), strength, random);
		} else {
			salt = BCrypt.gensalt(version.getVersion(), strength);
		}
		return BCrypt.hashpw(rawPassword.toString(), salt);
	}

	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		if (rawPassword == null) {
			throw new IllegalArgumentException("rawPassword cannot be null");
		}

		if (encodedPassword == null || encodedPassword.length() == 0) {
			return false;
		}

		if (!BCRYPT_PATTERN.matcher(encodedPassword).matches()) {
			return false;
		}

		return BCrypt.checkpw(rawPassword.toString(), encodedPassword);
	}

	@Override
	public boolean upgradeEncoding(String encodedPassword) {
		if (encodedPassword == null || encodedPassword.length() == 0) {
			return false;
		}

		Matcher matcher = BCRYPT_PATTERN.matcher(encodedPassword);
		if (!matcher.matches()) {
			throw new IllegalArgumentException("Encoded password does not look like BCrypt: " + encodedPassword);
		}
		else {
			int strength = Integer.parseInt(matcher.group(2));
			return strength < this.strength;
		}
	}

	public enum BCryptVersion {
		$2A("$2a"),
		$2Y("$2y"),
		$2B("$2b");

		private final String version;

		BCryptVersion(String version) {
			this.version = version;
		}

		public String getVersion() {
			return this.version;
		}
	}
}
