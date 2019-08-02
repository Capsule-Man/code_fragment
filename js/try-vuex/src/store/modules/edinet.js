import axios from 'axios'


export const edinet = {
    namespaced: true,
    state: {
        rowData: [],
        queryParams: {
            date: null,
            _limit: null
        }
    },
    getters: {
        getFilers: (state) => {
            return state.rowData.map(row => ( 
                { id: row.seqNumber, filer: row.filerName }
            ))}
    },
    mutations: {
        updateParams: (state, input) => {
            const { param, value } = input
            state.queryParams[param] = value
        },
        updateRowData: (state, rowData) => {
            state.rowData = rowData
        }
    },
    actions: {
        changedValue: ({ commit, state }, input) => {
            console.log(input)
            commit('updateParams', input)
            const url = 'http://localhost:3000/document'
            axios.get(url, {
                params: state.queryParams
              })
              .then((response) => {
                  commit('updateRowData', response.data)

              })
              .catch((error) => {
                  commit('updateRowData', null)
              })
        }
    }
}