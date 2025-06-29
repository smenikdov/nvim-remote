<template>
    <RowTextWithLabel
        left-part="Укажите дату"
        custom-right-part
        vertical
        required
    >
        <template v-slot:right>
            <InputDateDefault
                v-model="date"
                block-future-dates
                fill-mask
                required
                :rules="$rules.r_date"
            />
        </template>
    </RowTextWithLabel>
</template>

<script>
import RowTextWithLabel from 'components/RowTextWithLabel.vue';
import InputDateDefault from 'components/InputDateDefault.vue';

export default {
    name: 'DateInput',

    components: {
        RowTextWithLabel,
        InputDateDefault,
    },

    data() {
        return {
            date: '',
        };
    },

    computed: {
    },

    methods: {
    },
};
</script>

<style>
</style>


