<?php
$xml = new DOMDocument;
$xml->load('XML/veeNaidud.xml');

$xslt = new DOMDocument;
$xslt->load('XML/veeNaidud.xslt');

$proc = new XSLTProcessor;
$proc->importStyleSheet($xslt);

echo $proc->transformToXml($xml);
 ?>