## Ethereum two-node private network

- Node Pool
  - RPC Port 16001, Username: user, Password: pass
- Node Bob
  - RPC Port 16002, Username: user, Password: pass

### Addresses

- Pool:  0xfbecb64c03c1f2cf36f39b6bfe4024f019292cbe
- Bob:   0x3cb81ed948a6ec3eedddcf1576d406a19d44ad73

### To run this image with internal ports exposed at host:

```bash
docker run -it -d -p 11001:11001 -p 11002:11002 coinfoundry/ethereum-private-testnet
```

### Generating blocks:

```bash
docker exec -i -t <container_id> /usr/bin/bitcoin-cli -datadir=/data/node-pool generate 1
```

### Example RPC against Node-Pool:

```bash
curl --user user:pass --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: application/json;' http://127.0.0.1:16001/
```
