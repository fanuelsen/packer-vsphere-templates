echo "==> Getting latest ubuntu iso url"
url_1804=http://cdimage.ubuntu.com/releases/18.04/release/
iso_1804=$(curl "$url_1804" | grep server-amd64.iso | sed -E 's/^.+href="([^"]+)".+$/\1/' | head -1)
sha256_1804=$(curl "$url_1804/SHA256SUMS" | grep server-amd64.iso | cut -f 1 -d ' ')

url_2004=http://cdimage.ubuntu.com/ubuntu-legacy-server/releases/20.04/release/
iso_2004=$(curl "$url_2004" | grep server-amd64.iso | sed -E  's/^.+href="([^"]+)".+$/\1/' | head -1 )
sha256_2004=$(curl "$url_2004/SHA256SUMS" | grep server-amd64.iso | sort -r | head -1 | cut -f 1 -d ' ')

echo "==> Getting latest windows iso url"
url_win2019=https://www.microsoft.com/en-US/evalcenter/evaluate-windows-server-2019?filetype=ISO
iso_win2019=$(curl "$url_win2019" | grep .iso | grep en-us | sed -ne 's/.*\(https[^"]*\).*/\1/p' | sed 's/&quot;//g' | sed ':%s/^M//g' )

echo "==> Populate iso variable"
cat > isovars.json <<EOF
{
  "iso_url_1804": "$url_1804$iso_1804",
  "iso_checksum_1804": "$sha256_1804",
  "iso_url_2004": "$url_2004$iso_2004",
  "iso_checksum_2004": "$sha256_2004",
  "iso_url_win2019": "$iso_win2019",
  "iso_checksum_type": "sha256"
}
EOF
