xquery version "3.0";

let $content := request:get-data()
let $login := xmldb:login( "/db/sqbl/encuestas", "admin", "" )
let $id := concat(util:uuid(),'.xml')
let $store := xmldb:store( "/db/sqbl/encuestas", $id, $content)
return $content
