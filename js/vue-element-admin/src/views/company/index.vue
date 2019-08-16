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

    <div class="result-container">
      <div id="result-stats">Page 1 of about 120 results</div>

      <el-col :xs="16" :sm="16" :md="16" :lg="12" :xl="12">
        <el-card class="result-card" shadow="hover">
          <div slot="header" class="clearfix">
            <span>{{ this.rowData.name }}</span>

            <el-popover placement="right" width="600" trigger="click">
              <el-table :data="rowData.finance">
                <el-table-column width="150" property="marketcap" label="Market Cap" />
                <el-table-column width="150" property="equity" label="Equity" />
                <el-table-column width="150" property="cash" label="Cash" />
              </el-table>
              <el-button slot="reference" class="button-finance" type="text">Finance</el-button>
            </el-popover>

            <el-popover placement="right" width="600" trigger="click">
              <div style="font-size: 16px; word-break: normal;">{{ this.rowData.over_view }}</div>
              <el-button slot="reference" class="button-overview" type="text">Over View</el-button>
            </el-popover>
          </div>
          <div class="card-main">
            <p style="white-space: normal;">{{ this.rowData.product_line }}</p>
          </div>
        </el-card>

        <el-card class="result-card" shadow="hover">
          <div slot="header" class="clearfix">
            <span>{{ this.rowData.name }}</span>
            <el-button class="button-finance" type="text">Finance</el-button>
            <el-button class="button-overview" type="text">Over View</el-button>
          </div>
          <div class="card-main">
            <p style="white-space: normal;">{{ this.rowData.product_line }}</p>
          </div>
        </el-card>

        <el-card class="result-card" shadow="hover">
          <div slot="header" class="clearfix">
            <span>{{ this.rowData.name }}</span>
            <el-button class="button-finance" type="text">Finance</el-button>
            <el-button class="button-overview" type="text">Over View</el-button>
          </div>
          <div class="card-main">
            <p style="white-space: normal;">{{ this.rowData.product_line }}</p>
          </div>
        </el-card>

        <el-pagination background layout="prev, pager, next" :total="100" />
      </el-col>
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
        over_view: 'Toyota Motor Corporation is a Japanese multinational automotive manufacturer headquartered in Toyota, Aichi, Japan. In 2017, Toyotas corporate structure consisted of 364,445 employees worldwide and, as of September 2018, was the sixth-largest company in the world by revenue.',
        finance: [{ marketcap: 1000000, equity: 3000, cash: 2000 }]
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
  }
}
</script>

<style scoped>
.filter-container {
  border-bottom: 1px solid #ebebeb;
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
  margin-bottom: 15px;
}
.card-main {
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
