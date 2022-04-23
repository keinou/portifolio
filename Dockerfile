FROM cirrusci/flutter AS build

WORKDIR /app
COPY pubspec.* ./
COPY . .
RUN dart pub get

RUN flutter build web



FROM nginx:stable-alpine

COPY --from=build /app/build/web /usr/share/nginx/html

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 80
STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]