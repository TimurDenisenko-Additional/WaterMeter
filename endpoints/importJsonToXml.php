<?php

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST'); 

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['error' => 'Only POST requests are allowed']);
    exit();
}

if (!isset($_FILES['importFile']) || $_FILES['importFile']['error'] !== UPLOAD_ERR_OK) {
    http_response_code(400);
    echo json_encode(['error' => 'No file uploaded or file upload error']);
    exit();
}

function jsonToXML($uploadedFile)
{
    $jsonContent = file_get_contents($uploadedFile);
    $data = json_decode($jsonContent, true);

    if (!is_array($data) || empty($data)) {
        http_response_code(400);
        echo json_encode(['error' => 'Invalid or empty JSON data']);
        exit();
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

jsonToXML($_FILES['importFile']['tmp_name']);

http_response_code(200);
echo json_encode(['success' => 'File processed successfully']);
