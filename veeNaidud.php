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
else if (isset($_GET['kulmVesi']) && !empty($_GET['kulmVesi'])){
    $findBy = "vesi/kulmVesi";
    $find = $_GET['kulmVesi'];
}
else if (isset($_GET['soeVesi']) && !empty($_GET['soeVesi'])){
    $findBy = "vesi/soeVesi";
    $find = $_GET['soeVesi'];
}
else if (isset($_GET['makstud']) && !empty($_GET['makstud'])){
    $findBy = "makstud";
    $find = strtolower($_GET['makstud']);
    if ($find === "jah" || $find === "1" || $find === "true"){
        $find = "1";
    }
    else if($find === "ei" || $find === "0" || $find === "false"){
        $find = "0";
    }
    else{
        $findBy = null;
        $find = null;
    }
}
if ($findBy === "kuupaev"){
    $root = $xml->documentElement;
    $filteredDocument = new DOMDocument('1.0', 'UTF-8');
    $filteredDocument->formatOutput = true;
    $newRoot = $filteredDocument->createElement('veeNaidud');
    $filteredDocument->appendChild($newRoot);
    $veeNaideList = $root->getElementsByTagName('veeNaide');
    foreach ($veeNaideList as $veeNaide) {
        $kuupaev = $veeNaide->getElementsByTagName('kuupaev')->item(0);
        if ($kuupaev) {
            $dateValue = $kuupaev->nodeValue;
            if ($dateValue >= $find) {
                $importedNode = $filteredDocument->importNode($veeNaide, true);
                $newRoot->appendChild($importedNode);
            }
        }
    }
    $xml = $filteredDocument;
}
else if ($findBy !== null){
    $xpath = new DOMXPath($xml);
    $xpath->registerNamespace('xsl', 'http://www.w3.org/1999/XSL/Transform');
    if ($findBy === "vesi/kulmVesi" || $findBy === "vesi/soeVesi"){
        $query = "//veeNaidud/veeNaide[$findBy >= '$find']";
    }
    else{
        $query = "//veeNaidud/veeNaide[$findBy = '$find']";
    }
    $filteredXML = $xpath->query($query);
    $filteredDocument = new DOMDocument;
    $xml = $filteredDocument->createElement("veeNaidud");
    foreach ($filteredXML as $node) {
        $xml->appendChild($filteredDocument->importNode($node, true));
    }
    $xml = $filteredDocument->appendChild($xml);
}
echo $proc->transformToXml($xml);