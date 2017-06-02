<?php

define( 'PDO_DSN', 'pgsql:host=databases-pg;port=5432;dbname=comedor' );
define( 'PDO_USER', 'us_comedor' );
define( 'PDO_PASS', 'saalu9Wu' );
define( 'PASSWORD', '123' );

ini_set( 'session.use_cookies', 0 );
ini_set( 'session.use_only_cookies', 0 );
ini_set( 'session.use_trans_sid', 1 );
ini_set( 'arg_separator.output', '&amp;' );

session_start();

?>
<!doctype html>
<html>
<head>
<meta charset="utf-8"/>
<title>SQL Console</title>
<style>

body
{
	background: #fff;
	margin: 1em;
}

body,
.Queries,
.Submit
{
	font-family: monospace; color: #333;
}

.Buttons
{
	margin-top: 1em;
}

.Error
{
	color: #800;
	font-weight: bolder;
}

.Query
{
	margin-top: 1em;
	border-top: 1px solid #f0f0f0;
}

.Name,
.Value
{
	padding: .5em .75em;
}

.Name
{
	text-align: left;
}

.Row
{
	background: #f0f0f0;
}

.Row:nth-child(odd)
{
	background: #e8e8e8;
}

</style>
</head>
<body>
<?php

class Sql
{
	/** Database handle */
	private $db;

	/**
	 * Connect to database or just return true if already connected
	 *
	 * @param $dsn - DSN
	 * @param $user - user name
	 * @param $pass - password
	 */
	public function connect( $dsn, $user, $pass )
	{
		try
		{
			if( $this->db ||
				($this->db = new PDO(
					PDO_DSN,
					PDO_USER,
					PDO_PASS )) )
				return true;
		}
		catch( PDOException $e )
		{
?>
<div class="Error">
<p>Error: <?= $e->getMessage() ?></p>
</div>
<?
			exit();
		}

		return false;
	}

	/**
	 * Query database
	 *
	 * @param $q - SQL query
	 * @param ... - arguments
	 */
	public function query( $q )
	{
		$a = func_get_args();
		array_shift( $a );

		$s = $this->db->prepare( $q );

		return $s->execute( $a ) ? $s : null;
	}

	/**
	 * Dump error info
	 */
	public function errorInfo()
	{
		$a = $this->db->errorInfo();
		return $a[2];
	}
}

/**
 * Convert all applicable characters to HTML entities
 *
 * @param $string - UTF8 string
 */
function htmlEncode( $string )
{
	return htmlentities(
		$string,
		ENT_QUOTES | ENT_IGNORE, "UTF-8" );
}

/**
 * Split a string by string and respect quoting
 *
 * @param $delimiter - delimiter character
 * @param $string - string to explode
 */
function quotedExplode( $delimiter, $string )
{
	$tokens = array();

	$last = 0;
	$quote = "";

	for( $p = 0, $l = strlen( $string );
		$p < $l;
		++$p )
	{
		// skip escaped characters
		if( $string{$p} == '\\' )
		{
			++$p;
			continue;
		}

		if( !$quote &&
			($quote = strchr( "'\"", $string{$p} )) )
			$quote = $quote{0};
		else if( $quote == $string{$p} )
			$quote = "";

		if( !$quote &&
			$string{$p} == $delimiter )
		{
			array_push(
				$tokens,
				substr( $string, $last, $p-$last ) );

			$last = $p+1;
		}
	}

	return $tokens;
}

/**
 * Run queries
 *
 * @param $queries - query strings
 */
function run( $queries )
{
	if( !$queries )
		return;

	$sql = new Sql();

	if( !$sql->connect() )
	{
?>
<div class="Error">
<p>Error: cannot connect.</p>
</div>
<?php
	}

	foreach( quotedExplode( ';', trim( $queries ) ) as $q )
	{
		$q .= ';'

?>
<div class="Query">
<pre><?= $q ?></pre>
<?php

		if( !($result = $sql->query( $q )) )
		{
?>
</div>
<div class="Error">
<pre><?= $sql->errorInfo() ?></pre>
</div>
<?php
			continue;
		}

?>
<table class="ResultTable">
<?php
		for( $header = false;
			($row = $result->fetch()); )
		{
			if( !$header )
			{
?>
<tr class="Headers">
<?php
				foreach( $row as $k => $v )
				{
					if( is_numeric( $k ) )
						continue;
?>
<th class="Name"><?= htmlEncode( $k ) ?></th>
<?php
				}
?>
</tr>
<?php
				$header = true;
			}

?>
<tr class="Row">
<?php
			foreach( $row as $k => $v )
			{
				if( is_numeric( $k ) )
					continue;
?>
<td class="Value"><?= htmlEncode( $v ) ?></td>
<?php
			}
?>
</tr>
<?php
		}
?>
</table>
</div>
<?php
	}
}

if( $_REQUEST['password'] == PASSWORD )
	$_SESSION['authenticated'] = true;

if( $_SESSION['authenticated'] )
{
	if( $_REQUEST['run'] )
		$queries = $_REQUEST['queries'];

?>
<form action="?" method="POST" class="Form">
<textarea
	class="Queries"
	name="queries"
	cols="80"
	rows="10"><?= htmlEncode( $queries ) ?></textarea>
<div class="Buttons"><input
	class="Submit"
	type="submit"
	name="run"
	value="Run"/></div>
</form>
<?php

	run( $queries );
}
else
{
?>
<p>Please use a secure connection (HTTPS).
Otherwise your password will be transmitted in plain text.</p>
<form action="?" method="POST" class="Form">
<input
	class="Password"
	name="password"
	type="password"/>
<div class="Buttons"><input
	class="Submit"
	type="submit"
	name="login"
	value="Login"/></div>
</form>
<?php
}

?>
</body>
</html>
