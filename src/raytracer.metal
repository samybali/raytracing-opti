#include <metal_stdlib>
using namespace metal;

// Le mot-clé "kernel" indique que cette fonction est le point d'entrée d'un Compute Shader
kernel void render_kernel(
    // La texture de sortie où l'on va écrire la couleur du pixel
    texture2d<float, access::write> outTexture [[texture(0)]],
    // L'identifiant unique 2D du thread (équivalent de tes variables i et j dans la boucle for CPU)
    uint2 id [[thread_position_in_grid]]
) {
    // 1. Vérification des limites (au cas où la grille est plus grande que l'image)
    if (id.x >= outTexture.get_width() || id.y >= outTexture.get_height()) {
        return;
    }

    // 2. Normalisation des coordonnées (u, v) de 0.0 à 1.0
    float u = float(id.x) / float(outTexture.get_width() - 1);
    float v = float(id.y) / float(outTexture.get_height() - 1);

    // 3. Calcul de la couleur (Pour l'instant, un simple dégradé de test pour valider l'architecture)
    float3 pixel_color = float3(u, v, 0.2);

    // 4. Écriture du pixel dans la mémoire vidéo (VRAM)
    outTexture.write(float4(pixel_color, 1.0), id);
}