## V2.0 Development

- Make changes to [tps/2.0/index.html](tps/2.0/index.html)
- Build a new image with the tag `formation-nginx:2.0`

```bash
export VERSION="2.0"
docker image build -t formation-nginx:$VERSION tps/$VERSION
```