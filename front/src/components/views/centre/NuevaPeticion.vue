<template>
  <div class="max-w-3xl mx-auto">
    <h1
      class="text-2xl font-semibold mb-6"
      style="
        color: var(--text-primary);
        text-transform: uppercase;
        letter-spacing: 0.5px;
        border-bottom: 2px solid var(--border-color);
        padding-bottom: 1rem;
      "
    >
      Nova Petició de Taller
    </h1>

    <div class="card p-8">
      <div class="space-y-5">
        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Selecciona Taller *
          </label>
          <select class="w-full">
            <option>Selecciona un taller...</option>
            <option>Robòtica Educativa</option>
            <option>Arts Plàstiques</option>
            <option>Ciències Experimentals</option>
          </select>
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Nombre d'Alumnes *
          </label>
          <input type="number" class="w-full" placeholder="Ex: 25" />
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Curs / Nivell
          </label>
          <input type="text" class="w-full" placeholder="Ex: 3r ESO" />
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Preferències de Dates
          </label>
          <textarea
            class="w-full"
            rows="3"
            placeholder="Indica les teves preferències de dates i horaris..."
          ></textarea>
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Comentaris Addicionals
          </label>
          <textarea
            class="w-full"
            rows="4"
            placeholder="Qualsevol informació addicional rellevant..."
          ></textarea>
        </div>

        <div
          class="flex gap-4"
          style="padding-top: 1.5rem; border-top: 1px solid var(--border-color)"
        >
          <button class="flex-1 btn-primary py-3">Enviar Petició</button>
          <button class="px-8 btn-outline py-3">Cancel·lar</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup></script>
