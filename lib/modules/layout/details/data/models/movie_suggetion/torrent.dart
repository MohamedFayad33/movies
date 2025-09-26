class Torrent {
  String? url;
  String? hash;
  String? quality;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  num? seeds;
  num? peers;
  String? size;
  num? sizeBytes;
  String? dateUploaded;
  num? dateUploadedUnix;

  Torrent({
    this.url,
    this.hash,
    this.quality,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Torrent.fromJson(Map<String, dynamic> data) {
    return Torrent(
      url: data['url'] as String?,
      hash: data['hash'] as String?,
      quality: data['quality'] as String?,
      isRepack: data['is_repack'] as String?,
      videoCodec: data['video_codec'] as String?,
      bitDepth: data['bit_depth'] as String?,
      audioChannels: data['audio_channels'] as String?,
      seeds: data['seeds'] as num?,
      peers: data['peers'] as num?,
      size: data['size'] as String?,
      sizeBytes: data['size_bytes'] as num?,
      dateUploaded: data['date_uploaded'] as String?,
      dateUploadedUnix: data['date_uploaded_unix'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'hash': hash,
      'quality': quality,
      'is_repack': isRepack,
      'video_codec': videoCodec,
      'bit_depth': bitDepth,
      'audio_channels': audioChannels,
      'seeds': seeds,
      'peers': peers,
      'size': size,
      'size_bytes': sizeBytes,
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
    };
  }
}
