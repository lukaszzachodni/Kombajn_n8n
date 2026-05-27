# Kombajn n8n

Zestaw narzędzi do automatyzacji AI zawierający:
- **n8n**: Automatyzacja przepływów pracy.
- **Ollama**: Lokalny serwer LLM.
- **ComfyUI**: Interfejs graficzny dla Stable Diffusion.

## Uruchomienie

1. Upewnij się, że masz zainstalowanego Dockera i Docker Compose.
2. Sklonuj repozytorium (jeśli jeszcze tego nie zrobiłeś).
3. Uruchom kontenery:
   ```bash
   docker compose up -d
   ```

## Dostęp do usług

- **n8n**: [http://localhost:5678](http://localhost:5678)
- **Ollama API**: [http://localhost:11434](http://localhost:11434)
- **ComfyUI**: [http://localhost:8188](http://localhost:8188)

## GPU (Wymagane dla akceleracji)

Projekt jest skonfigurowany pod karty NVIDIA. Aby akceleracja sprzętowa działała w Dockerze, musisz mieć zainstalowany:
1. Sterowniki NVIDIA.
2. [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html).

