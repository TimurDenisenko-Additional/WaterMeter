<?php
$xml = new DOMDocument;
$xml->load('XML/veeNaidud.xml');

$xslt = new DOMDocument;
$xslt->load('XML/veeNaidud.xslt');

$proc = new XSLTProcessor;
$proc->importStyleSheet($xslt);

$findBy = null;
$find = null;

if (isRequires("email")){
    $findBy = "@".$findBy;
    $find = trim($find);
    comparisonFilter();
}
else if (isRequires("aadress")){
    comparisonFilter();
}
else if (isRequires("korterinumber")){
    comparisonFilter();
}
else if (isRequires("kuupaev")){
    relativityFilter();
}
else if (isRequires("kulmVesi")){
    $findBy = "vesi/".$findBy;
    comparisonFilter();
}
else if (isRequires("soeVesi")){
    $findBy = "vesi/".$findBy;
    comparisonFilter();
}
else if (isRequires("makstud")){
    $find = strtolower($find);
    if ($find === "jah" || $find === "1" || $find === "true"){
        $find = "1";
    }
    else if($find === "ei" || $find === "false"){
        $find = "0";
    }
    else{
        $findBy = null;
        $find = null;
        return;
    }
    comparisonFilter();
}
if (isRequires("exportFile", false)) {
    header('Content-Type: application/json');
    header('Content-Disposition: attachment; filename="data.json"');
    header('Content-Length: ' . filesize("data.json"));
    readfile("data.json");
    exit;
}
if ($_SERVER["REQUEST_METHOD"] == "POST"){
    if (isset($_FILES['importFile']) && $_FILES['importFile']['error'] == UPLOAD_ERR_OK) {
        jsonToXML();
    } else {
        http_response_code(400);
    }
}
echo $proc->transformToXml($xml);

function jsonToXML(){
    $uploadedFile = $_FILES['importFile']['tmp_name'];
    $jsonContent = file_get_contents($uploadedFile);
    $data = json_decode($jsonContent, true);
    if (!is_array($data) || empty($data)) {
        http_response_code(400);
    }
    $xmlFile = 'XML/veeNaidud.xml'; 
    global $xml;
    $xml = new SimpleXMLElement(file_get_contents($xmlFile));
    foreach ($data['veeNaide'] as $item) {
        if (!isset($item['@attributes']['email'], $item['aadress'], $item['korterinumber'], $item['kuupaev'], $item['vesi']['kulmVesi'], $item['vesi']['soeVesi'], $item['makstud'])) {
            continue;
        }
        $email = htmlspecialchars($item['@attributes']['email']);
        $existingEmails = $xml->xpath("//veeNaide[@email='{$email}']");
        if (!empty($existingEmails)) {
            continue;
        }
        $entry = $xml->addChild('veeNaide');
        $entry->addAttribute('email', $email);
        $entry->addChild('aadress', htmlspecialchars($item['aadress']));
        $entry->addChild('korterinumber', htmlspecialchars($item['korterinumber']));
        $entry->addChild('kuupaev', htmlspecialchars($item['kuupaev']));
        $vesi = $entry->addChild('vesi');
        $vesi->addChild('kulmVesi', htmlspecialchars($item['vesi']['kulmVesi']));
        $vesi->addChild('soeVesi', htmlspecialchars($item['vesi']['soeVesi']));
        $entry->addChild('makstud', htmlspecialchars($item['makstud']));
    }
    file_put_contents($xmlFile, $xml->asXML());
}

function comparisonFilter(){
    global $xml;
    global $findBy;
    global $find;
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
    file_put_contents('data.json', json_encode(simplexml_import_dom($xml), JSON_PRETTY_PRINT));
}

function relativityFilter(){
    global $xml;
    global $find;
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
    file_put_contents('data.json', json_encode(simplexml_import_dom($xml), JSON_PRETTY_PRINT));
}

function isRequires($inputName, $isFilter = true){
    $isSet = isset($_GET[$inputName]) && !empty($_GET[$inputName]);
    if(!$isSet){
        return false;
    }
    if (!$isFilter){
        return $isSet;
    }
    global $findBy;
    global $find;
    $findBy = $inputName;
    $find = $_GET[$inputName];
    return true;
}