# Hafif Alpine imajı kullanıyoruz
FROM alpine:latest

# Gerekli bağımlılıkları yüklüyoruz (ca-certificates SSL bağlantıları için şarttır)
RUN apk add --no-cache unzip ca-certificates wget sqlite

# PocketBase sürümü
ENV PB_VERSION=0.22.18

# PocketBase indir ve çıkart
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/ && rm /tmp/pb.zip

# Çalışma dizini
WORKDIR /pb

# Veri kalıcılığı için pb_data dizinini dışa açıyoruz
VOLUME /pb/pb_data

EXPOSE 8080

# PocketBase'i tüm arayüzleri dinleyecek şekilde başlatıyoruz
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
