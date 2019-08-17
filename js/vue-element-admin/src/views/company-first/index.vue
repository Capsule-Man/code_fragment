<template>
  <div class="app-container">

    <div class="filter-container">
      <el-row>
        <el-input placeholder="Words ... " class="search-input" />
        <el-button class="search-button" type="primary" icon="el-icon-search">Search</el-button>
        <el-button type="primary" icon="el-icon-setting" @click="dialogTableVisible = true">Advanced</el-button>
        <el-dialog
          v-el-drag-dialog
          :visible.sync="dialogTableVisible"
          title="Advanced Filtering"
          @dragDialog="handleDrag"
        />
      </el-row>
    </div>

    <div id="result-stats">Page 1 of about 120 results</div>
    <el-row>
      <el-col :xs="16" :sm="16" :md="16" :lg="10" :xl="12">
        <el-card v-bind:key="i" v-for="i in [1,2,3,4,5,6,7,8,9]" class="result-card" shadow="hover">
          <div slot="header" class="card-header">
            <div class="name">{{ rowData.name }}</div>
            <div class="homepage"> 
              <a target="_blank" :href="rowData.homepage">{{ rowData.homepage }}</a>
            </div>
            <div class="similarity">
              <el-rate
                v-model="rowData.similarity * 5"
                disabled
                show-score
                text-color="#777"
                score-template="{value} / 5.0 similarity">
                >
              </el-rate>
            </div>
          </div>
          <div class="card-main">
            <p style="white-space: normal;">{{ rowData.over_view.slice(0, 240) + ' ...' }}</p>
          </div>

        </el-card>
      </el-col>
    </el-row>

    <div class="pagination-container">
      <el-pagination background layout="prev, pager, next" :total="100" />
    </div>

  </div>
</template>

<script>
import elDragDialog from '@/directive/el-drag-dialog'

export default {
  name: 'Company',
  directives: { elDragDialog },
  data() {
    return {
      dialogTableVisible: false,
      rowData: {
        name: 'Toyota Motors',
        product_line: 'Consistent with real life: in line with the process and logic of real life, and comply with languages and ...',
        over_view: 'Toyota Motor Corporation is a Japanese multinational automotive manufacturer headquartered in Toyota, Aichi, Japan. In 2017, Toyotas corporate structure consisted of 364,445 employees worldwide[4] and, as of September 2018, was the sixth-largest company in the world by revenue. As of 2017, Toyota is the largest automotive manufacturer. Toyota was the worlds first automobile manufacturer to produce more than 10 million vehicles per year which it has done since 2012, when it also reported the production of its 200-millionth vehicle.[5] As of July 2014, Toyota was the largest listed company in Japan by market capitalization (worth more than twice as much as number 2-ranked SoftBank)[6] and by revenue.',
        finance: [{ marketcap: 1000000, equity: 3000, cash: 2000 }],
        homepage: 'https://toyota.jp/index.html',
        similarity: '0.76'

      }
    }
  },
  methods: {
    handleChange(val) {
      console.log(val)
    },
    handleDrag() {
      this.$refs.select.blur()
    }
  },
  filters: {
    adjustSim(similarity) {
      return similarity * 5
    }
  }
}
</script>

<style scoped>
.filter-container {
  border-bottom: 1px solid #ebebeb;
}
.pagination-container {
  padding: 16px 32px;
}
.search-input {
  width: 400px;
  margin-right: 15px;
}
#result-stats {
  color: #777;
  line-height: 43px;
}
.result-card {
  border: none;
  margin-bottom: 15px;
}
.card-header .name {
    margin-bottom: 6px;
    font-size: 20px;
    color: #1a0dab;
}
.card-header .homepage {
    margin-bottom: 6px;
}
.card-header .homepage a {
    font-size: 16px;
    color: #006621;
}
.card-main {
  line-height: 24px;
  font-size: 14px;
  color: #545454;
}
.button-overview {
  float: right;
  padding: 3px 12px 3px 0;
}
.button-finance {
  float: right;
  color: #ffa500;
  padding: 3px 0;
}
</style>
