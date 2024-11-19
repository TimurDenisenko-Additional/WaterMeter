<?php
$xml = new DOMDocument;
$xml->load('XML/veeNaidud.xml');

$xslt = new DOMDocument;
$xslt->load('XML/veeNaidud.xslt');

$proc = new XSLTProcessor;
$proc->importStyleSheet($xslt);

$findBy = null;
$find = null;

if (isset($_GET['email']) && !empty($_GET['email'])){
    $findBy = "@email";
    $find = trim($_GET['email']);
}
else if (isset($_GET['aadress']) && !empty($_GET['aadress'])){
    $findBy = "aadress";
    $find = $_GET['aadress'];
}
else if (isset($_GET['korterinumber']) && !empty($_GET['korterinumber'])){
    $findBy = "korterinumber";
    $find = $_GET['korterinumber'];
}
else if (isset($_GET['kuupaev']) && !empty($_GET['kuupaev'])){
    $findBy = "kuupaev";
    $find = $_GET['kuupaev'];
}
if ($findBy !== null){
    $xpath = new DOMXPath($xml);
    $xpath->registerNamespace('xsl', 'http://www.w3.org/1999/XSL/Transform');
    $query = "//veeNaidud/veeNaide[$findBy = '$find']";
    $filteredXML = $xpath->query($query);
    $filteredDocument = new DOMDocument;
    $xml = $filteredDocument->createElement("veeNaidud");
    foreach ($filteredXML as $node) {
        $xml->appendChild($filteredDocument->importNode($node, true));
    }
    $xml = $filteredDocument->appendChild($xml);
}
echo $proc->transformToXml($xml);
 ?>