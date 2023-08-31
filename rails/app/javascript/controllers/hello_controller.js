import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets=["prefecture","city","store"]
  static values={
    cities:Array,
    stores:Array,
    assessmentareas:Array,
    companies:Array
  }

  connect(){
    console.log(233333333)
    console.log(this.storesValue)
    console.log(this.assessmentareasValue)
    console.log(this.companiesValue)

    this.filter_city(1);
    this.filter_store(1);

  }

  greet() {
    console.log(11111)
  }

  filter_city(prefecture_id){
    this.cityTarget.innerHTML="";

    var options=this.citiesValue.filter((city)=>{
      return city.prefecture_id==prefecture_id;
    }).map((city)=>{
      var option=document.createElement("option");
      option.text=city.name;
      option.value=city.id;      
      return option
    })

    options.forEach(option => {
      this.cityTarget.appendChild(option);
    });
  }

  filter_store(city_id){
    this.storeTarget.innerHTML="";

    console.log("cityid")
    console.log(city_id)

    var assessment_store_ids=this.assessmentareasValue.filter((area)=>{
      return area.city_id==city_id;
    }).map((area)=>{
      return area.store_id;
    })
    console.log("store_ids--------");
    console.log(assessment_store_ids);

    var assessment_stores=this.storesValue.filter((store)=>{
      return assessment_store_ids.includes(store.id)
    })
    console.log("stores--------");
    console.log(assessment_stores);

    var assessment_company_ids=this.storesValue.filter((store)=>{
      return assessment_store_ids.includes(store.id)
    }).map((store)=>{
      return store.company_id;
    })
    console.log("comp_ids--------");
    console.log(assessment_company_ids);

    var assessment_companies=this.companiesValue.filter((company)=>{
      return assessment_company_ids.includes(company.id);
    })
    console.log("comp--------");
    console.log(assessment_companies);

    for(var i=0; i<assessment_stores.length;i++){
      if (assessment_stores[i].name === null ){
        var name=assessment_companies[i].name;
      }else{
        var name=assessment_companies[i].name+" "+assessment_stores[i].name;
      }
      
      var option=document.createElement("option");
      option.text=name;
      option.value=assessment_stores[i].id;
      this.storeTarget.appendChild(option);
    }
   
  }

  filter(){
    this.filter_city(this.prefectureTarget.value);
    this.filter_store(this.cityTarget.value);
  }
}
